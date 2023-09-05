package com.cha102.diyla.sweetclass.classModel;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ClassINGDAOImpl implements ClassINGDAO {
    private static DataSource ds = null;

    static {
        try {
            Context ctx = new InitialContext();
            ds = (DataSource) ctx.lookup("java:comp/env/jdbc/diyla");
        } catch (NamingException e) {
            e.printStackTrace();
        }
    }

    private static final String INSERT_STMT =
            "INSERT INTO class_ing (class_id, ing_id,ing_nums) VALUES (?, ?, ?)";
    private static final String GET_ALL_STMT =
            "SELECT class_id,ing_id,ing_nums FROM class_ing order by class_id";
    private static final String GET_ONE_STMT =
            "SELECT class_id,ing_id,ing_nums FROM class_ing where class_id = ?, ing_id=?";
    private static final String DELETE =
            "DELETE FROM class_ing where class_id = ?, ing_id=?";
    private static final String DELETE_ONE_COURSE_ING =
            "DELETE FROM class_ing where class_id = ?";
    private static final String UPDATE =
            "UPDATE class_id set ing_id=?,ing_nums=? where class_id = ?";
    private static final String GET_ING_ID_NUMS_STMT =
            "SELECT ing_id, ing_nums FROM diyla.class_ing where class_id=? order by ing_id";

    @Override
    public void insert(ClassINGVO classINGVO) {
        Connection con = null;
        PreparedStatement pstmt = null;

        try {

            con = ds.getConnection();
            pstmt = con.prepareStatement(INSERT_STMT);

            pstmt.setInt(1, classINGVO.getClassId());
            pstmt.setInt(2, classINGVO.getIngId());
            pstmt.setInt(3, classINGVO.getIngNums());

            pstmt.executeUpdate();

            // Handle any SQL errors
        } catch (SQLException se) {
            se.printStackTrace();
            throw new RuntimeException("新增食材時發生錯誤。");
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
    public void update(ClassINGVO classINGVO) {
        Connection con = null;
        PreparedStatement pstmt = null;

        try {

            con = ds.getConnection();
            pstmt = con.prepareStatement(UPDATE);

            pstmt.setInt(1, classINGVO.getClassId());
            pstmt.setInt(2, classINGVO.getIngId());
            pstmt.setInt(3, classINGVO.getIngNums());

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
    public void delete(Integer claID, Integer ingID) {
        Connection con = null;
        PreparedStatement pstmt = null;

        try {

            con = ds.getConnection();
            pstmt = con.prepareStatement(DELETE);

            pstmt.setInt(1, claID);
            pstmt.setInt(2, ingID);

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
    public void deleteOneCourseIng(Integer claID) {
        try (
                Connection con = ds.getConnection();
                PreparedStatement pstmt = con.prepareStatement(DELETE_ONE_COURSE_ING);
                ) {
            pstmt.setInt(1, claID);
            pstmt.executeUpdate();


        } catch(SQLException se) {
            throw new RuntimeException("刪除課程食材時發生錯誤。");
        }
    }

    @Override
    public ClassINGVO findByPrimaryKey(Integer claID, Integer ingID) {
        ClassINGVO classINGVO = null;
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {

            con = ds.getConnection();
            pstmt = con.prepareStatement(GET_ONE_STMT);

            pstmt.setInt(1, claID);
            pstmt.setInt(2, ingID);

            rs = pstmt.executeQuery();

            while (rs.next()) {
                classINGVO = new ClassINGVO();
                classINGVO.setClassId(rs.getInt("class_id"));
                classINGVO.setIngId(rs.getInt("ing_id"));
                classINGVO.setIngNums(rs.getInt("ing_nums"));

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
        return classINGVO;
    }

    @Override
    public List<ClassINGVO> getAll() {
        List<ClassINGVO> list = new ArrayList<ClassINGVO>();
        ClassINGVO classINGVO = null;

        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {

            con = ds.getConnection();
            pstmt = con.prepareStatement(GET_ALL_STMT);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                // empVO 也稱為 Domain objects
                classINGVO = new ClassINGVO();
                classINGVO.setClassId(rs.getInt("class_id"));
                classINGVO.setIngId(rs.getInt("ing_id"));
                classINGVO.setIngNums(rs.getInt("ing_nums"));
                list.add(classINGVO); // Store the row in the list
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

    public List<ClassINGVO> findIngIdAmountByClaId(Integer claID) {
        List<ClassINGVO> courseIngIdAmountList = new ArrayList<>();
        try(
                Connection con = ds.getConnection();
                PreparedStatement pstmt = con.prepareStatement(GET_ING_ID_NUMS_STMT);
                ){
            pstmt.setInt(1, claID);
            ResultSet rs = pstmt.executeQuery();
            while(rs.next()) {
                ClassINGVO classINGVO = new ClassINGVO();
                classINGVO.setIngId(rs.getInt("ing_id"));
                classINGVO.setIngNums(rs.getInt("ing_nums"));
                courseIngIdAmountList.add(classINGVO);
            }

        } catch(SQLException se) {
            throw new RuntimeException("A database error occured. "
                    + se.getMessage());
        }
        return courseIngIdAmountList;
    }
}