package com.cha102.diyla.shoppongcart;

import java.lang.reflect.Member;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import com.cha102.diyla.commodityModel.CommodityVO;

public class ShoppingCartDaoImpl implements ShoppingCartDao {

	// 運用static區塊讓驅動載入僅需一次
	static {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException ce) {
			ce.printStackTrace();
		}
	}
	String url = "jdbc:mysql://localhost:3306/diyla?serverTimezone=Asia/Taipei";
	String userid = "root";
	String password = "t1993625";

//	private static final String INSERT_STMT = "INSERT INTO shopping_cart_list (memID,com_no,com_amount) VALUES (?, ?, ?)";
//	private static final String UPDATE = "UPDATE shopping_cart_list set com_amount = ? where com_no = ?";
//	private static final String DELETE = "DELETE FROM shopping_cart_list where com_no = ?";
//	private static final String GET_ALL_STMT = "SELECT com_no,com_amount from shopping_cart)list where memID = ?";

	@Override
	public void insert(int memID, CommodityVO comm, int amount) {

		try (Connection con = DriverManager.getConnection(url, userid, password);
				PreparedStatement pstmtSelect = con
						.prepareStatement("Select com_amount from shopping_cart_list where MEM_ID = ? and COM_NO = ?");
				PreparedStatement pstmtInsertCom = con
						.prepareStatement("INSERT INTO shopping_cart_list (MEM_ID,com_no,com_amount) VALUES (?, ?, ?)");
				PreparedStatement pstmtUpdateAmount = con.prepareStatement(
						"UPDATE shopping_cart_list set com_amount = ? where MEM_ID = ? and COM_NO = ?");) {
			pstmtSelect.setInt(1, memID);
			pstmtSelect.setInt(2, 1);
			try (ResultSet rs = pstmtSelect.executeQuery();) {
				if (rs.next()) {
//					int existingQuantity = rs.getInt("com_amount");
//					pstmtUpdateAmount.setInt(1, amount + existingQuantity);
//					pstmtUpdateAmount.setInt(2, memID);
//					pstmtUpdateAmount.setInt(3, 1);
//					pstmtUpdateAmount.executeUpdate();
					update(memID,comm, amount);

				} else {
					pstmtInsertCom.setInt(1, memID);
					pstmtInsertCom.setInt(2, 1);
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
	public void update(int memID, CommodityVO comm, int amount) {
		try (Connection con = DriverManager.getConnection(url, userid, password);
				PreparedStatement pstmtUpdate = con.prepareStatement(
						"UPDATE shopping_cart_list set com_amount = ? where MEM_ID = ? and COM_NO = ?");
				PreparedStatement pstmtSelect = con.prepareStatement(
						"Select com_amount from shopping_cart_list where MEM_ID = ? and COM_NO = ?");) {
			pstmtSelect.setInt(1, memID);
			pstmtSelect.setInt(2, 1);
			try (ResultSet rs = pstmtSelect.executeQuery();) {
				if (rs.next()) {
					int existingQuantity = rs.getInt("com_amount");
					pstmtUpdate.setInt(1, amount + existingQuantity);
					pstmtUpdate.setInt(2, memID);
					pstmtUpdate.setInt(3, 1);
					pstmtUpdate.executeUpdate();
//					if(existingQuantity<=0) {}
				}
			} catch (Exception e) {
				e.printStackTrace();
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void delete(int memID, CommodityVO comm) {
		try (Connection con = DriverManager.getConnection(url, userid, password);
				PreparedStatement pstmtDel = con.prepareStatement("DELETE FROM shopping_cart_list where MEM_ID = ? and COM_NO = ?"); 
				){
			pstmtDel.setInt(1, memID);
			pstmtDel.setInt(2, 1);
			pstmtDel.executeUpdate();
			
			
		} catch (Exception e) {
			// TODO: handle exception
		}
	}

	@Override
	public CommodityVO getCommByComNO(Integer comNO) {
		return null;
	}

	@Override
	public List<CommodityVO> getAll() {
		return null;
	}

	public static void main(String[] args) {
		CommodityVO commodityVO = new CommodityVO();
//		commodityVO.setComNO(1);
		ShoppingCartDaoImpl shoppingCartDaoImp = new ShoppingCartDaoImpl();
		shoppingCartDaoImp.insert(2, commodityVO, 5);
	}
}
