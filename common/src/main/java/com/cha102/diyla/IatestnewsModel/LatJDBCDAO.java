package com.cha102.diyla.IatestnewsModel;

import java.io.FileInputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class LatJDBCDAO implements LatDAO_interface {
    String driver = "com.mysql.cj.jdbc.Driver";
    String url = "jdbc:mysql://localhost:3306/diyla?serverTimezone=Asia/Taipei";
    String userid = "root";
    String passwd = "123456";

    private static final String INSERT_STMT = "INSERT INTO latestnews (News_Context,ann_Pic) VALUES ( ?, ?)";
    private static final String GET_ALL_STMT = "SELECT news_No,news_Context,ann_Pic,ann_Status,ann_Time FROM latestnews order by news_No";
    private static final String GET_ONE_STMT = "SELECT news_No,news_Context,ann_Pic,ann_Status,ann_Time FROM latestnews where news_No = ?";
    private static final String DELETE = "DELETE FROM latestnews where news_No = ?";
    private static final String UPDATE = "UPDATE latestnews set News_Context = ?,ann_Status =?,ann_pic =? where news_No = ?";

    //新增
    @Override
    public void insert(LatestnewsVO latestnewsVO) {
        Connection con = null;
        PreparedStatement pstmt = null;

        try {

            Class.forName(driver);
            con = DriverManager.getConnection(url, userid, passwd);
            pstmt = con.prepareStatement(INSERT_STMT);

            pstmt.setString(1, latestnewsVO.getNewsContext());
            pstmt.setBytes(2, latestnewsVO.getAnnPic());

            pstmt.executeUpdate();

            // Handle any driver errors
        } catch (ClassNotFoundException e) {
            throw new RuntimeException("Couldn't load database driver. " + e.getMessage());
            // Handle any SQL errors
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

    //修改
    @Override
    public void update(LatestnewsVO latestnewsVO) {
        Connection con = null;
        PreparedStatement pstmt = null;

        try {

            Class.forName(driver);
            con = DriverManager.getConnection(url, userid, passwd);
            pstmt = con.prepareStatement(UPDATE);

            pstmt.setString(1, latestnewsVO.getNewsContext());
            pstmt.setInt(2, latestnewsVO.getAnnStatus());
            pstmt.setBytes(3, latestnewsVO.getAnnPic());
            pstmt.setInt(4, latestnewsVO.getNewsNo());

            pstmt.executeUpdate();

            // Handle any driver errors
        } catch (ClassNotFoundException e) {
            throw new RuntimeException("Couldn't load database driver. " + e.getMessage());
            // Handle any SQL errors
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

            Class.forName(driver);
            con = DriverManager.getConnection(url, userid, passwd);
            pstmt = con.prepareStatement(DELETE);

            pstmt.setInt(1, newsNo);

            pstmt.executeUpdate();

            // Handle any driver errors
        } catch (ClassNotFoundException e) {
            throw new RuntimeException("Couldn't load database driver. " + e.getMessage());
            // Handle any SQL errors
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

    //查詢
    @Override
    public LatestnewsVO findByPrimaryKey(Integer newsNo) {
        LatestnewsVO latestnewsVO = null;
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {

            Class.forName(driver);
            con = DriverManager.getConnection(url, userid, passwd);
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
        } catch (ClassNotFoundException e) {
            throw new RuntimeException("Couldn't load database driver. "
                    + e.getMessage());
            // Handle any SQL errors
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

            Class.forName(driver);
            con = DriverManager.getConnection(url, userid, passwd);
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
        } catch (ClassNotFoundException e) {
            throw new RuntimeException("Couldn't load database driver. "
                    + e.getMessage());
            // Handle any SQL errors
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

    public static void main(String[] args) throws Exception {
        LatJDBCDAO dao = new LatJDBCDAO();
//新增
//		LatestnewsVO latVO = new LatestnewsVO();
//		latVO.setNewsContext("333333333333333【甜點DIY公告】\r\n" + "親愛的顧客們，\r\n" + "\r\n"
//				+ "我們很高興宣佈將於本月底推出一系列有趣又美味的甜點DIY活動！這是一個難得的機會，讓您在家中也能享受親手製作精緻甜點的樂趣。請務必細讀以下詳情，並記得預約您心儀的DIY體驗。\r\n" + "\r\n"
//				+ "活動日期：每週六和週日，從本月底開始，共持續四週\r\n" + "\r\n" + "活動時間：上午10點至下午4點\r\n" + "\r\n" + "地點：我們位於市中心的甜點工作坊\r\n"
//				+ "\r\n" + "活動內容：\r\n" + "\r\n" + "了解甜點製作的基本技巧：我們的專業師傅將向您展示製作各種甜點的基本步驟，從麵團的製作到烘焙、裝飾等細節。\r\n" + "\r\n"
//				+ "DIY甜點體驗：您將有機會親手製作多種美味的甜點，包括香濃巧克力蛋糕、口感鬆軟的香草杯子蛋糕、多層次的水果塔等等。無需經驗，適合初學者和家庭參與。\r\n" + "\r\n"
//				+ "專業指導：我們的甜點師傅將在整個DIY過程中全程指導，並分享一些秘訣，讓您的甜點更加完美。\r\n" + "\r\n"
//				+ "交流和分享：在活動中，您將有機會認識其他喜歡甜點的朋友，一同分享您的烘焙心得和美味作品。\r\n" + "\r\n" + "費用：\r\n" + "每人參與費用：650元（包括所有食材和材料）\r\n"
//				+ "\r\n" + "預約方式：\r\n" + "請提前致電我們的客服中心，預約您想參加的日期。由於名額有限，請盡早預訂以確保您的位置。\r\n" + "\r\n" + "備註：\r\n" + "\r\n"
//				+ "本活動歡迎所有年齡層的人士參與，兒童必須由家長或監護人陪同參加。\r\n" + "請穿著舒適的衣物和防滑鞋，以確保您在工作坊中的安全。\r\n"
//				+ "我們期待著與您一同度過愉快的甜點DIY時光！讓我們一起創造美味與甜蜜的回憶。\r\n" + "\r\n" + "感謝您的支持！\r\n" + "\r\n" + "DIYLA");
//		FileInputStream fis = new FileInputStream("../image/commodity/5.jpg");
//		byte[] buffer = fis.readAllBytes();
//		fis.close();
//		latVO.setAnnPic(buffer);
//		dao.insert(latVO);
//		System.out.println("新增成功");
//修改
        LatestnewsVO latVO2 = new LatestnewsVO();
        FileInputStream fis = new FileInputStream("/data/image/commodity/3.jpg");
        byte[] buffer = fis.readAllBytes();
        fis.close();
        latVO2.setNewsContext("aaaa");
        latVO2.setAnnPic(buffer);
        latVO2.setAnnStatus((byte) 1);
        latVO2.setNewsNo(2);
        dao.update(latVO2);
        System.out.println("修改成功");
//刪除
//		dao.delete(2);
//		System.out.println("刪除成功");
//查詢一筆
//		LatestnewsVO latVO3 = dao.findByPrimaryKey(1);
//		System.out.print(latVO3.getNewsNo()+",");
//		System.out.print(latVO3.getAnnPic()+",");
//		System.out.print(latVO3.getAnnTime()+",");
//		System.out.print(latVO3.getAnnStatus()+",");
//		System.out.println(latVO3.getNewsContext()+",");
//		System.out.println("---------------------");
        //
//		List<LatestnewsVO> list = dao.getAll();
//		for (LatestnewsVO alat : list) {
//			System.out.print(alat.getNewsNo()+",");
//			System.out.print(alat.getAnnPic() + ",");
//			System.out.print(alat.getAnnTime() + ",");
//			System.out.print(alat.getAnnStatus() + ",");
//			System.out.println(alat.getNewsContext() + ",");
//		};
    }
}
