package com.cha102.diyla.commodityOrderDetail;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.cha102.diyla.commodityModel.CommodityService;
import com.cha102.diyla.shoppingcart.ShoppingCartVO;

public class CommodityOrderDetailDaoJNDI implements CommodityOrderDetailDao {
	CommodityService commodityService = new CommodityService();
	public static DataSource ds = null;

	static {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/diyla");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	public static final String GET_ALL = "SELECT * FROM commodity_order_detail WHERE ORDER_NO = ?";
	@Override
	public void insert(Integer orderNo, List<ShoppingCartVO> shoppingCartList) {
		StringBuffer sqlBuffer = new StringBuffer(
				"INSERT INTO commodity_order_detail (ORDER_NO,COM_NO,COM_QUANTITY,COM_PRICE) VALUES (?,?,?,?)");
		int size = shoppingCartList.size();
		for (int i = 0; i < size - 1; i++) {
			sqlBuffer.append(",(?,?,?,?)");
		}
		String sql = sqlBuffer.substring(0, sqlBuffer.length() - 1) + ");";
		try (Connection con = ds.getConnection(); PreparedStatement pstm = con.prepareStatement(sql);) {

			for (int i = 0; i < size; i++) {
				ShoppingCartVO shoppingCartVO = shoppingCartList.get(i);
				int comPri = shoppingCartVO.getComPri();
				int amount = shoppingCartVO.getComAmount();
				int parameterIndex = i * 4;
				pstm.setInt(1 + parameterIndex, orderNo);
				pstm.setInt(2 + parameterIndex, shoppingCartVO.getComNo());
				pstm.setInt(3 + parameterIndex, amount);
				pstm.setInt(4 + parameterIndex, comPri * amount);
			}
			pstm.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public List<CommodityOrderDetailVO> getAll(Integer orderNo) {
		List<CommodityOrderDetailVO> commodityOrderDetailVOs = new ArrayList<>();
		try (Connection con = ds.getConnection();
				PreparedStatement pstm = con.prepareStatement(
						"SELECT COD.*, C.COM_PRI FROM COMMODITY C JOIN COMMODITY_ORDER_DETAIL COD ON C.COM_NO=COD.COM_NO WHERE ORDER_NO =?;");) {
			pstm.setInt(1, orderNo);
			try (ResultSet rs = pstm.executeQuery();) {
				while (rs.next()) {
					CommodityOrderDetailVO commodityOrderDetailVO = new CommodityOrderDetailVO();
					commodityOrderDetailVO.setOrderNo(rs.getInt("ORDER_NO"));
					commodityOrderDetailVO.setComNo(rs.getInt("COM_NO"));
					commodityOrderDetailVO.setComPrice(rs.getInt("COM_PRICE"));
					commodityOrderDetailVO.setComQuantity(rs.getInt("COM_QUANTITY"));
					commodityOrderDetailVO.setUnitPrice(rs.getInt("COM_PRI"));
					commodityOrderDetailVOs.add(commodityOrderDetailVO);
				}
				return commodityOrderDetailVOs;
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return commodityOrderDetailVOs;
	}

}
