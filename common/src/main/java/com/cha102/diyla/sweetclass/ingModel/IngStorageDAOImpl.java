package com.cha102.diyla.sweetclass.ingModel;

import java.util.*;
import java.sql.*;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class IngStorageDAOImpl implements IngStorageDAO{
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
            "INSERT INTO ing_storage (brand,ing_nums,ing_name,status,serving_size) VALUES (?, ?, ?, ?, ?)";
    private static final String GET_ALL_STMT =
            "SELECT ing_id, brand,ing_nums,ing_name,status,serving_size FROM ing_storage order by ing_id";
    private static final String GET_ONE_STMT =
            "SELECT ing_id, brand,ing_nums,ing_name,status,serving_size FROM ing_storage where ing_id = ?";
    private static final String DELETE =
            "DELETE FROM ing_storage where ing_id = ?";
    private static final String UPDATE =
            "UPDATE ing_id set brand=?,ing_nums=?,ing_name=?,status=?,serving_size=? where ing_id = ?";
    @Override
    public void insert(IngStorageVO ingStorageVO) {
        Connection con = null;
        PreparedStatement pstmt = null;

        try {

            con = ds.getConnection();
            pstmt = con.prepareStatement(INSERT_STMT);

            pstmt.setString(1, ingStorageVO.getBrand());
            pstmt.setInt(2, ingStorageVO.getIngNums());
            pstmt.setString(3, ingStorageVO.getIngName());
            pstmt.setInt(4, ingStorageVO.getStatus());
            pstmt.setInt(5, ingStorageVO.getServingSize());

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
    public void update(IngStorageVO ingStorageVO) {
        Connection con = null;
        PreparedStatement pstmt = null;

        try {

            con = ds.getConnection();
            pstmt = con.prepareStatement(UPDATE);

            pstmt.setString(1, ingStorageVO.getBrand());
            pstmt.setInt(2, ingStorageVO.getIngNums());
            pstmt.setString(3, ingStorageVO.getIngName());
            pstmt.setInt(4, ingStorageVO.getStatus());
            pstmt.setInt(5, ingStorageVO.getServingSize());

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
    public void delete(Integer ingID) {
        Connection con = null;
        PreparedStatement pstmt = null;

        try {

            con = ds.getConnection();
            pstmt = con.prepareStatement(DELETE);

            pstmt.setInt(1, ingID);

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
    public IngStorageVO findByPrimaryKey(Integer ingID) {
        IngStorageVO ingStorageVO = null;
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {

            con = ds.getConnection();
            pstmt = con.prepareStatement(GET_ONE_STMT);

            pstmt.setInt(1, ingID);

            rs = pstmt.executeQuery();

            while (rs.next()) {
                ingStorageVO = new IngStorageVO();
                ingStorageVO.setIngId(rs.getInt("ing_id"));
                ingStorageVO.setBrand(rs.getString("brand"));
                ingStorageVO.setIngNums(rs.getInt("ing_nums"));
                ingStorageVO.setIngName(rs.getString("ing_name"));
                ingStorageVO.setStatus(rs.getInt("status"));
                ingStorageVO.setServingSize(rs.getInt("serving_size"));
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
        return ingStorageVO;
    }

    @Override
    public List<IngStorageVO> getAll() {
        List<IngStorageVO> list = new ArrayList<IngStorageVO>();
        IngStorageVO ingStorageVO = null;

        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {

            con = ds.getConnection();
            pstmt = con.prepareStatement(GET_ALL_STMT);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                ingStorageVO = new IngStorageVO();
                ingStorageVO.setIngId(rs.getInt("ing_id"));
                ingStorageVO.setBrand(rs.getString("brand"));
                ingStorageVO.setIngNums(rs.getInt("ing_nums"));
                ingStorageVO.setIngName(rs.getString("ing_name"));
                ingStorageVO.setStatus(rs.getInt("status"));
                ingStorageVO.setServingSize(rs.getInt("serving_size"));

                list.add(ingStorageVO); // Store the row in the list
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
