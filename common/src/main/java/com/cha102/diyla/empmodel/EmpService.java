package com.cha102.diyla.empmodel;

import com.cha102.diyla.backstageauthmodel.BackStageAuthVO;
import com.cha102.diyla.enums.AuthFunEnum;
import org.apache.commons.validator.routines.EmailValidator;
import org.springframework.util.ObjectUtils;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.regex.Pattern;

public class EmpService {

    private static final String EMP_ACCOUNT_FIRST_WORD = "D";

    public static boolean emailValidator(String email) {
        // 獲取一個 `EmailValidator` 實例
        EmailValidator validator = EmailValidator.getInstance();

        // 驗證包含電子郵件地址的指定字符串
        if (!validator.isValid(email)) {
            return false;
        }
        return true;
    }

//    public static void main(String[] args) {
//        String email = "this\\ still\"not\\allowed@example.com";
//
//        // 驗證電子郵件地址
//        if (emailValidator(email)) {
//            System.out.println("The email address " + email + " is valid");
//        } else {
//            System.out.println("The email address " + email + " is invalid");
//        }
//    }

    //  EmpDAO daoImpl 物件在之前的流程有做Email是否重複檢查及最後員工帳號取得,要帶著此物件繼續往下走流程,
//  EmpVO empVO, 為insert.jsp裡新增員工資訊之物件
//  String authFun 為下拉式選單之物件
    public void empInsert(EmpDAO daoImpl, EmpVO empVO, String authFun) {
//        EmpVO empVO = insertValidEmpParam(errorMsgs, empName, empAccount, empPassword, empEmail, empStatus);
//        if (!ObjectUtils.isEmpty(errorMsgs) || ObjectUtils.isEmpty(empVO)) {
//            return errorMsgs;
//        }
//        EmpVO empVO = new EmpVO(empName, empAccount, empPassword, empEmail, empStatus);
        // 透過方法查詢到員工帳號最後一筆
        String lastEmpAccount = daoImpl.checkFinalAccountNumber();
        if (ObjectUtils.isEmpty(lastEmpAccount) || "root".equalsIgnoreCase(lastEmpAccount)) {
            lastEmpAccount = "D100000";
        }
        // 取得員工最新帳號字串後,使用substring 從索引值1切割至lastEmpAccount最後長度
        String lastEmpAccountNumStr = lastEmpAccount.substring(1, lastEmpAccount.length());
        //將切割後取得數字部分的字串轉為Integer後+1 ,再將EMP_ACCOUNT_FIRST_WORD 的D加回 指定給newEmpAccount
        String newEmpAccount = EMP_ACCOUNT_FIRST_WORD + String.valueOf(Integer.valueOf(lastEmpAccountNumStr) + 1);
        // 將 newEmpAccount 取得的新值 insert至EmpAccount
        empVO.setEmpAccount(newEmpAccount);
//      String[] lastEmpAccountNumber = input.split("[^0-9]+");
//TODO   4.查詢後insert至authority(綁交易機制)
        Connection connection = null;
        //因為交易控制把原本的try catch resource改為try catch,並把此處的連線傳入insertBackStageAuthType作其中一個參數傳入EmpDAOImpl的insertEmp
//        及EmpService的insertBackStageAuthType
        try {
            connection = daoImpl.getConnectionForTx();
            //設定為false關閉自動commit機制
            connection.setAutoCommit(false);
            //此處調用了EmpDAOImpl的insertEmp方法,因此insertEmp最後返回的值getAutoEmpId等同於empId
            //將empID insert至empVO,寫入BackStageAuthVO及EmpInsertController  2張表
            Integer empId = daoImpl.insertEmp(empVO, connection);
            //TODO 取得的empID比對insert.jsp選取的TYPE_FUN中文相同value英文 將其AUTH_ID新增至該EMP_ID並寫入BACKSTAGE_AUTH
            List<BackStageAuthVO> backStageAuthVOList = insertBackStageAuthType(authFun, empId, connection);

            daoImpl.insertBackStageAuthVO(backStageAuthVOList, connection);

            connection.commit();
        } catch (Exception e) {
            try {
                connection.rollback();
            } catch (SQLException ex) {
                throw new RuntimeException(ex);
            }
            throw new RuntimeException(e);
        } finally {
            if (connection != null) {
                try {
                    connection.setAutoCommit(true);
                    connection.close();
                } catch (SQLException se) {
                    se.printStackTrace();
                }
            }
        }

    }

    // TODO 將EMP_ID及AUTH_ID寫入BackStageAuthVO

    //        EMP_ID 透過 Integer empId = daoImpl.insertEmp(empVO, connection); 新增AI(自增主鍵) 值時查詢並取出
    public List<BackStageAuthVO> insertBackStageAuthType(String authFun, Integer empId, Connection con) {
        List<BackStageAuthVO> backStageAuthList = new ArrayList<>();


//        透過AuthFunEnum.getAuthFunByAuthId拿到AUTH_ID list
        List<Integer> authIdList = AuthFunEnum.getAuthFunByAuthId(authFun);
//        再跑FOR EACH迴圈將authIdList裡的authId拿出
        for (Integer authId : authIdList) {
//          製造一個裝EMP_ID 及 AUTH_ID的BackStageAuthVO袋子
            BackStageAuthVO backStageAuthVO = new BackStageAuthVO();
            backStageAuthVO.setEmpId(empId);
            backStageAuthVO.setAuthId(authId);
//            放入後再將物件放入BackStageAuthVOList並寫入DB
            backStageAuthList.add(backStageAuthVO);
        }
        return backStageAuthList;
    }


    public EmpVO insertValidEmpParam(byte[] empPic, EmpDAO daoImpl, Map<String, String> errorMsgMap, String empName, String empAccount, String empPassword,
                                     String empEmail, Boolean empStatus) {
        // 驗證
        if (ObjectUtils.isEmpty(empName)) {
            errorMsgMap.put("empName", "請輸入管理員名稱");
        } else {
            empName = empName.trim();
            if (empName.length() > 10) {
                errorMsgMap.put("empName", "管理員名稱不得超過10個字");
            }
        }
        if (ObjectUtils.isEmpty(empPassword)) {
            errorMsgMap.put("empPassword", "請輸入管理員密碼");
            // TODO 英數字混合 符合6~12碼
        } else {
            empPassword = empPassword.trim();
            if (empPassword.matches("^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]{6,12}$")) {
            } else {
                System.out.println("請輸入6-12碼英數字混合密碼");
            }
        }

        // TODO e-mail驗證(正則表達式)
        if (ObjectUtils.isEmpty(empEmail)) {
            errorMsgMap.put("empEmail","請輸入管理員Email");
        } else {
            empEmail = empEmail.trim();
            if (!EmailValidator.getInstance().isValid(empEmail)) {
                errorMsgMap.put("empEmail","Email格式不正確");
            } else {
                Boolean isDuplicate = daoImpl.checkEmpEmailForRegister(empEmail);
                if (isDuplicate) {
                    errorMsgMap.put("empEmail","Email重複");
                }
            }
        }

//        if (ObjectUtils.isEmpty(empStatus)) {
//
//            errorMsgMap.put("empStatus","請輸入管理員狀態");
//        }
        return new EmpVO(empName, empPic, empAccount, empPassword, empEmail, empStatus);
//       此處為call by reference ,不需return errorMsgs但有透過記憶體位置有操作到heap的物件
    }


    public EmpVO empGetOne(List<String> errorMsgs, String empIdStr) {
        Integer empId = getOneValidEmpParam(empIdStr);
        if (empId <= 0) {
            errorMsgs.add("請輸入正確管理員編號");
            return null;
        }
        EmpDAOImpl dao = new EmpDAOImpl();
        EmpVO empVO = dao.getOne(empId);
        return empVO;
    }

    /**
     * 驗證EmpGetOneController傳入的id輸入是否為數字
     *
     * @param empIdStr
     */
    private Integer getOneValidEmpParam(String empIdStr) {
        if (!ObjectUtils.isEmpty(empIdStr)) {
            empIdStr = empIdStr.trim();
            if (Pattern.compile("^[0-9]*$").matcher(empIdStr).matches()) {
                return Integer.valueOf(empIdStr);
            }
        }
        return -1;
    }

    public static void main(String[] args) {
        int c = 1;
        int d = 2;
        int xxx = add(c, d);
    }

    public static int add(int a, int b) {
        return a + b;
    }
};
