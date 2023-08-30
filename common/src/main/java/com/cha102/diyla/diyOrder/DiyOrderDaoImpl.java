package com.cha102.diyla.diyOrder;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class DiyOrderDaoImpl implements DiyOrderDAO_interface {

	public static DataSource ds = null;

	// 在靜態區塊中初始化DataSource
	static {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/diyla");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}

	// SQL指令 - 新增訂單
	private final String INSERT_SQL = "INSERT INTO DIYLA.DIY_ORDER (MEM_ID, DIY_NO, CONTACT_PERSON, CONTACT_PHONE, RESERVATION_NUM, DIY_PERIOD, DIY_RESERVE_DATE, RESERVATION_STATUS, PAYMENT_STATUS, DIY_PRICE) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";

	// SQL指令 - 更新訂單
	private final String UPDATE_SQL = "UPDATE DIYLA.DIY_ORDER SET MEM_ID=?, DIY_NO=?, CONTACT_PERSON=?, CONTACT_PHONE=?, RESERVATION_NUM=?, DIY_PERIOD=?, DIY_RESERVE_DATE=?, RESERVATION_STATUS=?, PAYMENT_STATUS=?, DIY_PRICE=? WHERE DIY_ORDER_NO=?;";

	// SQL指令 - 刪除訂單
	private final String DELETE_SQL = "DELETE FROM DIYLA.DIY_ORDER WHERE DIY_ORDER_NO=?;";

	// SQL指令 - 查詢單筆訂單
	private final String FIND_BY_PK_SQL = "SELECT * FROM DIYLA.DIY_ORDER WHERE DIY_ORDER_NO=?;";

	// SQL指令 - 查詢所有訂單
	private final String GET_ALL_SQL = "SELECT * FROM DIYLA.DIY_ORDER;";

	// SQL指令 - 查詢某會員所有訂單
	private final String GET_ALL_BY_MEMID_SQL = "SELECT Diy_Order_No, Mem_Id, Diy_No, Contact_Person, Contact_Phone, Reservation_Num, Diy_Period, Diy_Reserve_Date, Create_Time, Reservation_Status, Payment_Status, Diy_Price FROM diy_order where MEM_ID = ? ORDER BY Diy_Order_No;";

	// SQL指令 - 查詢所有退款訂單(後台)
	private final String GET_ALL_REFUND_SQL = "SELECT * FROM DIYLA.DIY_ORDER WHERE RESERVATION_STATUS=1 AND PAYMENT_STATUS = 0;";

	// SQL指令 - 查詢該會員退款訂單(前台)
	private final String GET_ALL_REFUND_BYMEMID_SQL = "SELECT * FROM DIYLA.DIY_ORDER WHERE RESERVATION_STATUS=1 AND PAYMENT_STATUS = 0 AND MEM_ID = ? ;";

	// SQL指令 - 查詢該時段所有正常訂單的會員
	private final String GET_ALL_ORDER_BY_PERIOD_SQL = "SELECT * FROM DIYLA.DIY_ORDER WHERE DIY_RESERVE_DATE = ? AND DIY_PERIOD = ? AND RESERVATION_STATUS = 0 AND (PAYMENT_STATUS = 0 or 1);;";

	// SQL指令 - 查詢該時段所有正常訂單的會員(已點名完總覽)
	private final String GET_ALL_ORDER_BY_PERIOD_AFTER_SQL = "SELECT * FROM DIYLA.DIY_ORDER WHERE DIY_RESERVE_DATE = ? AND DIY_PERIOD = ? AND (RESERVATION_STATUS = 0 or 3) AND (PAYMENT_STATUS = 0 or 1 or 2);;";

	@Override
	public void insert(DiyOrderVO diyOrderVO) {
		try (Connection conn = ds.getConnection(); PreparedStatement ps = conn.prepareStatement(INSERT_SQL);) {
			// 設置事務為手動提交
			conn.setAutoCommit(false);
			ps.setInt(1, diyOrderVO.getMemId());
			ps.setInt(2, diyOrderVO.getDiyNo());
			ps.setString(3, diyOrderVO.getContactPerson());
			ps.setString(4, diyOrderVO.getContactPhone());
			ps.setInt(5, diyOrderVO.getReservationNum());
			ps.setInt(6, diyOrderVO.getDiyPeriod());
			ps.setDate(7, diyOrderVO.getDiyReserveDate());
//            ps.setTimestamp(8, diyOrderVO.getCreateTime());
			ps.setInt(8, diyOrderVO.getReservationStatus());
			ps.setInt(9, diyOrderVO.getPaymentStatus());
			ps.setInt(10, diyOrderVO.getDiyPrice());

			ps.executeUpdate();
			// 提交事務
			conn.commit();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

//  SET MEM_ID=?, DIY_NO=?, CONTACT_PERSON=?, CONTACT_PHONE=?, RESERVATION_NUM=?, DIY_PERIOD=?
//, DIY_RESERVE_DATE=?, RESERVATION_STATUS=?, PAYMENT_STATUS=?, DIY_PRICE=? WHERE DIY_ORDER_NO=?
	@Override
	public void update(DiyOrderVO diyOrderVO) {
		try (Connection conn = ds.getConnection(); PreparedStatement ps = conn.prepareStatement(UPDATE_SQL);) {
			// 設置事務為手動提交
			conn.setAutoCommit(false);
			ps.setInt(1, diyOrderVO.getMemId());
			ps.setInt(2, diyOrderVO.getDiyNo());
			ps.setString(3, diyOrderVO.getContactPerson());
			ps.setString(4, diyOrderVO.getContactPhone());
			ps.setInt(5, diyOrderVO.getReservationNum());
			ps.setInt(6, diyOrderVO.getDiyPeriod());
			ps.setDate(7, diyOrderVO.getDiyReserveDate());
//            ps.setTimestamp(8, diyOrderVO.getCreateTime());
			ps.setInt(8, diyOrderVO.getReservationStatus());
			ps.setInt(9, diyOrderVO.getPaymentStatus());
			ps.setInt(10, diyOrderVO.getDiyPrice());
			ps.setInt(11, diyOrderVO.getDiyOrderNo());

			ps.executeUpdate();

			// 提交事務
			conn.commit();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void delete(Integer diyOrderNo) {
		try (Connection conn = ds.getConnection(); PreparedStatement ps = conn.prepareStatement(DELETE_SQL);) {
			// 設置事務為手動提交
			conn.setAutoCommit(false);
			ps.setInt(1, diyOrderNo);

			ps.executeUpdate();

			// 提交事務
			conn.commit();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public List<DiyOrderVO> getAll() {
		List<DiyOrderVO> diyOrderList = new ArrayList<>();
		try (Connection conn = ds.getConnection();
				PreparedStatement ps = conn.prepareStatement(GET_ALL_SQL);
				ResultSet rs = ps.executeQuery()) {
			while (rs.next()) {
				DiyOrderVO diyOrderVO = new DiyOrderVO();
				diyOrderVO.setDiyOrderNo(rs.getInt("DIY_ORDER_NO"));
				diyOrderVO.setMemId(rs.getInt("MEM_ID"));
				diyOrderVO.setDiyNo(rs.getInt("DIY_NO"));
				diyOrderVO.setContactPerson(rs.getString("CONTACT_PERSON"));
				diyOrderVO.setContactPhone(rs.getString("CONTACT_Phone"));
				diyOrderVO.setReservationNum(rs.getInt("RESERVATION_NUM"));
				diyOrderVO.setDiyPeriod(rs.getInt("DIY_PERIOD"));
				diyOrderVO.setDiyReserveDate(rs.getDate("DIY_RESERVE_DATE"));
				diyOrderVO.setCreateTime(rs.getTimestamp("CREATE_TIME"));
				diyOrderVO.setReservationStatus(rs.getInt("RESERVATION_STATUS"));
				diyOrderVO.setPaymentStatus(rs.getInt("PAYMENT_STATUS"));
				diyOrderVO.setDiyPrice(rs.getInt("DIY_PRICE"));
				diyOrderList.add(diyOrderVO);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return diyOrderList;
	}

	@Override
	public DiyOrderVO findByPrimaryKey(Integer diyOrderNo) {
		DiyOrderVO diyOrderVO = null;
		try (Connection conn = ds.getConnection(); PreparedStatement ps = conn.prepareStatement(FIND_BY_PK_SQL);) {
			ps.setInt(1, diyOrderNo);
			try (ResultSet rs = ps.executeQuery()) {
				if (rs.next()) {
					diyOrderVO = new DiyOrderVO();
					diyOrderVO.setDiyOrderNo(rs.getInt("DIY_ORDER_NO"));
					diyOrderVO.setMemId(rs.getInt("MEM_ID"));
					diyOrderVO.setDiyNo(rs.getInt("DIY_NO"));
					diyOrderVO.setContactPerson(rs.getString("CONTACT_PERSON"));
					diyOrderVO.setContactPhone(rs.getString("CONTACT_Phone"));
					diyOrderVO.setReservationNum(rs.getInt("RESERVATION_NUM"));
					diyOrderVO.setDiyPeriod(rs.getInt("DIY_PERIOD"));
					diyOrderVO.setDiyReserveDate(rs.getDate("DIY_RESERVE_DATE"));
					diyOrderVO.setCreateTime(rs.getTimestamp("CREATE_TIME"));
					diyOrderVO.setReservationStatus(rs.getInt("RESERVATION_STATUS"));
					diyOrderVO.setPaymentStatus(rs.getInt("PAYMENT_STATUS"));
					diyOrderVO.setDiyPrice(rs.getInt("DIY_PRICE"));
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return diyOrderVO;
	}

	@Override
	public List<DiyOrderVO> getAllByMemID(Integer memId) {
		List<DiyOrderVO> diyOrderList = new ArrayList<>();
		try (Connection conn = ds.getConnection();
				PreparedStatement ps = conn.prepareStatement(GET_ALL_BY_MEMID_SQL);) {
			ps.setInt(1, memId);
			try (ResultSet rs = ps.executeQuery()) {
				while (rs.next()) {
					DiyOrderVO diyOrderVO = new DiyOrderVO();
					diyOrderVO.setDiyOrderNo(rs.getInt("DIY_ORDER_NO"));
					diyOrderVO.setMemId(rs.getInt("MEM_ID"));
					diyOrderVO.setDiyNo(rs.getInt("DIY_NO"));
					diyOrderVO.setContactPerson(rs.getString("CONTACT_PERSON"));
					diyOrderVO.setContactPhone(rs.getString("CONTACT_Phone"));
					diyOrderVO.setReservationNum(rs.getInt("RESERVATION_NUM"));
					diyOrderVO.setDiyPeriod(rs.getInt("DIY_PERIOD"));
					diyOrderVO.setDiyReserveDate(rs.getDate("DIY_RESERVE_DATE"));
					diyOrderVO.setCreateTime(rs.getTimestamp("CREATE_TIME"));
					diyOrderVO.setReservationStatus(rs.getInt("RESERVATION_STATUS"));
					diyOrderVO.setPaymentStatus(rs.getInt("PAYMENT_STATUS"));
					diyOrderVO.setDiyPrice(rs.getInt("DIY_PRICE"));
					diyOrderList.add(diyOrderVO);
				}
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return diyOrderList;
	}

	// 查會員於該時間以及時段內的訂單
	@Override
	public List<DiyOrderVO> getAllByMemIDDatePeriod(Integer memId, Date diyReserveDate, Integer diyPeriod) {
		// TODO Auto-generated method stub
		return null;
	}

	// 查時段的有效訂單(點名FOR現場人員)
	@Override
	public List<DiyOrderVO> getAllByDatePeriod(Date diyReserveDate, Integer diyPeriod) {
		List<DiyOrderVO> diyOrderList = new ArrayList<>();
		try (Connection conn = ds.getConnection();
				PreparedStatement ps = conn.prepareStatement(GET_ALL_ORDER_BY_PERIOD_SQL);) {
			ps.setDate(1, diyReserveDate);
			ps.setInt(2, diyPeriod);
			try (ResultSet rs = ps.executeQuery()) {
				while (rs.next()) {
					DiyOrderVO diyOrderVO = new DiyOrderVO();
					diyOrderVO.setDiyOrderNo(rs.getInt("DIY_ORDER_NO"));
					diyOrderVO.setMemId(rs.getInt("MEM_ID"));
					diyOrderVO.setDiyNo(rs.getInt("DIY_NO"));
					diyOrderVO.setContactPerson(rs.getString("CONTACT_PERSON"));
					diyOrderVO.setContactPhone(rs.getString("CONTACT_Phone"));
					diyOrderVO.setReservationNum(rs.getInt("RESERVATION_NUM"));
					diyOrderVO.setDiyPeriod(rs.getInt("DIY_PERIOD"));
					diyOrderVO.setDiyReserveDate(rs.getDate("DIY_RESERVE_DATE"));
					diyOrderVO.setCreateTime(rs.getTimestamp("CREATE_TIME"));
					diyOrderVO.setReservationStatus(rs.getInt("RESERVATION_STATUS"));
					diyOrderVO.setPaymentStatus(rs.getInt("PAYMENT_STATUS"));
					diyOrderVO.setDiyPrice(rs.getInt("DIY_PRICE"));
					diyOrderList.add(diyOrderVO);
				}
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return diyOrderList;
	}

	// 查時段的有效訂單(點名FOR現場人員) -- 已點
	@Override
	public List<DiyOrderVO> getAllByDatePeriodAfter(Date diyReserveDate, Integer diyPeriod) {
		List<DiyOrderVO> diyOrderList = new ArrayList<>();
		try (Connection conn = ds.getConnection();
				PreparedStatement ps = conn.prepareStatement(GET_ALL_ORDER_BY_PERIOD_AFTER_SQL);) {
			ps.setDate(1, diyReserveDate);
			ps.setInt(2, diyPeriod);
			try (ResultSet rs = ps.executeQuery()) {
				while (rs.next()) {
					DiyOrderVO diyOrderVO = new DiyOrderVO();
					diyOrderVO.setDiyOrderNo(rs.getInt("DIY_ORDER_NO"));
					diyOrderVO.setMemId(rs.getInt("MEM_ID"));
					diyOrderVO.setDiyNo(rs.getInt("DIY_NO"));
					diyOrderVO.setContactPerson(rs.getString("CONTACT_PERSON"));
					diyOrderVO.setContactPhone(rs.getString("CONTACT_Phone"));
					diyOrderVO.setReservationNum(rs.getInt("RESERVATION_NUM"));
					diyOrderVO.setDiyPeriod(rs.getInt("DIY_PERIOD"));
					diyOrderVO.setDiyReserveDate(rs.getDate("DIY_RESERVE_DATE"));
					diyOrderVO.setCreateTime(rs.getTimestamp("CREATE_TIME"));
					diyOrderVO.setReservationStatus(rs.getInt("RESERVATION_STATUS"));
					diyOrderVO.setPaymentStatus(rs.getInt("PAYMENT_STATUS"));
					diyOrderVO.setDiyPrice(rs.getInt("DIY_PRICE"));
					diyOrderList.add(diyOrderVO);
				}
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return diyOrderList;
	}

	// 查詢該會員退款訂單(前台)
	@Override
	public List<DiyOrderVO> getDeleteByID(Integer memId) {
		List<DiyOrderVO> diyOrderList = new ArrayList<>();
		try (Connection conn = ds.getConnection();
				PreparedStatement ps = conn.prepareStatement(GET_ALL_REFUND_BYMEMID_SQL);) {
			ps.setInt(1, memId);
			try (ResultSet rs = ps.executeQuery()) {
				while (rs.next()) {
					DiyOrderVO diyOrderVO = new DiyOrderVO();
					diyOrderVO.setDiyOrderNo(rs.getInt("DIY_ORDER_NO"));
					diyOrderVO.setMemId(rs.getInt("MEM_ID"));
					diyOrderVO.setDiyNo(rs.getInt("DIY_NO"));
					diyOrderVO.setContactPerson(rs.getString("CONTACT_PERSON"));
					diyOrderVO.setContactPhone(rs.getString("CONTACT_Phone"));
					diyOrderVO.setReservationNum(rs.getInt("RESERVATION_NUM"));
					diyOrderVO.setDiyPeriod(rs.getInt("DIY_PERIOD"));
					diyOrderVO.setDiyReserveDate(rs.getDate("DIY_RESERVE_DATE"));
					diyOrderVO.setCreateTime(rs.getTimestamp("CREATE_TIME"));
					diyOrderVO.setReservationStatus(rs.getInt("RESERVATION_STATUS"));
					diyOrderVO.setPaymentStatus(rs.getInt("PAYMENT_STATUS"));
					diyOrderVO.setDiyPrice(rs.getInt("DIY_PRICE"));
					diyOrderList.add(diyOrderVO);
				}
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return diyOrderList;
	}
	
	// 查詢所有會員退款訂單(後台)
		@Override
		public List<DiyOrderVO> getAllRefundod() {
			List<DiyOrderVO> diyOrderList = new ArrayList<>();
			try (Connection conn = ds.getConnection(); PreparedStatement ps = conn.prepareStatement(GET_ALL_REFUND_SQL);) {
				try (ResultSet rs = ps.executeQuery()) {
					while (rs.next()) {
						DiyOrderVO diyOrderVO = new DiyOrderVO();
						diyOrderVO.setDiyOrderNo(rs.getInt("DIY_ORDER_NO"));
						diyOrderVO.setMemId(rs.getInt("MEM_ID"));
						diyOrderVO.setDiyNo(rs.getInt("DIY_NO"));
						diyOrderVO.setContactPerson(rs.getString("CONTACT_PERSON"));
						diyOrderVO.setContactPhone(rs.getString("CONTACT_Phone"));
						diyOrderVO.setReservationNum(rs.getInt("RESERVATION_NUM"));
						diyOrderVO.setDiyPeriod(rs.getInt("DIY_PERIOD"));
						diyOrderVO.setDiyReserveDate(rs.getDate("DIY_RESERVE_DATE"));
						diyOrderVO.setCreateTime(rs.getTimestamp("CREATE_TIME"));
						diyOrderVO.setReservationStatus(rs.getInt("RESERVATION_STATUS"));
						diyOrderVO.setPaymentStatus(rs.getInt("PAYMENT_STATUS"));
						diyOrderVO.setDiyPrice(rs.getInt("DIY_PRICE"));
						diyOrderList.add(diyOrderVO);
					}
				}

			} catch (SQLException e) {
				e.printStackTrace();
			}
			return diyOrderList;
		}

}
