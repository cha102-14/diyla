package com.cha102.diyla.sweetclass.classModel;

import java.util.*;
import java.sql.*;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class ClassReserveDAO implements ClassReserveDAO_interface{
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
            "INSERT INTO class_reserve (class_id,mem_id,headcount,status,create_time,total_price) VALUES (?, ?, ?, ?, ?, ?)";
    private static final String GET_ALL_STMT =
            "SELECT reserve_id, class_id,mem_id,headcount,status,create_time,total_price FROM class_reserve order by reserve_id";
    private static final String GET_ONE_STMT =
            "SELECT reserve_id, class_id,mem_id,headcount,status,create_time,total_price FROM class_reserve where reserve_id = ?";
    private static final String DELETE =
            "DELETE FROM class_reserve where reserve_id = ?";
    private static final String UPDATE =
            "UPDATE reserve_id set class_id=?,mem_id=?,headcount=?,status=?,create_time=?,total_price=? where reserve_id = ?";
    @Override
    public void insert(ClassReserveVO classReserveVO) {
        Connection con = null;
        PreparedStatement pstmt = null;

        try {

            con = ds.getConnection();
            pstmt = con.prepareStatement(INSERT_STMT);

            pstmt.setInt(1, classReserveVO.getClassId());
            pstmt.setInt(2, classReserveVO.getMemId());
            pstmt.setInt(3, classReserveVO.getHeadcount());
            pstmt.setInt(4, classReserveVO.getStatus());
            pstmt.setTimestamp(5, classReserveVO.getCreateTime());
            pstmt.setInt(6, classReserveVO.getTotalPrice());

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
    public void update(ClassReserveVO classReserveVO) {
        Connection con = null;
        PreparedStatement pstmt = null;

        try {

            con = ds.getConnection();
            pstmt = con.prepareStatement(UPDATE);

            pstmt.setInt(1, classReserveVO.getClassId());
            pstmt.setInt(2, classReserveVO.getMemId());
            pstmt.setInt(3, classReserveVO.getHeadcount());
            pstmt.setInt(4, classReserveVO.getStatus());
            pstmt.setTimestamp(5, classReserveVO.getCreateTime());
            pstmt.setInt(6, classReserveVO.getTotalPrice());

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
    public void delete(Integer resID) {
        Connection con = null;
        PreparedStatement pstmt = null;

        try {

            con = ds.getConnection();
            pstmt = con.prepareStatement(DELETE);

            pstmt.setInt(1, resID);

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
    public ClassReserveVO findByPrimaryKey(Integer resID) {
        ClassReserveVO classReserveVO = null;
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {

            con = ds.getConnection();
            pstmt = con.prepareStatement(GET_ONE_STMT);

            pstmt.setInt(1, resID);

            rs = pstmt.executeQuery();

            while (rs.next()) {
                classReserveVO = new ClassReserveVO();
                classReserveVO.setReserveId(rs.getInt("reserve_id"));
                classReserveVO.setClassId(rs.getInt("class_id"));
                classReserveVO.setMemId(rs.getInt("mem_id"));
                classReserveVO.setHeadcount(rs.getInt("headcount"));
                classReserveVO.setStatus(rs.getInt("status"));
                classReserveVO.setCreateTime(rs.getTimestamp("create_time"));
                classReserveVO.setTotalPrice(rs.getInt("total_price"));

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
        return classReserveVO;
    }

    @Override
    public List<ClassReserveVO> getAll() {
        List<ClassReserveVO> list = new ArrayList<ClassReserveVO>();
        ClassReserveVO classReserveVO = null;

        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {

            con = ds.getConnection();
            pstmt = con.prepareStatement(GET_ALL_STMT);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                classReserveVO = new ClassReserveVO();
                classReserveVO.setReserveId(rs.getInt("reserve_id"));
                classReserveVO.setClassId(rs.getInt("class_id"));
                classReserveVO.setMemId(rs.getInt("mem_id"));
                classReserveVO.setHeadcount(rs.getInt("headcount"));
                classReserveVO.setStatus(rs.getInt("status"));
                classReserveVO.setCreateTime(rs.getTimestamp("create_time"));
                classReserveVO.setTotalPrice(rs.getInt("total_price"));
                list.add(classReserveVO); // Store the row in the list
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

