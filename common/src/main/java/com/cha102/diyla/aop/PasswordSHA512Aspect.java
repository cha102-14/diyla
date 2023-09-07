package com.cha102.diyla.aop;


import com.cha102.diyla.empmodel.EmpAccountAO;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpServletRequest;

import static com.cha102.diyla.util.SHAEncodeUtil.*;


@Aspect
@Component
public class PasswordSHA512Aspect {

    private byte[] setSaltArr = "SleepAndEat".getBytes();

    @Pointcut(value = "@annotation(com.cha102.diyla.aop.PasswordSHA512AspectChange)")
    public void pointcut(){

    }
    @Before("pointcut()")
    public void before(JoinPoint joinPoint) {
        Object[] args = joinPoint.getArgs();
        if (args.length > 0 && args[0] instanceof EmpAccountAO) {
            EmpAccountAO empAccountAO = (EmpAccountAO) args[0];
            String originalParamValue = empAccountAO.getEmpPassword();
            String hashPassword = hashPassword(originalParamValue, setSaltArr);

            if (originalParamValue != null) {
                // 修改参数值
                String modifiedParamValue = hashPassword;
                empAccountAO.setEmpPassword(modifiedParamValue);
            }
        }
    }

}

