package com.cha102.diyla.sweetclass.classModel;

import java.util.*;
import java.sql.*;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
public class ClassDAO implements ClassDAO_interface{
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
            "INSERT INTO class (category,tea_id,reg_end_time,class_date,class_seq,class_pic,limit,price,intro,class_name,headcount,class_status) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
    private static final String GET_ALL_STMT =
            "SELECT class_id,category,tea_id,reg_end_time,class_date,class_seq,class_pic,limit,price,intro,class_name,headcount,class_status FROM class order by class_id";
    private static final String GET_ONE_STMT =
            "SELECT class_id,category,tea_id,reg_end_time,class_date,class_seq,class_pic,limit,price,intro,class_name,headcount,class_status FROM class where class_id = ?";
    private static final String DELETE =
            "DELETE FROM class where class_id = ?";
    private static final String UPDATE =
            "UPDATE class_id set category=?,tea_id=?,reg_end_time=?,class_date=?,class_seq=?,class_pic=?,limit=?,price=?,intro=?,class_name=?,headcount=?,class_status=? where class_id = ?";

    @Override
    public void insert(ClassVO classVO) {

        Connection con = null;
        PreparedStatement pstmt = null;

        try {

            con = ds.getConnection();
            pstmt = con.prepareStatement(INSERT_STMT);

            pstmt.setInt(1, classVO.getCategory());
            pstmt.setInt(2, classVO.getTeaId());
            pstmt.setDate(3, classVO.getRegEndTime());
            pstmt.setDate(4, classVO.getClassDate());
            pstmt.setInt(5, classVO.getClassSeq());
            pstmt.setBytes(6, classVO.getClassPic());
            pstmt.setInt(7, classVO.getLimit());
            pstmt.setInt(8, classVO.getPrice());
            pstmt.setString(9, classVO.getIntro());
            pstmt.setString(10, classVO.getClassName());
            pstmt.setInt(11, classVO.getHeadcount());
            pstmt.setInt(12, classVO.getClassStatus());

            pstmt.executeUpdate();

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
    public void update(ClassVO classVO) {

        Connection con = null;
        PreparedStatement pstmt = null;

        try {

            con = ds.getConnection();
            pstmt = con.prepareStatement(UPDATE);

            pstmt.setInt(1, classVO.getCategory());
            pstmt.setInt(2, classVO.getTeaId());
            pstmt.setDate(3, classVO.getRegEndTime());
            pstmt.setDate(4, classVO.getClassDate());
            pstmt.setInt(5, classVO.getClassSeq());
            pstmt.setBytes(6, classVO.getClassPic());
            pstmt.setInt(7, classVO.getLimit());
            pstmt.setInt(8, classVO.getPrice());
            pstmt.setString(9, classVO.getIntro());
            pstmt.setString(10, classVO.getClassName());
            pstmt.setInt(11, classVO.getHeadcount());
            pstmt.setInt(12, classVO.getClassStatus());

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
    public void delete(Integer claID) {

        Connection con = null;
        PreparedStatement pstmt = null;

        try {

            con = ds.getConnection();
            pstmt = con.prepareStatement(DELETE);

            pstmt.setInt(1, claID);

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
    public ClassVO findByPrimaryKey(Integer claID) {

        ClassVO classVO = null;
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {

            con = ds.getConnection();
            pstmt = con.prepareStatement(GET_ONE_STMT);

            pstmt.setInt(1, claID);

            rs = pstmt.executeQuery();

            while (rs.next()) {
                classVO = new ClassVO();
                classVO.setClassId(rs.getInt("class_id"));
                classVO.setCategory(rs.getInt("category"));
                classVO.setTeaId(rs.getInt("tea_id"));
                classVO.setRegEndTime(rs.getDate("reg_end_time"));
                classVO.setClassDate(rs.getDate("class_date"));
                classVO.setClassSeq(rs.getInt("class_seq"));
                classVO.setClassPic(rs.getBytes("class_pic"));
                classVO.setLimit(rs.getInt("limit"));
                classVO.setPrice(rs.getInt("price"));
                classVO.setIntro(rs.getString("intro"));
                classVO.setClassName(rs.getString("class_name"));
                classVO.setHeadcount(rs.getInt("headcount"));
                classVO.setClassStatus(rs.getInt("class_status"));


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
        return classVO;
    }

    @Override
    public List<ClassVO> getAll() {
        List<ClassVO> list = new ArrayList<ClassVO>();
        ClassVO classVO = null;

        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {

            con = ds.getConnection();
            pstmt = con.prepareStatement(GET_ALL_STMT);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                // empVO 也稱為 Domain objects
                classVO = new ClassVO();
                classVO.setClassId(rs.getInt("class_id"));
                classVO.setCategory(rs.getInt("category"));
                classVO.setTeaId(rs.getInt("tea_id"));
                classVO.setRegEndTime(rs.getDate("reg_end_time"));
                classVO.setClassDate(rs.getDate("class_date"));
                classVO.setClassSeq(rs.getInt("class_seq"));
                classVO.setClassPic(rs.getBytes("class_pic"));
                classVO.setLimit(rs.getInt("limit"));
                classVO.setPrice(rs.getInt("price"));
                classVO.setIntro(rs.getString("intro"));
                classVO.setClassName(rs.getString("class_name"));
                classVO.setHeadcount(rs.getInt("headcount"));
                classVO.setClassStatus(rs.getInt("class_status"));
                list.add(classVO); // Store the row in the list
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
