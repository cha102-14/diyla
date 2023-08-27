package com.cha102.diyla.empmodel;


import com.cha102.diyla.backstageauthmodel.BackStageAuthVO;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class EmpDAOImpl implements EmpDAO {
    private static final String INSERT_STMT = "INSERT INTO employee (EMP_NAME,EMP_ACCOUNT,EMP_PASSWORD,EMP_EMAIL,EMP_STATUS) VALUES(?,?,?,?,?)";
    private static final String INSERT_BACKSTAGEAUTH = "INSERT INTO backstage_auth (EMP_ID,AUTH_ID) VALUES(?,?)";
    private static final String UPDATE = "UPDATE employee set EMP_NAME=?,EMP_ACCOUNT=?,EMP_PASSWORD=?,EMP_EMAIL=?,EMP_STATUS=? WHERE EMP_ID=?";
    private static final String DELETE = "DELETE FROM employee WHERE EMP_ID=? ";
    private static final String CHECK_EMP_EMAIL_FOR_REGISTER = "SELECT count(1) FROM employee  WHERE EMP_EMAIL = ?";
    private static final String CHECK_FINAL_EMP_ACCOUNT_NUMBER = "SELECT EMP_ACCOUNT FROM employee ORDER BY EMP_ID DESC LIMIT 1;";
    private static final String GET_ALL_EMP = "SELECT EMP_ID,EMP_NAME,EMP_ACCOUNT,EMP_PASSWORD,EMP_EMAIL,EMP_STATUS FROM employee order by EMP_ID";
    private static final String GET_ALL_EMP_COUNT = "SELECT COUNT(1) FROM employee WHERE EMP_ID !=1 order by EMP_ID";
    private static final String GET_ONE = "SELECT * FROM employee WHERE EMP_ID = ?";
    // limit 1?,2? 代表從索引值1?開始查詢 查詢2?筆資料,此處設定用於分頁查詢筆數用
    private static final String GET_ALL_EMP_LIST = "SELECT DISTINCT(e.EMP_ID),e.EMP_NAME,e.EMP_ACCOUNT,e.EMP_EMAIL,f.TYPE_FUN FROM diyla.employee e JOIN diyla.backstage_auth a ON e.emp_id = a.EMP_ID JOIN diyla.backstage_fun f ON a.AUTH_ID = f.AUTH_ID WHERE e.emp_id != 1 ORDER BY e.emp_ID LIMIT ?,?";
    public static final String DRIVER = "com.mysql.cj.jdbc.Driver";
    public static final String URL = "jdbc:mysql://localhost:3306/diyla?";

    public static final String USER = "root";
    public static final String PASSWORD = "sara0203";
    private static DataSource ds = null;

    static {
        try {
            Context ctx = new InitialContext();
            ds = (DataSource) ctx.lookup("java:comp/env/jdbc/diyla");
        } catch (NamingException ne) {
            ne.printStackTrace();
        }
    }

    //        static {
//        try {
//            Class.forName(DRIVER);
//        } catch (ClassNotFoundException cnfe) {
//            cnfe.printStackTrace();
//        }
//    }

    public Connection getConnectionForTx() throws SQLException {
        return ds.getConnection();
    }

    @Override
    public Integer insertEmp(EmpVO empVO, Connection con) {
        PreparedStatement pstmt = null;
        // 變數取值前都要給予值 or null,最後return時才有初始化參數
        //並且return時要注意變數有效範圍,以免在return該變數時編譯錯誤
        Integer getAutoEmpId = null;
        //因為交易控制把原本的try catch resource改為try catch

        try {
//            con = DriverManager.getConnection(URL, USER, PASSWORD);
            pstmt = con.prepareStatement(INSERT_STMT, Statement.RETURN_GENERATED_KEYS);

            pstmt.setString(1, empVO.getEmpName());
            pstmt.setString(2, empVO.getEmpAccount());
            pstmt.setString(3, empVO.getEmpPassword());
            pstmt.setString(4, empVO.getEmpEmail());
            pstmt.setBoolean(5, empVO.getEmpStatus());
//            TODO 取得AutoIncrement的值並把取得的empId做return
            int insertRow = pstmt.executeUpdate();
            ResultSet rs = pstmt.getGeneratedKeys();
            // 新增比數 > 0 代表新增成功,再去做getAutoEmpId查詢

            if (insertRow > 0) {
                rs.next();
                getAutoEmpId = rs.getInt(1);
                return getAutoEmpId;
            }
        } catch (SQLException rte) {
            try {
                con.rollback();
            } catch (SQLException se) {
                se.printStackTrace();
            }
            throw new RuntimeException("A database error occured. " + rte.getMessage());
        }
        //此處調用了EmpDAOImpl的insertEmp方法,因此insertEmp最後返回的值getAutoEmpId等同於empId
        //此處getAutoEmpId返回值等同於empId,該返回值的insertEmp方法被EmpService調用
        return getAutoEmpId;
    }

    @Override
    public void insertBackStageAuthVO(List<BackStageAuthVO> backStageAuthVOList, Connection con) {
//      new出StringBuffer的物件 裡面放入SQL指令的字串

        PreparedStatement pstmt = null;
        // 變數取值前都要給予值 or null,最後return時才有初始化參數
        //並且return時要注意變數有效範圍,以免在return該變數時編譯錯誤
        Integer getAutoEmpId = null;
        //因為交易控制把原本的try catch resource改為try catch

        try {
            pstmt = con.prepareStatement(INSERT_BACKSTAGEAUTH);

            for (int i = 0; i < backStageAuthVOList.size(); i++) {
//              backStageAuthVOList.get(i) 為一個VO ,要從這個VO取值 要使用.get
//              先取得此物件的長度i值,再從i值的物件取得EmpId及AuthId
                pstmt.setInt(1, backStageAuthVOList.get(i).getEmpId());
                pstmt.setInt(2, backStageAuthVOList.get(i).getAuthId());
                pstmt.addBatch();
            }
            pstmt.executeBatch();
        } catch (SQLException rte) {
            try {
                con.rollback();
            } catch (SQLException se) {
                se.printStackTrace();
            }
            throw new RuntimeException("A database error occured. " + rte.getMessage());
        }
    }

    @Override
    public void updateEmp(EmpVO empVO) {
        Connection con = null;
        PreparedStatement pstmt = null;
        try {
            con = ds.getConnection();
//            con = DriverManager.getConnection(URL,USER,PASSWORD);
            pstmt = con.prepareStatement(UPDATE);

            pstmt.setString(1, empVO.getEmpName());
            pstmt.setString(2, empVO.getEmpAccount());
            pstmt.setString(3, empVO.getEmpPassword());
            pstmt.setString(4, empVO.getEmpEmail());
            pstmt.setBoolean(5, empVO.getEmpStatus());
            pstmt.setInt(6, empVO.getEmpId());

            pstmt.executeUpdate();
        } catch (SQLException rte) {
            throw new RuntimeException("A database error occured. " + rte.getMessage());
        } finally {
            closeResource(con, pstmt);
        }
    }

    @Override
    public void deleteEmp(Integer empId) {
        Connection con = null;
        PreparedStatement pstmt = null;
        try {
            con = ds.getConnection();
//            con = DriverManager.getConnection(URL,USER,PASSWORD);
            pstmt = con.prepareStatement(DELETE);

            pstmt.setInt(1, empId);
            pstmt.executeUpdate();

        } catch (SQLException rte) {
            throw new RuntimeException("A database error occured. " + rte.getMessage());
        } finally {
            closeResource(con, pstmt);
        }
    }

    @Override
    public String checkFinalAccountNumber() {
        String empLastAccountNumber = "";
        try (Connection con = ds.getConnection();
             PreparedStatement pstmt = con.prepareStatement(CHECK_FINAL_EMP_ACCOUNT_NUMBER);
             ResultSet rs = pstmt.executeQuery();
        ) {
            // rs 代表DB的指標,未打此欄時,指標位置在欄位名稱
            //要有rs.next() 在欄位名稱上的指標位置才會往下移動
            while (rs.next()) {
                empLastAccountNumber = rs.getString("EMP_ACCOUNT");
            }
            //"EMP_ACCOUNT"為 SQL語句查詢出的資料該欄位名稱
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return empLastAccountNumber;
    }

    @Override
    public Boolean checkEmpEmailForRegister(String empEmail) {

        int count = 0;
        try (Connection con = ds.getConnection();
             //取得連線
             PreparedStatement pstmt = con.prepareStatement(CHECK_EMP_EMAIL_FOR_REGISTER);) {
            // 執行SQL語句前先編譯SQL語句,通過Connection的prepareStatement()方法獲取prepareStatement對方
            //使用set XXX () 綁定參數值, XXX是參數資料類型
            pstmt.setString(1, empEmail);
            try (ResultSet rs = pstmt.executeQuery();) {
                while (rs.next()) {
                    count = count + rs.getInt("count(1)");
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return count > 0;
    }

    @Override
    public EmpVO getOne(Integer empId) {

        EmpVO emp = null;
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            con = ds.getConnection();
//            con = DriverManager.getConnection(URL, USER, PASSWORD);
            pstmt = con.prepareStatement(GET_ONE);
            pstmt.setInt(1, empId);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                emp = new EmpVO();
                emp.setEmpId(rs.getInt("EMP_ID"));
                emp.setEmpName(rs.getString("EMP_NAME"));
                emp.setEmpAccount(rs.getString("EMP_ACCOUNT"));
                emp.setEmpPassword(rs.getString("EMP_PASSWORD"));
                emp.setEmpEmail(rs.getString("EMP_EMAIL"));
                emp.setEmpStatus(rs.getBoolean("EMP_STATUS"));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            closeResource(con, pstmt, rs);
        }
        return emp;
    }

    @Override
    public List<EmpVO> getAll() {
        List<EmpVO> listEmp = new ArrayList<EmpVO>();
        EmpVO empVO = null;

        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

//           Connection con = ds.getConnection();
//             PreparedStatement pstmt = con.prepareStatement(GET_ALL_STMT);
//             ResultSet rs = pstmt.executeQuery()){
        try {
            con = ds.getConnection();
//            pstmt = con.prepareStatement(GET_ALL_STMT);
//          TODO 8/20 完成查詢員工列表功能
            pstmt = con.prepareStatement(GET_ALL_EMP_LIST);
            rs = pstmt.executeQuery();
//            con = DriverManager.getConnection(URL,USER,PASSWORD);
//            pstmt = con.prepareStatement(GET_ALL_STMT);
//            rs = pstmt.executeQuery();

            while (rs.next()) {
                empVO = new EmpVO();
                empVO.setEmpId(rs.getInt("EMP_ID"));
                empVO.setEmpName(rs.getString("EMP_NAME"));
                empVO.setEmpAccount(rs.getString("EMP_ACCOUNT"));
                empVO.setEmpPassword(rs.getString("EMP_PASSWORD"));
                empVO.setEmpEmail(rs.getString("EMP_EMAIL"));
                empVO.setEmpStatus(rs.getBoolean("EMP_STATUS"));
                listEmp.add(empVO);
            }

        } catch (SQLException rte) {
            throw new RuntimeException("A database error occured. " + rte.getMessage());
        } finally {
            closeResource(con, pstmt, rs);
        }
        ;
        return listEmp;
    }

    private void closeResource(Connection con, PreparedStatement pstmt, ResultSet rs) {
        if (rs != null) {
            try {
                rs.close();
            } catch (SQLException rse) {
                rse.printStackTrace(System.err);
            }
        }
        if (pstmt != null) {
            try {
                pstmt.close();
            } catch (SQLException pse) {
                pse.printStackTrace(System.err);
            }
        }
        if (con != null) {
            try {
                con.close();
            } catch (SQLException cone) {
                cone.printStackTrace(System.err);
            }
        }
    }

    private void closeResource(Connection con, PreparedStatement pstmt) {
        if (pstmt != null) {
            try {
                pstmt.close();
            } catch (SQLException pse) {
                pse.printStackTrace(System.err);
            }
        }
        if (con != null) {
            try {
                con.close();
            } catch (SQLException cone) {
                cone.printStackTrace(System.err);
            }
        }
    }

    public static void main(String[] args) {
//        EmpDAOImpl empDAO = new EmpDAOImpl();
//        EmpVO insertEmp = new EmpVO("貓貓", "3", "123", "333@gmail.com", true);
//        empDAO.insertEmp(insertEmp);
//        System.out.println(insertEmp);
//
//        EmpVO update = new EmpVO("汪汪", "師傅", "123456", "123@yahoo.com.tw", false, 3);
//        empDAO.updateEmp(update);
//        System.out.println(update);
//
//        empDAO.deleteEmp(4);
//
//        EmpVO getOne = empDAO.getOne(1);
//        System.out.println(getOne);
//
//        List<EmpVO> all = empDAO.getAll();
//        System.out.println(all);
//        }
    }

}

