package com.cha102.diyla.shoppingcart;

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
	@Override
	public void insert(Integer memId, Integer comNo, Integer amount) {

		try (Connection con = ds.getConnection();
				PreparedStatement pstmtInsertCom = con.prepareStatement(
						"INSERT INTO shopping_cart_list (MEM_Id,com_no,com_amount) VALUES (?, ?, ?)");) {
			pstmtInsertCom.setInt(1, memId);
			pstmtInsertCom.setInt(2, comNo);
			pstmtInsertCom.setInt(3, amount);
			pstmtInsertCom.executeUpdate();
		} catch (Exception e) {
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
					return cartVO;
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return null;

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
	//只需透過此方法可以不用再另調用商品service
	public List<ShoppingCartVO> getCartList(Integer memId) {
		List<ShoppingCartVO> cartList = new ArrayList();
		try (Connection con = ds.getConnection();
				PreparedStatement pstmtCartList = con.prepareStatement(
						"SELECT s.* ,c.COM_NAME,c.COM_PRI,c.COM_Pic FROM commodity c JOIN shopping_cart_list s ON c.COM_NO=s.COM_NO WHERE MEM_ID=?")) {
			pstmtCartList.setInt(1, memId);
			try (ResultSet rs = pstmtCartList.executeQuery();) {
				while (rs.next()) {
					ShoppingCartVO cartVO = new ShoppingCartVO();
					cartVO.setMemId(rs.getInt("MEM_Id"));
					cartVO.setComNo(rs.getInt("COM_NO"));
					cartVO.setComAmount(rs.getInt("COM_AMOUNT"));
					cartVO.setComName(rs.getString("COM_NAME"));
					cartVO.setComPri(rs.getInt("COM_PRI"));
					cartVO.setComPic(rs.getBytes("COM_PIC"));
					cartList.add(cartVO);
				}
				return cartList;
			} catch (Exception e) {
				e.printStackTrace();
			}
		} catch (Exception e) {
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
