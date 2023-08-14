package com.cha102.diyla.commonproblemmodel;

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

public class PbmDAO implements PbmDAO_interface {

    private static DataSource ds = null;

    static {
        try {
            Context ctx = new InitialContext();
            ds = (DataSource) ctx.lookup("java:comp/env/jdbc/diyla");
        } catch (NamingException e) {
            e.printStackTrace();
        }
    }

    private static final String INSERT_STMT = "INSERT INTO diyla.commonproblem (pbm_sort,pbm_title,pbm_context) VALUES ( ?, ?, ?)";
    private static final String GET_ALL_STMT = "SELECT pbm_No,pbm_title,pbm_Context,pbm_sort FROM diyla.commonproblem order by pbm_No";
    private static final String GET_ONE_STMT = "SELECT pbm_No,pbm_title,pbm_Context,pbm_sort FROM diyla.commonproblem where pbm_No = ?";
    private static final String DELETE = "DELETE FROM diyla.commonproblem where pbm_No = ?";
    private static final String UPDATE = "UPDATE diyla.commonproblem set pbm_Context = ?,pbm_title =?,pbm_sort =? where pbm_No = ?";


    @Override
    public void insert(PbmVO pbmVO) {
        Connection con = null;
        PreparedStatement pstmt = null;

        try {
            con = ds.getConnection();
            pstmt = con.prepareStatement((INSERT_STMT));

            pstmt.setByte(1, pbmVO.getPbmSort());
            pstmt.setString(2, pbmVO.getPbmTitle());
            pstmt.setString(3, pbmVO.getPbmContext());

            pstmt.executeUpdate();
        } catch (SQLException se) {
            throw new RuntimeException("A database error occured. " + se.getMessage());
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
    public void update(PbmVO pbmVO) {
        Connection con = null;
        PreparedStatement pstmt = null;

        try {

            con = ds.getConnection();
            pstmt = con.prepareStatement(UPDATE);

            pstmt.setString(1, pbmVO.getPbmContext());
            pstmt.setString(2, pbmVO.getPbmTitle());
            pstmt.setByte(3, pbmVO.getPbmSort());
            pstmt.setInt(4, pbmVO.getPbmNo());


            pstmt.executeUpdate();
        } catch (SQLException se) {
            throw new RuntimeException("A database error occured. " + se.getMessage());
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
    public void delete(Integer pbmNo) {
        Connection con = null;
        PreparedStatement pstmt = null;

        try {
            con = ds.getConnection();
            pstmt = con.prepareStatement(DELETE);

            pstmt.setInt(1, pbmNo);

            pstmt.executeUpdate();
        } catch (SQLException se) {
            throw new RuntimeException("A database error occured. " + se.getMessage());
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
    public PbmVO findByPrimaryKey(Integer pbmNo) {
        PbmVO pbmvo = null;
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {

            con = ds.getConnection();
            pstmt = con.prepareStatement(GET_ONE_STMT);

            pstmt.setInt(1, pbmNo);

            rs = pstmt.executeQuery();

            while (rs.next()) {
                pbmvo = new PbmVO();
                pbmvo.setPbmNo(rs.getInt("pbm_NO"));
                pbmvo.setPbmSort(rs.getByte("pbm_sort"));
                pbmvo.setPbmTitle(rs.getString("pbm_title"));
                pbmvo.setPbmContext(rs.getString("pbm_Context"));

            }
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

            return pbmvo;
        }
    }

    @Override
    public List<PbmVO> getAll() {
        List<PbmVO> list = new ArrayList<>();
        PbmVO pbmvo = null;

        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            con = ds.getConnection();
            pstmt = con.prepareStatement(GET_ALL_STMT);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                pbmvo = new PbmVO();
                pbmvo.setPbmNo(rs.getInt("pbm_NO"));
                pbmvo.setPbmSort(rs.getByte("pbm_sort"));
                pbmvo.setPbmTitle(rs.getString("pbm_title"));
                pbmvo.setPbmContext(rs.getString("pbm_Context"));
                list.add(pbmvo);
            }
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