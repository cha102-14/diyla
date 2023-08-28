package com.cha102.diyla.diyOrder;

import java.sql.Date;
import java.util.List;

public interface DiyOrderDAO_interface {
    public void insert(DiyOrderVO diyOrderVO);
    public void update(DiyOrderVO diyOrderVO);
    public void delete(Integer diyOrderNo);
    public DiyOrderVO findByPrimaryKey(Integer diyOrderNo);
    
    // 查所有訂單
    public List<DiyOrderVO> getAll();
    // 該會員所有訂單
    public List<DiyOrderVO> getAllByMemID(Integer memId);
    // 查會員於該時間以及時段內的訂單
    public List<DiyOrderVO> getAllBy_MemID_Date_Period(Integer memId, Date diyReserveDate,Integer diyPeriod);
    // 查該時間以及時段內的所有訂單
    public List<DiyOrderVO> getAllBy_Date_Period(Date diyReserveDate,Integer diyPeriod);
    
    
    
    
    
    public List<DiyOrderVO> getAllRefundod();
}