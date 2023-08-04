package com.cha102.diyla.diyOrder;

import java.io.Serializable;
import java.sql.Timestamp;

public class DiyOrderVO implements Serializable {
	
    private Integer diyOrderNo;
    private Integer memId;
    private Integer diyNo;
    private String contactPerson;
    private String articleContent;
    private Integer reservationNum;
    private Integer diyPeriod;
    private java.sql.Date diyReserveDate;
    private Timestamp createTime;
    private Byte reservationStatus;
    private Byte paymentStatus;
    private Integer diyPrice;
    
    // 無參數
    public DiyOrderVO() {
    	
    }
    
    // 帶參數的
    public DiyOrderVO(Integer diyOrderNo, Integer memId, Integer diyNo, String contactPerson,
                      String articleContent, Integer reservationNum, Integer diyPeriod,
                      java.sql.Date diyReserveDate, Timestamp createTime, Byte reservationStatus,
                      Byte paymentStatus, Integer diyPrice) {
        this.diyOrderNo = diyOrderNo;
        this.memId = memId;
        this.diyNo = diyNo;
        this.contactPerson = contactPerson;
        this.articleContent = articleContent;
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
    public String getArticleContent() {
        return articleContent;
    }
    public void setArticleContent(String articleContent) {
        this.articleContent = articleContent;
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
    public java.sql.Date getDiyReserveDate() {
        return diyReserveDate;
    }
    public void setDiyReserveDate(java.sql.Date diyReserveDate) {
        this.diyReserveDate = diyReserveDate;
    }
    public Timestamp getCreateTime() {
        return createTime;
    }
    public void setCreateTime(Timestamp createTime) {
        this.createTime = createTime;
    }
    public Byte getReservationStatus() {
        return reservationStatus;
    }
    public void setReservationStatus(Byte reservationStatus) {
        this.reservationStatus = reservationStatus;
    }
    public Byte getPaymentStatus() {
        return paymentStatus;
    }
    public void setPaymentStatus(Byte paymentStatus) {
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
                + ", contactPerson=" + contactPerson + ", articleContent=" + articleContent
                + ", reservationNum=" + reservationNum + ", diyPeriod=" + diyPeriod
                + ", diyReserveDate=" + diyReserveDate + ", createTime=" + createTime
                + ", reservationStatus=" + reservationStatus + ", paymentStatus=" + paymentStatus
                + ", diyPrice=" + diyPrice + "]";
    }
}
