package com.cha102.diyla.commodityClassModel;

import java.sql.Timestamp;

public class CommodityClassVO {
    private Integer comClassNo;
    private String comClassName;
    private Timestamp updateTime;

    public CommodityClassVO(){}

    public CommodityClassVO(Integer comClassNo, String comClassName, Timestamp updateTime) {
        this.comClassNo = comClassNo;
        this.comClassName = comClassName;
        this.updateTime = updateTime;
    }

    public Integer getComClassNo() {
        return comClassNo;
    }

    public void setComClassNo(Integer comClassNo) {
        this.comClassNo = comClassNo;
    }

    public String getComClassName() {
        return comClassName;
    }

    public void setComClassName(String comClassName) {
        this.comClassName = comClassName;
    }

    public Timestamp getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Timestamp updateTime) {
        this.updateTime = updateTime;
    }
}
