package com.cha102.diyla.commodityOrder;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.cha102.diyla.shoppingcart.ShoppingCartService;
import com.cha102.diyla.shoppingcart.ShoppingCartVO;

public class CommodityOrderDaoJNDI implements CommodityOrderDao {
	public static DataSource ds = null;

	static {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/diyla");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	public static final String INSERT = "INSERT INTO commodity_order (MEM_ID,ORDER_STATUS,ORDER_PRICE,DISCOUNT_PRICE,ACTUAL_PRICE,RECIPIENT,RECIPIENT_ADDRESS,PHONE) VALUES (?,?,?,?,?,?,?,?);";
	public static final String DLEETE = "SELECT * FROM commodity_order WHERE ORDER_NO = ? ";
	public static final String UPDATE_STATUS = "UPDATE commodity_order SET ORDER_STATUS = ? where ORDER_NO = ?";
	public static final String UPDATE = "UPDATE commodity_order SET ORDER_STATUS = ?, RECIPIENT = ?, RECIPIENT_ADDRESS = ?, PHONE = ? WHERE ORDER_NO = ?";
	public static final String GET_ALL_BY_MEMID = "SELECT * FROM commodity_order WHERE MEM_ID = ?";
	public static final String FIND_BY_ORDER_NO = "SELECT * FROM commodity_order WHERE ORDER_NO = ?";
	public static final String GET_ALL = "SELECT * FROM commodity_order";

	public int insert(CommodityOrderVO commodityOrderVO) {
		Integer generatedOrderNo = -1;

		try (Connection con = ds.getConnection();
				PreparedStatement pstm = con.prepareStatement(INSERT, Statement.RETURN_GENERATED_KEYS);) {
//			ShoppingCartService cartService = new ShoppingCartService();
//			List<ShoppingCartVO> cartVOs = cartService.getAll(memId);
//			Integer totalPrice = cartService.getTotalPrice(cartVOs);
			pstm.setInt(1, commodityOrderVO.getMemId());
			// 先以未結帳做預設
			pstm.setInt(2, commodityOrderVO.getOrderStatus());
			pstm.setInt(3, commodityOrderVO.getOrderPrice());
			// 目前代幣完善前 先以0帶入
			pstm.setInt(4, commodityOrderVO.getDiscountPrice());
			pstm.setInt(5, commodityOrderVO.getActualPrice());
			pstm.setString(6, commodityOrderVO.getRecipient());
			pstm.setString(7, commodityOrderVO.getRecipientAddress());
			pstm.setString(8, commodityOrderVO.getPhone());
			int i = pstm.executeUpdate();
			if (i > 0) {
				try (ResultSet generatedKeys = pstm.getGeneratedKeys()) {
					if (generatedKeys.next()) {
						generatedOrderNo = generatedKeys.getInt(1); // 獲取自動生成的訂單編號
					}
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return generatedOrderNo;
	}

	public void delete(Integer orderNo) {
		try (Connection con = ds.getConnection(); PreparedStatement pstm = con.prepareStatement(DLEETE);) {
			pstm.setInt(1, orderNo);
			pstm.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public void updateStatus(Integer status, Integer orderNO) {
		try (Connection con = ds.getConnection(); PreparedStatement pstm = con.prepareStatement(UPDATE_STATUS);) {
			pstm.setInt(1, status);
			pstm.setInt(2, orderNO);
			pstm.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public void update(Integer status, Integer orderNo, String recipient, String recipientAddress, String phone) {
		try (Connection con = ds.getConnection(); PreparedStatement pstm = con.prepareStatement(UPDATE);) {
			pstm.setInt(1, status);
			pstm.setString(2, recipient);
			pstm.setString(3, recipientAddress);
			pstm.setString(4, phone);
			pstm.setInt(5, orderNo);

			pstm.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public CommodityOrderVO findByOrderNo(Integer orderNo) {
		CommodityOrderVO commodityOrderVO = new CommodityOrderVO();
		try (Connection con = ds.getConnection(); PreparedStatement pstm = con.prepareStatement(FIND_BY_ORDER_NO);) {
			pstm.setInt(1, orderNo);

			try (ResultSet rs = pstm.executeQuery();) {
				if (rs.next()) {
					commodityOrderVO.setOrderNO(rs.getInt("ORDER_NO"));
					commodityOrderVO.setMemId(rs.getInt("MEM_ID"));
					commodityOrderVO.setOrderTime(rs.getTimestamp("ORDER_TIME"));
					commodityOrderVO.setOrderStatus(rs.getInt("ORDER_STATUS"));
					commodityOrderVO.setOrderPrice(rs.getInt("ORDER_PRICE"));
					commodityOrderVO.setDiscountPrice(rs.getInt("DISCOUNT_PRICE"));
					commodityOrderVO.setActualPrice(rs.getInt("ACTUAL_PRICE"));
					commodityOrderVO.setUpdateTime(rs.getTimestamp("UPDATE_TIME"));
					commodityOrderVO.setRecipient(rs.getString("RECIPIENT"));
					commodityOrderVO.setRecipientAddress(rs.getString("RECIPIENT_ADDRESS"));
					commodityOrderVO.setPhone(rs.getString("PHONE"));
				}
				return commodityOrderVO;
			} catch (Exception e) {
				// TODO: handle exception
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return commodityOrderVO;
	}

	public List<CommodityOrderVO> getAllByMemId(Integer memId) {
		List<CommodityOrderVO> commodityOrderlist = new ArrayList<CommodityOrderVO>();
		try (Connection con = ds.getConnection(); PreparedStatement pstm = con.prepareStatement(GET_ALL_BY_MEMID);) {
			CommodityOrderVO commodityOrderVO = null;
			pstm.setInt(1, memId);
			try (ResultSet rs = pstm.executeQuery();) {
				while (rs.next()) {
					commodityOrderVO = new CommodityOrderVO();
					commodityOrderVO.setOrderNO(rs.getInt("ORDER_NO"));
					commodityOrderVO.setMemId(rs.getInt("MEM_ID"));
					commodityOrderVO.setOrderTime(rs.getTimestamp("ORDER_TIME"));
					commodityOrderVO.setOrderStatus(rs.getInt("ORDER_STATUS"));
					commodityOrderVO.setOrderPrice(rs.getInt("ORDER_PRICE"));
					commodityOrderVO.setDiscountPrice(rs.getInt("DISCOUNT_PRICE"));
					commodityOrderVO.setActualPrice(rs.getInt("ACTUAL_PRICE"));
					commodityOrderVO.setUpdateTime(rs.getTimestamp("UPDATE_TIME"));
					commodityOrderVO.setRecipient(rs.getString("RECIPIENT"));
					commodityOrderVO.setRecipientAddress(rs.getString("RECIPIENT_ADDRESS"));
					commodityOrderVO.setPhone(rs.getString("PHONE"));
					commodityOrderlist.add(commodityOrderVO);
				}
				return commodityOrderlist;
			} catch (Exception e) {
				e.printStackTrace();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return null;
	}

	public List<CommodityOrderVO> getAll() {
		List<CommodityOrderVO> commodityOrderlist = new ArrayList<CommodityOrderVO>();
		try (Connection con = ds.getConnection(); PreparedStatement pstm = con.prepareStatement(GET_ALL);) {
			CommodityOrderVO commodityOrderVO = null;
			try (ResultSet rs = pstm.executeQuery();) {
				while (rs.next()) {
					commodityOrderVO = new CommodityOrderVO();
					commodityOrderVO.setOrderNO(rs.getInt("ORDER_NO"));
					commodityOrderVO.setMemId(rs.getInt("MEM_ID"));
					commodityOrderVO.setOrderTime(rs.getTimestamp("ORDER_TIME"));
					commodityOrderVO.setOrderStatus(rs.getInt("ORDER_STATUS"));
					commodityOrderVO.setOrderPrice(rs.getInt("ORDER_PRICE"));
					commodityOrderVO.setDiscountPrice(rs.getInt("DISCOUNT_PRICE"));
					commodityOrderVO.setActualPrice(rs.getInt("ACTUAL_PRICE"));
					commodityOrderVO.setUpdateTime(rs.getTimestamp("UPDATE_TIME"));
					commodityOrderVO.setRecipient(rs.getString("RECIPIENT"));
					commodityOrderVO.setRecipientAddress(rs.getString("RECIPIENT_ADDRESS"));
					commodityOrderVO.setPhone(rs.getString("PHONE"));
					commodityOrderlist.add(commodityOrderVO);
				}
				return commodityOrderlist;

			} catch (SQLException e) {
				e.printStackTrace();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return null;
	}

//	public List<CommodityOrderVO> sortBy(String sql) {
//		List<CommodityOrderVO> commodityOrderlist = new ArrayList<CommodityOrderVO>();
//		try (Connection con = ds.getConnection(); PreparedStatement pstm = con.prepareStatement(sql);) {
//			CommodityOrderVO commodityOrderVO = null;
//			try (ResultSet rs = pstm.executeQuery();) {
//				while (rs.next()) {
//					commodityOrderVO = new CommodityOrderVO();
//					commodityOrderVO.setOrderNO(rs.getInt("ORDER_NO"));
//					commodityOrderVO.setMemId(rs.getInt("MEM_ID"));
//					commodityOrderVO.setOrderTime(rs.getTimestamp("ORDER_TIME"));
//					commodityOrderVO.setOrderStatus(rs.getInt("ORDER_STATUS"));
//					commodityOrderVO.setOrderPrice(rs.getInt("ORDER_PRICE"));
//					commodityOrderVO.setDiscountPrice(rs.getInt("DISCOUNT_PRICE"));
//					commodityOrderVO.setActualPrice(rs.getInt("ACTUAL_PRICE"));
//					commodityOrderVO.setUpdateTime(rs.getTimestamp("UPDATE_TIME"));
//					commodityOrderlist.add(commodityOrderVO);
//				}
//				return commodityOrderlist;
//
//			} catch (SQLException e) {
//				e.printStackTrace();
//			}
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//
//		return null;
//	}

}
