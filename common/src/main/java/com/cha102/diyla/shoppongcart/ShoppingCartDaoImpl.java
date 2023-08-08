package com.cha102.diyla.shoppongcart;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class ShoppingCartDaoImpl implements ShoppingCartDao {
	public static DataSource ds = null;

	static {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/diyla");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}

	// 運用static區塊讓驅動載入僅需一次
//	static {
//		try {
//			Class.forName("com.mysql.cj.jdbc.Driver");
//		} catch (ClassNotFoundException ce) {
//			ce.printStackTrace();
//		}
//	}
//	public static final String URL = "jdbc:mysql://localhost:3306/diyla?serverTimezone=Asia/Taipei";
//	public static final String USERNAME = "root";
//	public static final String PASSWORD = "123456";

//	private static final String INSERT_STMT = "INSERT INTO shopping_cart_list (memId,com_no,com_amount) VALUES (?, ?, ?)";
//	private static final String UPDATE = "UPDATE shopping_cart_list set com_amount = ? where com_no = ?";
//	private static final String DELETE = "DELETE FROM shopping_cart_list where com_no = ?";
//	private static final String GET_ALL_STMT = "SELECT com_no,com_amount from shopping_cart)list where memId = ?";
	@Override
	public void insert(Integer memId, Integer comNo, Integer amount) {

		try (Connection con = ds.getConnection();
				PreparedStatement pstmtSelect = con
						.prepareStatement("Select com_amount from shopping_cart_list where MEM_Id = ? and COM_NO = ?");
				PreparedStatement pstmtInsertCom = con
						.prepareStatement("INSERT INTO shopping_cart_list (MEM_Id,com_no,com_amount) VALUES (?, ?, ?)");
				PreparedStatement pstmtUpdateAmount = con.prepareStatement(
						"UPDATE shopping_cart_list set com_amount = ? where MEM_Id = ? and COM_NO = ?");) {
			pstmtSelect.setInt(1, memId);
			pstmtSelect.setInt(2, comNo);
			try (ResultSet rs = pstmtSelect.executeQuery();) {
				if (rs.next()) {
					Integer existingQuantity = rs.getInt("com_amount");
					pstmtUpdateAmount.setInt(1, amount + existingQuantity);
					pstmtUpdateAmount.setInt(2, memId);
					pstmtUpdateAmount.setInt(3, comNo);
					pstmtUpdateAmount.executeUpdate();

				} else {
					pstmtInsertCom.setInt(1, memId);
					pstmtInsertCom.setInt(2, comNo);
					pstmtInsertCom.setInt(3, amount);
					pstmtInsertCom.executeUpdate();
				}
			} catch (Exception e) {
				e.printStackTrace();

			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	@Override
	public void update(Integer memId, Integer comNo, Integer amount) {
		try (Connection con = ds.getConnection();
				PreparedStatement pstmtUpdate = con.prepareStatement(
						"UPDATE shopping_cart_list set com_amount = ? where MEM_Id = ? and COM_NO = ?");) {

			pstmtUpdate.setInt(1, amount);
			pstmtUpdate.setInt(2, memId);
			pstmtUpdate.setInt(3, comNo);
			pstmtUpdate.executeUpdate();
		}

		catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void delete(Integer memId, Integer comNo) {
		try (Connection con = ds.getConnection();
				PreparedStatement pstmtDel = con
						.prepareStatement("DELETE FROM shopping_cart_list where MEM_Id = ? and COM_NO = ?");) {
			pstmtDel.setInt(1, memId);
			pstmtDel.setInt(2, comNo);
			pstmtDel.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void clear(Integer memId) {
		try (Connection con = ds.getConnection();
				PreparedStatement pstmtClear = con
						.prepareStatement("DELETE FROM shopping_cart_list where MEM_Id = ?");) {
			pstmtClear.setInt(1, memId);
			pstmtClear.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public ShoppingCartVO getOne(Integer memId, Integer comNo) {
		ShoppingCartVO cartVO = new ShoppingCartVO();
		try (Connection con = ds.getConnection();
				PreparedStatement pstmtget = con
						.prepareStatement("SELECT * FROM shopping_cart_list where MEM_Id = ? and COM_NO = ? ");) {
			pstmtget.setInt(1, memId);
			pstmtget.setInt(2, comNo);
			try (ResultSet rs = pstmtget.executeQuery();) {
				if (rs.next()) {
					cartVO.setMemId(memId);
					cartVO.setComNo(comNo);
					cartVO.setComAmount(rs.getInt("COM_AMOUNT"));
				}
				return cartVO;
			} catch (Exception e) {
				e.printStackTrace();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return cartVO;

	}

	@Override
	public List<ShoppingCartVO> getAll(Integer memId) {
		List<ShoppingCartVO> cartList = new ArrayList();
		ShoppingCartVO shoppingCartVO = null;
		try (Connection con = ds.getConnection();
				PreparedStatement pstmtGetAll = con
						.prepareStatement("SELECT * FROM shopping_cart_list SC WHERE MEM_Id = ?");

		) {
			pstmtGetAll.setInt(1, memId);
			try (ResultSet rs = pstmtGetAll.executeQuery();) {
				while (rs.next()) {
					shoppingCartVO = new ShoppingCartVO();
					shoppingCartVO.setMemId(rs.getInt("MEM_Id"));
					shoppingCartVO.setComNo(rs.getInt("COM_NO"));
					shoppingCartVO.setComAmount(rs.getInt("COM_AMOUNT"));
					cartList.add(shoppingCartVO);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		} catch (

		Exception e) {
			e.printStackTrace();

		}
		return cartList;
	}

	public static void main(String[] args) {
		ShoppingCartDaoImpl shoppingCartDaoImp = new ShoppingCartDaoImpl();
//		shoppingCartDaoImp.insert(2, 4, 5);
//		shoppingCartDaoImp.delete(2, 1);
//		shoppingCartDaoImp.update(2, 1, 20);
//		List<ShoppingCartVO> cartlist = shoppingCartDaoImp.getAll(2);
//		for (ShoppingCartVO scv : cartlist) {
//			System.out.println("會員" + scv.getMemId() + "購買商品編號:" + scv.getComNo() + ":數量" + scv.getComAmount());

//		}
		System.out.println(shoppingCartDaoImp.getOne(2, 3));
	}
}
