package com.cha102.diyla.aop;


import com.cha102.diyla.empmodel.EmpAccountAO;
import com.cha102.diyla.empmodel.EmpVO;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Component;
import org.springframework.util.ObjectUtils;


import static com.cha102.diyla.util.SHAEncodeUtil.*;


@Aspect
@Component
public class PasswordSHA512Aspect {

    private byte[] setSaltArr = "SleepAndEat".getBytes();

    @Pointcut(value = "@annotation(com.cha102.diyla.aop.PasswordSHA512AspectChange)")
    public void pointcut() {

    }

    @Before("pointcut()")
    public void before(JoinPoint joinPoint) {
//        此API的路徑請求時 帶有的參數皆可拿到
        Object[] args = joinPoint.getArgs();
        String hashPassword = null;
        String hashDoublePassword = null;
        if (args.length > 0 && args[0] instanceof EmpAccountAO) {
            EmpAccountAO empAccountAO = (EmpAccountAO) args[0];
            String originalParamValue = empAccountAO.getEmpPassword();
            String originalDoublePasswordParamValue = empAccountAO.getDoubleCheckPassword();
            if (ObjectUtils.isEmpty(empAccountAO.getEmpPassword())) {
                empAccountAO.setEmpPassword("");
            } else {
                if (!ObjectUtils.isEmpty(empAccountAO.getDoubleCheckPassword()) &&
                        ObjectUtils.nullSafeEquals(empAccountAO.getEmpPassword(), empAccountAO.getDoubleCheckPassword())) {
                    hashDoublePassword = hashPassword(originalDoublePasswordParamValue, setSaltArr);
                }
                hashPassword = hashPassword(originalParamValue, setSaltArr);
            }

            if (originalParamValue != null) {
                // 修改参数值
                String modifiedParamValue = hashPassword;
                empAccountAO.setEmpPassword(modifiedParamValue);
            }
            if (originalDoublePasswordParamValue != null) {
                // 修改参数值
                empAccountAO.setDoubleCheckPassword(hashDoublePassword);
            }
        }
    }

}

