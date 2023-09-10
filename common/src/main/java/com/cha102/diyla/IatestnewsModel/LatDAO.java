package com.cha102.diyla.IatestnewsModel;

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

public class LatDAO implements LatDAO_interface {

	private static DataSource ds = null;
	static {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/diyla");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	
	private static final String INSERT_STMT = "INSERT INTO diyla.latestnews (News_Context,ann_Pic) VALUES ( ?, ?)";
	private static final String GET_ALL_STMT = "SELECT news_No,news_Context,ann_Pic,ann_Status,ann_Time FROM diyla.latestnews order by news_No";
	private static final String GET_ONE_STMT = "SELECT news_No,news_Context,ann_Pic,ann_Status,ann_Time FROM diyla.latestnews where news_No = ?";
	private static final String DELETE = "DELETE FROM diyla.latestnews where news_No = ?";
	private static final String UPDATE = "UPDATE diyla.latestnews set News_Context = ?,ann_Status =?,ann_pic =? where news_No = ?";

//新增
	@Override
	public void insert(LatestnewsVO latestnewsVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(INSERT_STMT);

			pstmt.setString(1, latestnewsVO.getNewsContext());
			pstmt.setBytes(2, latestnewsVO.getAnnPic());

			pstmt.executeUpdate();

			// Handle any driver errors
		}  catch (SQLException se) {
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

//修改
	@Override
	public void update(LatestnewsVO latestnewsVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(UPDATE);

			pstmt.setString(1, latestnewsVO.getNewsContext());
			pstmt.setInt(2, latestnewsVO.getAnnStatus());
			pstmt.setBytes(3, latestnewsVO.getAnnPic());
			pstmt.setInt(4, latestnewsVO.getNewsNo());

			pstmt.executeUpdate();

			// Handle any driver errors
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
//刪除
	@Override
	public void delete(Integer newsNo) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(DELETE);

			pstmt.setInt(1, newsNo);

			pstmt.executeUpdate();

			// Handle any driver errors
		}  catch (SQLException se) {
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
//查詢
	@Override
	public LatestnewsVO findByPrimaryKey(Integer newsNo) {
		LatestnewsVO latestnewsVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ONE_STMT);

			pstmt.setInt(1, newsNo);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				// empVo 也稱為 Domain objects
				latestnewsVO = new LatestnewsVO();
				latestnewsVO.setNewsNo(rs.getInt("news_No"));
				latestnewsVO.setNewsContext(rs.getString("news_Context"));
				latestnewsVO.setAnnPic(rs.getBytes("ann_Pic"));
				latestnewsVO.setAnnStatus(rs.getByte("ann_Status"));
				latestnewsVO.setAnnTime(rs.getTimestamp("ann_Time"));
				
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
		return latestnewsVO;
	}

//查詢
	@Override
	public List<LatestnewsVO> getAll() {
		List<LatestnewsVO> list = new ArrayList<LatestnewsVO>();
		LatestnewsVO latestnewsVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ALL_STMT);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				latestnewsVO = new LatestnewsVO();
				latestnewsVO.setNewsNo(rs.getInt("news_No"));
				latestnewsVO.setNewsContext(rs.getString("news_Context"));
				latestnewsVO.setAnnPic(rs.getBytes("ann_Pic"));
				latestnewsVO.setAnnStatus(rs.getByte("ann_Status"));
				latestnewsVO.setAnnTime(rs.getTimestamp("ann_Time"));
				list.add(latestnewsVO); // Store the row in the list
			}

			// Handle any driver errors
		}  catch (SQLException se) {
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
