package com.cha102.diyla.diyOrder;

import java.io.Serializable;
import java.sql.Timestamp;

import com.cha102.diyla.member.MemVO;
import com.cha102.diyla.member.MemberService;

import java.sql.Date;

public class DiyOrderVO implements Serializable {
	
    private Integer diyOrderNo;
    private Integer memId;
    private Integer diyNo;
    private String contactPerson;
    private String contactPhone;
    private Integer reservationNum;
    private Integer diyPeriod;
    private Date diyReserveDate;
    private Timestamp createTime;
    private Integer reservationStatus;
    private Integer paymentStatus;
    private Integer diyPrice;
    private MemVO memVO;
    
    // 無參數
    public DiyOrderVO() {
    	
    }
    
    // 帶參數的
    public DiyOrderVO(Integer diyOrderNo, Integer memId, Integer diyNo, String contactPerson,
                      String contactPhone, Integer reservationNum, Integer diyPeriod,
                      Date diyReserveDate, Timestamp createTime, Integer reservationStatus,
                      Integer paymentStatus, Integer diyPrice) {
        this.diyOrderNo = diyOrderNo;
        this.memId = memId;
        this.diyNo = diyNo;
        this.contactPerson = contactPerson;
        this.contactPhone = contactPhone;
        this.reservationNum = reservationNum;
        this.diyPeriod = diyPeriod;
        this.diyReserveDate = diyReserveDate;
        this.createTime = createTime;
        this.reservationStatus = reservationStatus;
        this.paymentStatus = paymentStatus;
        this.diyPrice = diyPrice;
    }
    
    // Getters and Setters
    public Integer getDiyOrderNo() {
        return diyOrderNo;
    }
    public void setDiyOrderNo(Integer diyOrderNo) {
        this.diyOrderNo = diyOrderNo;
    }
    public Integer getMemId() {
        return memId;
    }
    public void setMemId(Integer memId) {
        this.memId = memId;
    }
    public Integer getDiyNo() {
        return diyNo;
    }
    public void setDiyNo(Integer diyNo) {
        this.diyNo = diyNo;
    }
    public String getContactPerson() {
        return contactPerson;
    }
    public void setContactPerson(String contactPerson) {
        this.contactPerson = contactPerson;
    }
    public String getContactPhone() {
        return contactPhone;
    }
    public void setContactPhone(String contactPhone) {
        this.contactPhone = contactPhone;
    }
    public Integer getReservationNum() {
        return reservationNum;
    }
    public void setReservationNum(Integer reservationNum) {
        this.reservationNum = reservationNum;
    }
    public Integer getDiyPeriod() {
        return diyPeriod;
    }
    public void setDiyPeriod(Integer diyPeriod) {
        this.diyPeriod = diyPeriod;
    }
    public Date getDiyReserveDate() {
        return diyReserveDate;
    }
    public void setDiyReserveDate(Date diyReserveDate) {
        this.diyReserveDate = diyReserveDate;
    }
    public Timestamp getCreateTime() {
        return createTime;
    }
    public void setCreateTime(Timestamp createTime) {
        this.createTime = createTime;
    }
    public Integer getReservationStatus() {
        return reservationStatus;
    }
    public void setReservationStatus(Integer reservationStatus) {
        this.reservationStatus = reservationStatus;
    }
    public Integer getPaymentStatus() {
        return paymentStatus;
    }
    public void setPaymentStatus(Integer paymentStatus) {
        this.paymentStatus = paymentStatus;
    }
    public Integer getDiyPrice() {
        return diyPrice;
    }
    public void setDiyPrice(Integer diyPrice) {
        this.diyPrice = diyPrice;
    }

    @Override
    public String toString() {
        return "DiyOrderVO [diyOrderNo=" + diyOrderNo + ", memId=" + memId + ", diyNo=" + diyNo
                + ", contactPerson=" + contactPerson + ", contactPhone=" + contactPhone
                + ", reservationNum=" + reservationNum + ", diyPeriod=" + diyPeriod
                + ", diyReserveDate=" + diyReserveDate + ", createTime=" + createTime
                + ", reservationStatus=" + reservationStatus + ", paymentStatus=" + paymentStatus
                + ", diyPrice=" + diyPrice + "]";
    }
    
    public MemVO getMemVO() {
        MemberService memSvc = new MemberService();
        MemVO memVO = memSvc.selectMem(memId);
        
        return memVO;
    }
}
