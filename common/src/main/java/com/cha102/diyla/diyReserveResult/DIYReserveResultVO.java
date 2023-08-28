package com.cha102.diyla.diyreserveresult;

import java.io.Serializable;
import java.sql.Date;
import java.sql.Timestamp;

public class DIYReserveResultVO implements Serializable{
    private Integer diyReserveNo;
    private Date diyReserveDate;
    private Byte diyPeriod;
    private Integer peoCount;
    private Byte reserveStatus;
    private Timestamp reserveUpdTime;
    private Integer peoLimit;

    // Constructors
    public DIYReserveResultVO() {
    }

    public DIYReserveResultVO(Integer diyReserveNo, Date diyReserveDate, Byte diyPeriod,
                              Integer peoCount, Byte reserveStatus, Timestamp reserveUpdTime, Integer peoLimit) {
        this.diyReserveNo = diyReserveNo;
        this.diyReserveDate = diyReserveDate;
        this.diyPeriod = diyPeriod;
        this.peoCount = peoCount;
        this.reserveStatus = reserveStatus;
        this.reserveUpdTime = reserveUpdTime;
        this.peoLimit = peoLimit;
    }

    // Getters and Setters
    public Integer getDiyReserveNo() {
        return diyReserveNo;
    }

    public void setDiyReserveNo(Integer diyReserveNo) {
        this.diyReserveNo = diyReserveNo;
    }

    public Date getDiyReserveDate() {
        return diyReserveDate;
    }

    public void setDiyReserveDate(Date diyReserveDate) {
        this.diyReserveDate = diyReserveDate;
    }

    public Byte getDiyPeriod() {
        return diyPeriod;
    }

    public void setDiyPeriod(Byte diyPeriod) {
        this.diyPeriod = diyPeriod;
    }

    public Integer getPeoCount() {
        return peoCount;
    }

    public void setPeoCount(Integer peoCount) {
        this.peoCount = peoCount;
    }

    public Byte getReserveStatus() {
        return reserveStatus;
    }

    public void setReserveStatus(Byte reserveStatus) {
        this.reserveStatus = reserveStatus;
    }

    public Timestamp getReserveUpdTime() {
        return reserveUpdTime;
    }

    public void setReserveUpdTime(Timestamp reserveUpdTime) {
        this.reserveUpdTime = reserveUpdTime;
    }

    public Integer getPeoLimit() {
        return peoLimit;
    }

    public void setPeoLimit(Integer peoLimit) {
        this.peoLimit = peoLimit;
    }

    @Override
    public String toString() {
        return "DIYReserveResultVO{" +
                "diyReserveNo=" + diyReserveNo +
                ", diyReserveDate=" + diyReserveDate +
                ", diyPeriod=" + diyPeriod +
                ", peoCount=" + peoCount +
                ", reserveStatus=" + reserveStatus +
                ", reserveUpdTime=" + reserveUpdTime +
                ", peoLimit=" + peoLimit +
                '}';
    }
}
