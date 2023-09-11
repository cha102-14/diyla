package com.cha102.diyla.diyOrder;

import java.sql.Date;
import java.util.List;
import java.util.Map;

public interface DiyOrderDAO_interface {
    public void insert(DiyOrderVO diyOrderVO);
    public void update(DiyOrderVO diyOrderVO);
    public void delete(Integer diyOrderNo);
    public DiyOrderVO findByPrimaryKey(Integer diyOrderNo);
    
    // 查所有訂單
    public List<DiyOrderVO> getAll();
    // 該會員所有訂單
    public List<DiyOrderVO> getAllByMemID(Integer memId);
    // 查會員於該時間以及時段內的訂單(前台)
    public List<DiyOrderVO> getAllByMemIDDatePeriod(Integer memId, Date diyReserveDate,Integer diyPeriod);
    // 查該時間以及時段內的所有訂單 (for 現場點名人員)
    public List<DiyOrderVO> getAllByDatePeriod(Date diyReserveDate,Integer diyPeriod);
    // 查詢該時段所有正常訂單的會員(要點名完總攬)	
    public List<DiyOrderVO> getAllByDatePeriodAfter(Date diyReserveDate,Integer diyPeriod);
    //後台現場人員點名系統(點名完總攬)
    public List<DiyOrderVO> getRollCall(Date diyReserveDate, Integer diyPeriod);
    
    
    // 該會員所有取消訂單 
    public List<DiyOrderVO> getDeleteByID(Integer memId);
    
  //查時段的所有訂單//訂位人數\\
    public List<DiyOrderDTO> getPeopleCountByAllPeriod();
    
    
    // 查詢所有退款審核訂單
    public List<DiyOrderVO> getAllRefundod();
	public DiyOrderDTO getOneDTODatePeriod(Date diyReserveDate,Integer diyPeriod);
}