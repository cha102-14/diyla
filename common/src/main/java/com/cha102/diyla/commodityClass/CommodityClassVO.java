package com.cha102.diyla.commodityClass;

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
}
