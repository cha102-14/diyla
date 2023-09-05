package com.cha102.diyla.sweetclass.teaModel;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class SpecialityDAOImpl implements SpecialityDAO {
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
            "INSERT INTO speciality (spe_name) VALUES (?)";
    private static final String GET_ALL_STMT =
            "SELECT spe_id, spe_name FROM speciality order by spe_id";
    private static final String GET_ONE_STMT =
            "SELECT spe_name FROM speciality where spe_id = ?";
    private static final String DELETE =
            "DELETE FROM speciality where spe_id = ?";
    private static final String UPDATE =
            "UPDATE spe_id=?, spe_name=? where spe_id = ?";
    private static final String GET_BY_NAME =
            "SELECT spe_id FROM speciality where spe_name = ?";
    @Override
    public void insert(SpecialityVO specialityVO) {
        Connection con = null;
        PreparedStatement pstmt = null;

        try {

            con = ds.getConnection();
            pstmt = con.prepareStatement(INSERT_STMT);

            pstmt.setString(1, specialityVO.getSpeName());
            pstmt.executeUpdate();

            // Handle any SQL errors
        } catch (SQLIntegrityConstraintViolationException UKerror) {
            throw new RuntimeException("UKerror");
        }
        catch (SQLException se) {
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
    public void update(SpecialityVO specialityVO) {
        Connection con = null;
        PreparedStatement pstmt = null;

        try {

            con = ds.getConnection();
            pstmt = con.prepareStatement(UPDATE);

            pstmt.setString(1, specialityVO.getSpeName());
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
    public void delete(Integer speID) {
        Connection con = null;
        PreparedStatement pstmt = null;

        try {

            con = ds.getConnection();
            pstmt = con.prepareStatement(DELETE);

            pstmt.setInt(1, speID);

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
    public String findBySpeId(Integer speID) {
        String speName = null;
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {

            con = ds.getConnection();
            pstmt = con.prepareStatement(GET_ONE_STMT);

            pstmt.setInt(1, speID);

            rs = pstmt.executeQuery();

            while (rs.next()) {
                speName = rs.getString("spe_name");
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
        return speName;
    }
    public Integer findBySpeName(String speName){
        SpecialityVO specialityVO = null;
        ResultSet rs = null;
        try(
                Connection con = ds.getConnection();
                PreparedStatement pstmt = con.prepareStatement(GET_BY_NAME);
                ){
            pstmt.setString(1, speName);
            rs = pstmt.executeQuery();
            if(rs.next()) {
                Integer speId = rs.getInt("spe_id");
                return speId;
            } else {
                return -1;
            }
        } catch(SQLException se) {
            throw new RuntimeException("A database error occured. "
                    + se.getMessage());
        }
    }
    @Override
    public List<SpecialityVO> getAll() {
        List<SpecialityVO> list = new ArrayList<SpecialityVO>();
        SpecialityVO specialityVO = null;

        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {

            con = ds.getConnection();
            pstmt = con.prepareStatement(GET_ALL_STMT);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                specialityVO = new SpecialityVO();
                specialityVO.setSpeId(rs.getInt("spe_id"));
                specialityVO.setSpeName(rs.getString("spe_name"));

                list.add(specialityVO); // Store the row in the list
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
