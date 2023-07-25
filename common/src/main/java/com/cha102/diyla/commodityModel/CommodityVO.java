package com.cha102.diyla.commodityModel;

import java.io.Serializable;
import java.sql.Timestamp;
import java.util.List;

public class CommodityVO implements Serializable {
    private Integer comNO;
    private Integer comClassNo;
    private String comNAME;
    private byte[] comPic;
    private String comDec;
    private Double comPri;
    private Integer comQua;

    private Integer comState;
    private Integer commentTotal;
    private Integer ratingSum;
    private Timestamp updateTime;

    public CommodityVO(){}

    public CommodityVO(Integer comNO, Integer comClassNo, String comNAME, byte[] comPic, String comDec, Double comPri, Integer comQua, Integer comState, Integer commentTotal, Integer ratingSum, Timestamp updateTime) {
        this.comNO = comNO;
        this.comClassNo = comClassNo;
        this.comNAME = comNAME;
        this.comPic = comPic;
        this.comDec = comDec;
        this.comPri = comPri;
        this.comQua = comQua;
        this.comState = comState;
        this.commentTotal = commentTotal;
        this.ratingSum = ratingSum;
        this.updateTime = updateTime;
    }
}
