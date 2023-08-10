package com.cha102.diyla.diyForum;
import com.cha102.diyla.util.PageBean;
import org.springframework.util.StringUtils; //?????
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
public class DiyForumDAO implements DiyForumDAO_Interface {
	String driver = "com.mysql.cj.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/diyla?serverTimezone=Asia/Taipei";
	String userid = "root";
	String passwd = "Ee225025662";
	private static final String INSERT_STMT = "INSERT INTO diy_forum (MEM_ID,DIY_NO,ARTI_CONT,DIY_GRA) VALUES ( ?, ?, ?, ?)";
	private static final String GET_ALL_STMT = "SELECT ARTI_NO,MEM_ID,DIY_NO,ARTI_CONT,DIY_GRA FROM diy_forum order by ARTI_NO";
	private static final String GET_ALL_STMT_BY_DIY_NO = "SELECT ARTI_NO,df.MEM_ID as MEM_ID,DIY_NO,ARTI_CONT,DIY_GRA,mem.MEM_NAME as MEM_NAME FROM diy_forum df left join member mem on df.MEM_ID = mem.MEM_ID where df.DIY_NO = ?";
//使用左連接（left join），將 "diy_forum" 表格與 "member" 表格聯結，以便取得關聯會員名稱（MEM_NAME）的評論資訊。
	private static final String GET_ALL_COUNT = "SELECT count(1) FROM diy_forum where DIY_NO = ?";
//用於計算特定 DIY 編號（DIY_NO）的評論總數。
	private static final String GET_ONE_STMT = "SELECT ARTI_NO,MEM_ID,DIY_NO,ARTI_CONT,DIY_GRA FROM diy_forum where ARTI_NO = ?";
	private static final String DELETE = "DELETE FROM diy_forum where ARTI_NO = ?";
	private static final String UPDATE = "UPDATE diy_forum set MEM_ID = ?,DIY_NO =?,ARTI_CONT =?,DIY_GRA =? where ARTI_NO = ?";
// 新增
	@Override
	public void insert(DiyForumVO DiyForumVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(INSERT_STMT);
			pstmt.setInt(1, DiyForumVO.getMemId());
			pstmt.setInt(2, DiyForumVO.getDiyNo());
			pstmt.setString(3, DiyForumVO.getArtiCont());
			pstmt.setInt(4, DiyForumVO.getDiyGrade());
			pstmt.executeUpdate();
			// 處理驅動程式錯誤
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("無法載入資料庫驅動程式。" + e.getMessage());
			// 處理 SQL 錯誤
		} catch (SQLException se) {
			throw new RuntimeException("資料庫錯誤。" + se.getMessage());
			// 清理 JDBC 資源
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
// 修改
	@Override
	public void update(DiyForumVO DiyForumVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(UPDATE);
			pstmt.setInt(1, DiyForumVO.getMemId());
			pstmt.setInt(2, DiyForumVO.getDiyNo());
			pstmt.setString(3, DiyForumVO.getArtiCont());
			pstmt.setInt(4, DiyForumVO.getDiyGrade());
			pstmt.setInt(5, DiyForumVO.getArtiNo());
			pstmt.executeUpdate();
			// 處理驅動程式錯誤
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("無法載入資料庫驅動程式。" + e.getMessage());
			// 處理 SQL 錯誤
		} catch (SQLException se) {
			throw new RuntimeException("資料庫錯誤。" + se.getMessage());
			// 清理 JDBC 資源
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
// 刪除
	@Override
	public void delete(Integer artiNo) {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(DELETE);
			pstmt.setInt(1, artiNo);
			pstmt.executeUpdate();
			// 處理驅動程式錯誤
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("無法載入資料庫驅動程式。" + e.getMessage());
			// 處理 SQL 錯誤
		} catch (SQLException se) {
			throw new RuntimeException("資料庫錯誤。" + se.getMessage());
			// 清理 JDBC 資源
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
// 查詢單筆
	@Override
	public DiyForumVO findByPrimaryKey(Integer artiNo) {
		DiyForumVO DiyForumVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ONE_STMT);
			pstmt.setInt(1, artiNo);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				
				DiyForumVO = new DiyForumVO();
				DiyForumVO.setArtiNo(rs.getInt("ARTI_NO"));
				DiyForumVO.setMemId(rs.getInt("MEM_ID"));
				DiyForumVO.setDiyNo(rs.getInt("DIY_NO"));
				DiyForumVO.setArtiCont(rs.getString("ARTI_CONT"));
				DiyForumVO.setDiyGrade(rs.getInt("DIY_GRA"));
			}
			// 處理驅動程式錯誤
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("無法載入資料庫驅動程式。" + e.getMessage());
			// 處理 SQL 錯誤
		} catch (SQLException se) {
			throw new RuntimeException("資料庫錯誤。" + se.getMessage());
			// 清理 JDBC 資源
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
		return DiyForumVO;
	}
// 查詢多筆
	@Override
	public List<DiyForumVO> getAll() {
		List<DiyForumVO> list = new ArrayList<DiyForumVO>();
		DiyForumVO DiyForumVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ALL_STMT);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				DiyForumVO = new DiyForumVO();
				DiyForumVO.setArtiNo(rs.getInt("ARTI_NO"));
				DiyForumVO.setMemId(rs.getInt("MEM_ID"));
				DiyForumVO.setDiyNo(rs.getInt("DIY_NO"));
				DiyForumVO.setArtiCont(rs.getString("ARTI_CONT"));
				DiyForumVO.setDiyGrade(rs.getInt("DIY_GRA"));
				list.add(DiyForumVO); // 將該列加入清單中
			}
			// 處理任何驅動程式錯誤
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("無法載入資料庫驅動程式。" + e.getMessage());
			// 處理任何 SQL 錯誤
		} catch (SQLException se) {
			throw new RuntimeException("資料庫錯誤。" + se.getMessage());
			// 清理 JDBC 資源
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
	@Override
	public PageBean getAll(Integer diyNo, String commentSort, String starSort, PageBean pageBean) {
		List<DiyForumVO> list = new ArrayList<>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			// 動態配置查詢語句
			StringBuffer sql = new StringBuffer(GET_ALL_STMT_BY_DIY_NO);
			// 查詢列表數
			int count = getCount(diyNo);
			pageBean.setTotal(count);
			sql.append(" ORDER BY df.ARTI_NO ");
			if (StringUtils.isEmpty(commentSort)){
				commentSort = " DESC";
			}
			sql.append(commentSort);
			if (!StringUtils.isEmpty(starSort)) {
				sql.append(" ,DIY_GRA ").append(starSort);
			}
			// 分頁
			sql.append(" LIMIT ");
			// 設定返回結果數
			sql.append(pageBean.getRows());
			sql.append(" OFFSET ");
			// 設定起始位置
			sql.append(pageBean.getStartIndex());
			System.out.println(sql.toString());
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1,diyNo);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				DiyForumVO DiyForumVO = new DiyForumVO();
				DiyForumVO.setArtiNo(rs.getInt("ARTI_NO"));
				DiyForumVO.setMemId(rs.getInt("MEM_ID"));
				DiyForumVO.setDiyNo(rs.getInt("DIY_NO"));
				DiyForumVO.setArtiCont(rs.getString("ARTI_CONT"));
				DiyForumVO.setDiyGrade(rs.getInt("DIY_GRA"));
				DiyForumVO.setMemName(rs.getString("MEM_NAME"));
				list.add(DiyForumVO); // 將該列加入清單中
			}
			// 設定 list 到分頁對象中
			pageBean.setData(list);
			// 處理任何驅動程式錯誤
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("無法載入資料庫驅動程式。" + e.getMessage());
			// 處理任何 SQL 錯誤
		} catch (SQLException se) {
			throw new RuntimeException("資料庫錯誤。" + se.getMessage());
			// 清理 JDBC 資源
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
		return pageBean;
	}
	public int getCount(int diyNo) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ALL_COUNT);
			pstmt.setInt(1,diyNo);
			rs = pstmt.executeQuery();
			if (rs.next()) {
					int count = rs.getInt(1);
					System.out.println("Total records: " + count);
					return count;
				}
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException("資料庫錯誤。");
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
		return 0;
}
}
