package com.cha102.diyla.member;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;


public class MemDAO implements MemDAO_interface {
//    String driver = "com.mysql.cj.jdbc.Driver";
//    String url = "jdbc:mysql://localhost:3306/diyla?serverTimezone=Asia/Taipei";
//    String userid = "root";
//    String passwd = "T2012w1221";

    private  static DataSource ds = null;
    static {
        try {
            Context ctx = new InitialContext();
            ds = (DataSource) ctx.lookup("java:comp/env/jdbc/diyla");
        } catch (NamingException ne) {
            ne.printStackTrace();
        }
    }
    @Override
    public void insert(MemVO memVo) {

        Connection con = null;
        PreparedStatement pre = null;

        try {
//            Class.forName(driver);
//            con = DriverManager.getConnection(url, userid, passwd);
            con = ds.getConnection();
            pre = con.prepareStatement(
                    "INSERT into member(mem_name,mem_email,mem_password,mem_phone,mem_birthday,mem_gender,mem_address)VALUES(?,?,?,?,?,?,?)");
            pre.setString(1, memVo.getMemName());
            pre.setString(2, memVo.getMemEmail());
            pre.setString(3, memVo.getMemPassword());
            pre.setString(4, memVo.getMemPhone());
            pre.setDate(5, memVo.getMemBirthday());
            pre.setInt(6, memVo.getMemGender());
            pre.setString(7, memVo.getMemAddress());

            pre.executeUpdate();
        }  catch (SQLException e) {
            throw new RuntimeException("A database error occured. "+ e.getMessage());
        } finally {
            if (pre != null) {
                try {
                    pre.close();
                } catch (SQLException e) {
                    e.printStackTrace(System.err);
                }
            }
            if (con != null) {
                try {
                    con.close();
                } catch (SQLException e) {
                    e.printStackTrace(System.err);
                }

            }

        }

    }

    @Override
    public void delete(Integer mem_id) {
        Connection con = null;
        PreparedStatement pre = null;

        try {
//            Class.forName(driver);
//            con = DriverManager.getConnection(url, userid, passwd);
            con = ds.getConnection();
            pre = con.prepareStatement("DELETE from member where mem_id =?");
            pre.setInt(1, mem_id);
            pre.executeUpdate();
        }  catch (SQLException e) {
            e.printStackTrace();
        } finally {
            if (pre != null) {
                try {
                    pre.close();
                } catch (SQLException e) {
                    e.printStackTrace(System.err);
                }
            }
            if (con != null) {
                try {
                    con.close();
                } catch (SQLException e) {
                    e.printStackTrace(System.err);
                }
            }
        }
    }

    @Override
    public void update(MemVO memVo) {
        Connection con = null;
        PreparedStatement pre = null;

        try {
//            Class.forName(driver);
//            con = DriverManager.getConnection(url, userid, passwd);
            con = ds.getConnection();
            pre = con.prepareStatement(
                    "UPDATE member set mem_name=?,mem_password=?,mem_phone=?,mem_address=?,mem_status=?,mem_token=?,blacklist_com=?,blacklist_art=?,blacklist_diy=?,blacklist_class=?,rpmsg_count=? where mem_id = ?");
            pre.setString(1, memVo.getMemName());
            pre.setString(2, memVo.getMemPassword());
            pre.setString(3, memVo.getMemPhone());
            pre.setString(4, memVo.getMemAddress());
            pre.setInt(5, memVo.getMemStatus());
            pre.setInt(6, memVo.getMemToken());
            pre.setInt(7, memVo.getBlacklistCom());
            pre.setInt(8, memVo.getBlacklistArt());
            pre.setInt(9, memVo.getBlacklistDiy());
            pre.setInt(10, memVo.getBlacklistClass());
            pre.setInt(11, memVo.getRpmsgCount());
            pre.setInt(12, memVo.getMemId());

            pre.executeUpdate();

        }  catch (SQLException e) {
            e.printStackTrace();
        } finally {
            if (pre != null) {
                try {
                    pre.close();
                } catch (SQLException e) {
                    e.printStackTrace(System.err);
                }
            }
            if (con != null) {
                try {
                    con.close();
                } catch (SQLException e) {
                    e.printStackTrace(System.err);
                }
            }
        }
    }

    @Override
    public MemVO findByPrimaryKey(Integer memId) {
        Connection con = null;
        PreparedStatement pre = null;
        ResultSet rs = null;
        MemVO memVo = null;

        try {
//            Class.forName(driver);
//            con = DriverManager.getConnection(url, userid, passwd);
            con = ds.getConnection();
            pre = con.prepareStatement(
                    "SELECT mem_name,mem_email,mem_password,mem_phone,mem_birthday,mem_gender,mem_address,mem_status,mem_token,mem_date,blacklist_com,blacklist_art,blacklist_diy,blacklist_class,rpmsg_count FROM MEMBER WHERE MEM_ID = ?");
            pre.setInt(1, memId);
            rs = pre.executeQuery();

            while (rs.next()) {
                memVo = new MemVO();
                memVo.setMemName(rs.getString("mem_name"));
                memVo.setMemEmail(rs.getString("mem_email"));
                memVo.setMemPassword(rs.getString("mem_password"));
                memVo.setMemPhone(rs.getString("mem_phone"));
                memVo.setMemBirthday(rs.getDate("mem_birthday"));
                memVo.setMemGender(rs.getInt("mem_gender"));
                memVo.setMemAddress(rs.getString("mem_address"));
                memVo.setMemStatus(rs.getInt("mem_status"));
                memVo.setMemDate(rs.getDate("mem_date"));
                memVo.setMemToken(rs.getInt("mem_token"));
                memVo.setBlacklistCom(rs.getInt("blacklist_com"));
                memVo.setBlacklistArt(rs.getInt("blacklist_art"));
                memVo.setBlacklistDiy(rs.getInt("blacklist_diy"));
                memVo.setBlacklistClass(rs.getInt("blacklist_class"));
                memVo.setRpmsgCount(rs.getInt("rpmsg_count"));

            }
        }  catch (SQLException e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException e) {
                    e.printStackTrace(System.err);
                }
            }
            if (pre != null) {
                try {
                    pre.close();
                } catch (SQLException e) {
                    e.printStackTrace(System.err);
                }
            }
            if (con != null) {
                try {
                    con.close();
                } catch (SQLException e) {
                    e.printStackTrace(System.err);
                }
            }
        }

        return memVo;
    }

    @Override
    public List<MemVO> getAll() {
        List<MemVO> memList = new ArrayList<MemVO>();
        Connection con = null;
        PreparedStatement pre = null;
        ResultSet rs = null;
        MemVO memVo = null;

        try {
//            Class.forName(driver);
//            con = DriverManager.getConnection(url, userid, passwd);
            con = ds.getConnection();
            pre = con.prepareStatement(
                    "SELECT mem_id,mem_name,mem_email,mem_password,mem_phone,mem_birthday,mem_gender,mem_address,mem_status,mem_token,mem_date,blacklist_com,blacklist_art,blacklist_diy,blacklist_class,rpmsg_count from member order by mem_id");
            rs = pre.executeQuery();

            while (rs.next()) {
                memVo = new MemVO();
                memVo.setMemId(rs.getInt("mem_id"));
                memVo.setMemName(rs.getString("mem_name"));
                memVo.setMemEmail(rs.getString("mem_email"));
                memVo.setMemPassword(rs.getString("mem_password"));
                memVo.setMemPhone(rs.getString("mem_phone"));
                memVo.setMemBirthday(rs.getDate("mem_birthday"));
                memVo.setMemGender(rs.getInt("mem_gender"));
                memVo.setMemAddress(rs.getString("mem_address"));
                memVo.setMemStatus(rs.getInt("mem_status"));
                memVo.setMemDate(rs.getDate("mem_date"));
                memVo.setMemToken(rs.getInt("mem_token"));
                memVo.setBlacklistCom(rs.getInt("blacklist_com"));
                memVo.setBlacklistArt(rs.getInt("blacklist_art"));
                memVo.setBlacklistDiy(rs.getInt("blacklist_diy"));
                memVo.setBlacklistClass(rs.getInt("blacklist_class"));
                memVo.setRpmsgCount(rs.getInt("rpmsg_count"));
                memList.add(memVo);

            }
        }  catch (SQLException e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException se) {
                    se.printStackTrace(System.err);
                }
            }
            if (pre != null) {
                try {
                    pre.close();
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
        return memList;
    }

    @Override
    public MemVO selectLogin(String memEmail, String memPassword) {

//        try {
//            Class.forName(driver);
//        } catch (ClassNotFoundException e) {
//            e.printStackTrace();
//        }

        try (
//             Connection con = DriverManager.getConnection(url, userid, passwd);
             Connection con = ds.getConnection();
             PreparedStatement pre = con.prepareStatement("SELECT * from member where mem_email=? and mem_password=?")) {
            pre.setString(1, memEmail);
            pre.setString(2, memPassword);
            try (ResultSet rs = pre.executeQuery()) {
                if (rs.next()) {
                    MemVO mem = new MemVO();
                    mem.setMemId(rs.getInt("mem_id"));
                    mem.setMemName(rs.getString("mem_name"));
                    mem.setMemEmail(rs.getString("mem_email"));
                    mem.setMemPassword(rs.getString("mem_password"));
                    mem.setMemPhone(rs.getString("mem_phone"));
                    mem.setMemBirthday(rs.getDate("mem_birthday"));
                    mem.setMemGender(rs.getInt("mem_gender"));
                    mem.setMemAddress(rs.getString("mem_address"));
                    mem.setMemStatus(rs.getInt("mem_status"));
                    mem.setMemDate(rs.getDate("mem_date"));
                    mem.setMemToken(rs.getInt("mem_token"));
                    mem.setBlacklistCom(rs.getInt("blacklist_com"));
                    mem.setBlacklistArt(rs.getInt("blacklist_art"));
                    mem.setBlacklistDiy(rs.getInt("blacklist_diy"));
                    mem.setBlacklistClass(rs.getInt("blacklist_class"));
                    mem.setRpmsgCount(rs.getInt("rpmsg_count"));
                    return mem;
                }
            }
        }  catch (SQLException e) {
            e.printStackTrace();
        }

        return null;
    }



    public static void main(String[] args) {
        MemDAO mem = new MemDAO();
        // 新增
        MemVO memVo = new MemVO();
        memVo.setMemName("xxx");
        memVo.setMemEmail("abc@diyla.com.tw");
        memVo.setMemPassword("123456");
        memVo.setMemPhone("0933444555");
        memVo.setMemDate(java.sql.Date.valueOf("2020-01-01"));
        memVo.setMemGender(1);
        memVo.setMemAddress("花蓮市北濱街");
        mem.insert(memVo);
//        // 修改
//        MemVO memVo2 = new MemVO();
//        memVo2.setMemId(1);
//        memVo2.setMemName("DIY一起拉");
//        memVo2.setMemPassword("654321");
//        memVo2.setMemPhone("0998765432");
//        memVo2.setMemAddress("台北市XX");
//        memVo2.setMemStatus(1);
//        memVo2.setMemToken(100);
//        memVo2.setBlacklistCom(1);
//        memVo2.setBlacklistArt(1);
//        memVo2.setBlacklistDiy(1);
//        memVo2.setBlacklistClass(1);
//        memVo2.setRpmsgCount(2);
//        mem.update(memVo2);
//
//        //查詢
//        MemVO memVo3 = mem.findByPrimaryKey(3);
//        System.out.println(memVo3.getMemName() + ",");
//        System.out.println(memVo3.getMemEmail() + ",");
//        System.out.println(memVo3.getMemPassword() + ",");
//        System.out.println(memVo3.getMemPhone() + ",");
//        System.out.println(memVo3.getMemBirthday() + ",");
//        System.out.println(memVo3.getMemGender() + ",");
//        System.out.println(memVo3.getMemAddress() + ",");
//        System.out.println(memVo3.getMemStatus() + ",");
//        System.out.println(memVo3.getMemDate() + ",");
//        System.out.println(memVo3.getMemToken() + ",");
//        System.out.println(memVo3.getBlacklistCom() + ",");
//        System.out.println(memVo3.getBlacklistArt() + ",");
//        System.out.println(memVo3.getBlacklistDiy() + ",");
//        System.out.println(memVo3.getBlacklistClass() + ",");
//        System.out.println(memVo3.getRpmsgCount() + ",");
//        System.out.println("---------------------");
//
//
//
//        List<MemVO> list = mem.getAll();
//        for (MemVO m : list) {
//            System.out.println(m.getMemId() + ",");
//            System.out.println(m.getMemName() + ",");
//            System.out.println(m.getMemEmail() + ",");
//            System.out.println(m.getMemPassword() + ",");
//            System.out.println(m.getMemPhone() + ",");
//            System.out.println(m.getMemBirthday() + ",");
//            System.out.println(m.getMemGender() + ",");
//            System.out.println(m.getMemAddress() + ",");
//            System.out.println(m.getMemStatus() + ",");
//            System.out.println(m.getMemDate() + ",");
//            System.out.println(m.getMemToken() + ",");
//            System.out.println(m.getBlacklistCom() + ",");
//            System.out.println(m.getBlacklistArt() + ",");
//            System.out.println(m.getBlacklistDiy() + ",");
//            System.out.println(m.getBlacklistClass() + ",");
//            System.out.println(m.getRpmsgCount() + ",");
//            System.out.println("---------------------");
//
//        }
//
//        //刪除
//        mem.delete(8);

        //登入查詢
        MemVO memVo4 = mem.selectLogin("border1@diyla.com","B654321");
        System.out.println(memVo4.getMemName() + ",");



    }
}
