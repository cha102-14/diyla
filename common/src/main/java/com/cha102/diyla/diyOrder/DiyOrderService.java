package com.cha102.diyla.diyOrder;

import java.sql.Timestamp;
import java.sql.Date;
import java.util.List;

public class DiyOrderService {
	private DiyOrderDAO_interface dao;

	public DiyOrderService() {
		dao = new DiyOrderDaoImpl();
	}

	public DiyOrderVO addOD(DiyOrderVO diyOrderVO) {
		dao.insert(diyOrderVO);
		return diyOrderVO;
	}
	
	public DiyOrderVO  upOD(DiyOrderVO diyOrderVO) {	
		dao.update( diyOrderVO);
		return diyOrderVO;
	}

	public void deleteDO(Integer diyOrderNo) {
		dao.delete(diyOrderNo);
	}

	public DiyOrderVO getOneDO(Integer diyOrderNo) {
		return dao.findByPrimaryKey(diyOrderNo);
	}

	public List<DiyOrderVO> getAll() {
		return dao.getAll();
	}
	
	public List<DiyOrderVO> findMemIdAllOrder(Integer memId) {
		return dao.getAllByMemID(memId);
	}
	
	// 查詢所有退款審核訂單(後台)
	public List<DiyOrderVO> getAllRefundod() {
		List<DiyOrderVO> d1 = dao.getAllRefundod();
		
//		if (d1.isEmpty()) {
//			
//		}
		
		return d1;
	}
	
	//
	public List<DiyOrderVO> getDeleteByID(Integer memId) {
		return dao.getDeleteByID(memId);
	}

	// 查詢特定時段的所有訂單(後台)
	public List<DiyOrderVO> getAllByDatePeriod(Date diyReserveDate, Integer diyPeriod) {
		return dao.getAllByDatePeriod(diyReserveDate,diyPeriod);
	}
	
	// 查時段的有效訂單(點名FOR現場人員) -- 已點
	public List<DiyOrderVO> getAllByDatePeriodAfter(Date diyReserveDate, Integer diyPeriod) {
		return dao.getAllByDatePeriodAfter(diyReserveDate,diyPeriod);
	}
		
}
