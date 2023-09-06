package com.cha102.diyla.diyOrder;

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

	public DiyOrderVO upOD(DiyOrderVO diyOrderVO) {
		dao.update(diyOrderVO);
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
		return dao.getAllRefundod();
	}

	//
	public List<DiyOrderVO> getDeleteByID(Integer memId) {
		return dao.getDeleteByID(memId);
	}

	// 查詢特定時段的所有正常訂單(後台)
	public List<DiyOrderVO> getAllByDatePeriod(Date diyReserveDate, Integer diyPeriod) {
		return dao.getAllByDatePeriod(diyReserveDate, diyPeriod);
	}

	// 查詢特定時段的某會員訂單(前台)
	public List<DiyOrderVO> getAllByMemIDDatePeriod(Integer memId, Date diyReserveDate, Integer diyPeriod) {
		return dao.getAllByMemIDDatePeriod(memId, diyReserveDate, diyPeriod);
	}

	// 查時段的有效訂單(查詢時段有效訂單FOR現場人員)
	public List<DiyOrderVO> getAllByDatePeriodAfter(Date diyReserveDate, Integer diyPeriod) {
		return dao.getAllByDatePeriodAfter(diyReserveDate, diyPeriod);
	}
	
	// 查時段的所有訂單(點完名後總攬FOR現場人員)
	public List<DiyOrderVO> getAllOrderByPeriod(Date diyReserveDate, Integer diyPeriod) {
		return dao.getRollCall(diyReserveDate, diyPeriod);
	}

//	public List<DiyCateEntity> getAllDiyCates(){
//		return diyCateRepository.findAll();

//	}

}
