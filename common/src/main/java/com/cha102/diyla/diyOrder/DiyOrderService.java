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
	
	public List<DiyOrderVO> getAllRefundod() {
		return dao.getAllRefundod();
	}

}
