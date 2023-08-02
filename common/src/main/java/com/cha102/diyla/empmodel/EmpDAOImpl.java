package com.cha102.diyla.empmodel;


import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class EmpDAOImpl implements EmpDAO {
    private static final String INSERT_STMT = "INSERT INTO employee (EMP_NAME,EMP_ACCOUNT,EMP_PASSWORD,EMP_STATUS) VALUES(?,?,?,?)";
    private  static final String UPDATE ="UPDATE employee set EMP_NAME=?,EMP_ACCOUNT=?,EMP_PASSWORD=?,EMP_STATUS=? WHERE EMP_ID=?";
    private  static final String DELETE ="DELETE FROM employee WHERE EMP_ID=? ";
    private  static final String GET_ALL_STMT ="SELECT EMP_ID,EMP_NAME,EMP_ACCOUNT,EMP_PASSWORD,EMP_STATUS FROM employee order by EMP_ID";
    private static final String GET_ONE = "SELECT * FROM employee WHERE EMP_ID = ?";
//    public static final String DRIVER = "com.mysql.cj.jdbc.Driver";
//    public static final String URL = "jdbc:mysql://localhost:3306/diyla?";
//
//    public static final String USER = "root";
//    public static final String PASSWORD = "sara0203";
    private  static DataSource ds = null;
    static {
        try {
            Context ctx = new InitialContext();
            ds = (DataSource) ctx.lookup("java:comp/env/jdbc/diyla");
        } catch (NamingException ne) {
            ne.printStackTrace();
        }
    }
//    static {
//        try {
//            Class.forName(DRIVER);
//        } catch (ClassNotFoundException cnfe) {
//            cnfe.printStackTrace();
//        }
//    }
    @Override
    public void insert(EmpVO empVO) {
        Connection con = null;
        PreparedStatement pstmt = null;
        try {
            con = ds.getConnection();
//            con = DriverManager.getConnection(URL, USER, PASSWORD);
            pstmt = con.prepareStatement(INSERT_STMT);

            pstmt.setString(1,empVO.getEmpName());
            pstmt.setString(2, empVO.getEmpAccount());
            pstmt.setString(3, empVO.getEmpPassword());
            pstmt.setBoolean(4, empVO.getEmpStatus());

            pstmt.executeUpdate();

        } catch (SQLException rte) {
            throw new RuntimeException("A database error occured. "+ rte.getMessage());
        } finally {
            closeResource(con,pstmt);
        }
    }
    @Override
    public void update(EmpVO empVO) {
        Connection con = null;
        PreparedStatement pstmt = null;
        try {
            con = ds.getConnection();
//            con = DriverManager.getConnection(URL,USER,PASSWORD);
            pstmt = con.prepareStatement(UPDATE);

            pstmt.setString(1,empVO.getEmpName());
            pstmt.setString(2, empVO.getEmpAccount());
            pstmt.setString(3, empVO.getEmpPassword());
            pstmt.setBoolean(4, empVO.getEmpStatus());
            pstmt.setInt(5,empVO.getEmpId());

            pstmt.executeUpdate();
        } catch (SQLException rte) {
            throw new RuntimeException("A database error occured. "+ rte.getMessage());
        }finally {
            closeResource(con, pstmt);
        }
    }
    @Override
    public void delete(Integer empId) {
        Connection con = null;
        PreparedStatement pstmt = null;
        try {
            con = ds.getConnection();
//            con = DriverManager.getConnection(URL,USER,PASSWORD);
            pstmt = con.prepareStatement(DELETE);

            pstmt.setInt(1,empId);
            pstmt.executeUpdate();

        } catch (SQLException rte) {
            throw new RuntimeException("A database error occured. "+ rte.getMessage());
        }finally {
            closeResource(con, pstmt);
        }
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

        try {
            con = ds.getConnection();
//            con = DriverManager.getConnection(URL,USER,PASSWORD);
            pstmt = con.prepareStatement(GET_ALL_STMT);
            rs = pstmt.executeQuery();

            while (rs.next()){
                empVO = new EmpVO();
                empVO.setEmpId(rs.getInt("EMP_ID"));
                empVO.setEmpName(rs.getString("EMP_NAME"));
                empVO.setEmpAccount(rs.getString("EMP_ACCOUNT"));
                empVO.setEmpPassword(rs.getString("EMP_PASSWORD"));
                empVO.setEmpStatus(rs.getBoolean("EMP_STATUS"));
                listEmp.add(empVO);
            }

        } catch (SQLException rte) {
            throw new RuntimeException("A database error occured. "+ rte.getMessage());
        }finally {
            closeResource(con, pstmt,rs);
        };
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
        EmpDAOImpl empDAO = new EmpDAOImpl();
//        EmpVO insertEmp = new EmpVO("wa","2","123",true);
//        empDAO.insert(insertEmp);

//        EmpVO update = new EmpVO("女王","root","123456",true,1);
//        empDAO.update(update);

//        empDAO.delete(2);

//        EmpVO getOne = empDAO.getOne(1);

        List<EmpVO> all = empDAO.getAll();

        System.out.println(all);
    }


}

