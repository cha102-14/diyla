package com.cha102.diyla.member;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

public class MemJDBCDAO implements MemDAO_interface {
	String driver = "com.mysql.cj.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/diyla?serverTimezone=Asia/Taipei";
	String userid = "root";
	String passwd = "T2012w1221";

	@Override
	public void insert(MemVo memVo) {

		Connection con = null;
		PreparedStatement pre = null;

		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pre = con.prepareStatement(
					"INSERT into member(mem_name,mem_email,mem_password,mem_phone,mem_birthday,mem_gender,mem_address)VALUES(?,?,?,?,?,?,?)");
			pre.setString(1, memVo.getMem_name());
			pre.setString(2, memVo.getMem_email());
			pre.setString(3, memVo.getMem_password());
			pre.setString(4, memVo.getMem_phone());
			pre.setDate(5, memVo.getMem_date());
			pre.setInt(6, memVo.getMem_gender());
			pre.setString(7, memVo.getMem_address());

			pre.executeUpdate();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
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
	public void delete(Integer mem_id) {
		Connection con = null;
		PreparedStatement pre = null;
		
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pre = con.prepareStatement("DELETE FROM member where mem_id =?");
			pre.setInt(1, mem_id);
			pre.executeUpdate();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
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
	public void update(MemVo memVo) {
		Connection con = null;
		PreparedStatement pre = null;
		
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pre = con.prepareStatement("UPDATE member set mem_name=?,mem_password=?,mem_phone=?,mem_address=?,mem_status=?,mem_token=?,blacklist_com=?,blacklist_art=?,blacklist_diy=?,blacklist_class=?,rpmsg_count=? where mem_id = ?");
			pre.setString(1, memVo.getMem_name());
			pre.setString(2, memVo.getMem_password());
			pre.setString(3, memVo.getMem_phone());
			pre.setString(4, memVo.getMem_address());
			pre.setInt(5, memVo.getMem_status());
			pre.setInt(6, memVo.getMem_token());
			pre.setInt(7,memVo.getBlacklist_com());
			pre.setInt(8,memVo.getBlacklist_art());
			pre.setInt(9,memVo.getBlacklist_diy());
			pre.setInt(10, memVo.getBlacklist_class());
			pre.setInt(11,memVo.getRpmsg_count());
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Override
	public MemVo findByPrimaryKey(Integer mem_id) {
		Connection con = null;
		PreparedStatement pre = null;
		ResultSet rs = null;
		MemVo memVo = null;
		
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pre = con.prepareStatement("SELECT mem_name,mem_email,mem_password,mem_phone,mem_birthday,mem_gender,mem_address,mem_status,mem_token,mem_date,blacklist_com,blacklist_art,blacklist_diy,blacklist_class,rpmsg_count FROM MEMBER WHERE MEM_ID = ?");
			pre.setInt(1, mem_id);
			rs = pre.executeQuery();
			memVo = new MemVo();
			while (rs.next()) {
			memVo.setMem_name(rs.getString("mem_name"));
			memVo.setMem_email(rs.getString("mem_email"));
			memVo.setMem_password(rs.getString("mem_password"));
			memVo.setMem_phone(rs.getString("mem_phone"));
			memVo.setMem_birthday(rs.getDate("mem_birthday"));
			memVo.setMem_gender(rs.getInt("mem_gender"));
			memVo.setMem_address(rs.getString("mem_address"));
			memVo.setMem_status(rs.getInt("mem_status"));
			memVo.setMem_date(rs.getDate("mem_date"));
			memVo.setMem_token(rs.getInt("mem_token"));
			memVo.setBlacklist_com(rs.getInt("blacklist_com"));
			memVo.setBlacklist_art(rs.getInt("blacklist_art"));
			memVo.setBlacklist_diy(rs.getInt("blacklist_diy"));
			memVo.setBlacklist_class(rs.getInt("blacklist_class"));
			memVo.setRpmsg_count(rs.getInt("rpmsg_count"));
			
			
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (rs!=null) {
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
	public List<MemVo> getAll() {
		// TODO Auto-generated method stub
		return null;
	}

}
