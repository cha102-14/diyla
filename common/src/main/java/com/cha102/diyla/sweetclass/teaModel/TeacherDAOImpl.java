package com.cha102.diyla.sweetclass.teaModel;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class TeacherDAOImpl implements TeacherDAO {
    private static DataSource ds = null;
    static {
        try {
            Context ctx = new InitialContext();
            ds = (DataSource) ctx.lookup("java:comp/env/jdbc/TestDB2");
        } catch (NamingException e) {
            e.printStackTrace();
        }
    }
    private static final String INSERT_STMT =
            "INSERT INTO teacher (emp_id, tea_name, tea_gender, tea_phone, tea_intro, tea_pic, tea_email, tea_status) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
    private static final String GET_ALL_STMT =
            "SELECT tea_id, emp_id, tea_name, tea_gender, tea_phone, tea_intro, tea_pic, tea_email, tea_status FROM teacher order by tea_id";
    private static final String GET_ONE_STMT =
            "SELECT tea_id, emp_id, tea_name, tea_gender, tea_phone, tea_intro, tea_pic, tea_email, tea_status FROM teacher where tea_id = ?";
    private static final String DELETE =
            "DELETE FROM teacher where tea_id = ?";
    private static final String UPDATE =
            "UPDATE teacher SET emp_id=?, tea_name=?, tea_gender=?, tea_phone=?, tea_intro=?, tea_pic=?, tea_email=?, tea_status=? WHERE tea_id = ?";
    private static final String GET_TEA_SPECIALITY =
            "SELECT s.SPE_NAME FROM tea_speciality ts JOIN speciality s ON ts.SPE_ID = s.SPE_ID WHERE ts.TEA_ID = ?";

    @Override
    public int insert(TeacherVO teacherVO) {
        Connection con = null;
        PreparedStatement pstmt = null;

        try {

            con = ds.getConnection();
            pstmt = con.prepareStatement(INSERT_STMT, Statement.RETURN_GENERATED_KEYS); // 設定 RETURN_GENERATED_KEYS

            pstmt.setInt(1, teacherVO.getEmpId());
            pstmt.setString(2, teacherVO.getTeaName());
            pstmt.setInt(3, teacherVO.getTeaGender());
            pstmt.setString(4, teacherVO.getTeaPhone());
            pstmt.setString(5, teacherVO.getTeaIntro());
            pstmt.setBytes(6, teacherVO.getTeaPic());
            pstmt.setString(7, teacherVO.getTeaEmail());
            pstmt.setInt(8, teacherVO.getTeaStatus());
            pstmt.executeUpdate();

            ResultSet generatedKeys = pstmt.getGeneratedKeys();
            generatedKeys.next();
            int generatedKey = generatedKeys.getInt(1); // 取得生成的pk
            return generatedKey;
            // Handle any SQL errors
        } catch (SQLException se) {
            throw new RuntimeException("A database error occured. "
                    + se.getMessage());
            // Clean up JDBC resources
        } finally {
            if (pstmt != null) {
                try {
                    pstmt.close();
                } catch (SQLException se) {
                    se.printStackTrace(System.err);
                }
            }
            if (con != null) {
                try {
                    con.close();
                } catch (Exception e) {
                    e.printStackTrace(System.err);
                }
            }
        }
    }

    @Override
    public void update(TeacherVO teacherVO) {
        Connection con = null;
        PreparedStatement pstmt = null;

        try {

            con = ds.getConnection();
            pstmt = con.prepareStatement(UPDATE);

            pstmt.setInt(1, teacherVO.getEmpId());
            pstmt.setString(2, teacherVO.getTeaName());
            pstmt.setInt(3, teacherVO.getTeaGender());
            pstmt.setString(4, teacherVO.getTeaPhone());
            pstmt.setString(5, teacherVO.getTeaIntro());
            pstmt.setBytes(6, teacherVO.getTeaPic());
            pstmt.setString(7, teacherVO.getTeaEmail());
            pstmt.setInt(8, teacherVO.getTeaStatus());
            pstmt.setInt(9, teacherVO.getTeaId());
            pstmt.executeUpdate();

            // Handle any driver errors
        } catch (SQLException se) {
            throw new RuntimeException("A database error occured. "
                    + se.getMessage());
            // Clean up JDBC resources
        } finally {
            if (pstmt != null) {
                try {
                    pstmt.close();
                } catch (SQLException se) {
                    se.printStackTrace(System.err);
                }
            }
            if (con != null) {
                try {
                    con.close();
                } catch (Exception e) {
                    e.printStackTrace(System.err);
                }
            }
        }
    }

    @Override
    public void delete(Integer teaID) {
        Connection con = null;
        PreparedStatement pstmt = null;

        try {

            con = ds.getConnection();
            pstmt = con.prepareStatement(DELETE);

            pstmt.setInt(1, teaID);

            pstmt.executeUpdate();

            // Handle any driver errors
        } catch (SQLException se) {
            throw new RuntimeException("A database error occured. "
                    + se.getMessage());
            // Clean up JDBC resources
        } finally {
            if (pstmt != null) {
                try {
                    pstmt.close();
                } catch (SQLException se) {
                    se.printStackTrace(System.err);
                }
            }
            if (con != null) {
                try {
                    con.close();
                } catch (Exception e) {
                    e.printStackTrace(System.err);
                }
            }
        }
    }

    @Override
    public TeacherVO findByPrimaryKey(Integer teaID) {
        TeacherVO teacherVO = null;
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {

            con = ds.getConnection();
            pstmt = con.prepareStatement(GET_ONE_STMT);

            pstmt.setInt(1, teaID);

            rs = pstmt.executeQuery();

            while (rs.next()) {
                teacherVO = new TeacherVO();
                teacherVO.setTeaId(rs.getInt("tea_id"));
                teacherVO.setEmpId(rs.getInt("emp_id"));
                teacherVO.setTeaName(rs.getString("tea_name"));
                teacherVO.setTeaGender(rs.getInt("tea_gender"));
                teacherVO.setTeaPhone(rs.getString("tea_phone"));
                teacherVO.setTeaIntro(rs.getString("tea_intro"));
                teacherVO.setTeaPic(rs.getBytes("tea_pic"));
                teacherVO.setTeaEmail(rs.getString("tea_email"));
                teacherVO.setTeaStatus(rs.getInt("tea_status"));
            }

            // Handle any driver errors
        } catch (SQLException se) {
            throw new RuntimeException("A database error occured. "
                    + se.getMessage());
            // Clean up JDBC resources
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException se) {
                    se.printStackTrace(System.err);
                }
            }
            if (pstmt != null) {
                try {
                    pstmt.close();
                } catch (SQLException se) {
                    se.printStackTrace(System.err);
                }
            }
            if (con != null) {
                try {
                    con.close();
                } catch (Exception e) {
                    e.printStackTrace(System.err);
                }
            }
        }
        return teacherVO;
    }
    public List<String> getTeacherSpeciality(Integer teaID) {
        List<String> specialities = new ArrayList<String>();
        try(
                Connection con = ds.getConnection();
                PreparedStatement pstmt = con.prepareStatement(GET_TEA_SPECIALITY);
                ){
                ResultSet rs = null;
                pstmt.setInt(1, teaID);
                rs = pstmt.executeQuery();
                while(rs.next()) {
                    specialities.add(rs.getString("spe_name"));
                }
        } catch(SQLException se){
            throw new RuntimeException("A database error occured. "
                    + se.getMessage());
        }
        return specialities;
    }
    @Override
    public List<TeacherVO> getAll() {
        List<TeacherVO> list = new ArrayList<TeacherVO>();
        TeacherVO teacherVO = null;

        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {

            con = ds.getConnection();
            pstmt = con.prepareStatement(GET_ALL_STMT);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                teacherVO = new TeacherVO();
                teacherVO.setTeaId(rs.getInt("tea_id"));
                teacherVO.setEmpId(rs.getInt("emp_id"));
                teacherVO.setTeaName(rs.getString("tea_name"));
                teacherVO.setTeaGender(rs.getInt("tea_gender"));
                teacherVO.setTeaPhone(rs.getString("tea_phone"));
                teacherVO.setTeaIntro(rs.getString("tea_intro"));
                teacherVO.setTeaPic(rs.getBytes("tea_pic"));
                teacherVO.setTeaEmail(rs.getString("tea_email"));
                teacherVO.setTeaStatus(rs.getInt("tea_status"));

                list.add(teacherVO); // Store the row in the list
            }

            // Handle any driver errors
        } catch (SQLException se) {
            throw new RuntimeException("A database error occured. "
                    + se.getMessage());
            // Clean up JDBC resources
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException se) {
                    se.printStackTrace(System.err);
                }
            }
            if (pstmt != null) {
                try {
                    pstmt.close();
                } catch (SQLException se) {
                    se.printStackTrace(System.err);
                }
            }
            if (con != null) {
                try {
                    con.close();
                } catch (Exception e) {
                    e.printStackTrace(System.err);
                }
            }
        }
        return list;
    }
}
