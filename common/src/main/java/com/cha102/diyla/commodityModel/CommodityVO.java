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

    public Integer getComNO() {
        return comNO;
    }

    public void setComNO(Integer comNO) {
        this.comNO = comNO;
    }

    public Integer getComClassNo() {
        return comClassNo;
    }

    public void setComClassNo(Integer comClassNo) {
        this.comClassNo = comClassNo;
    }

    public String getComNAME() {
        return comNAME;
    }

    public void setComNAME(String comNAME) {
        this.comNAME = comNAME;
    }

    public byte[] getComPic() {
        return comPic;
    }

    public void setComPic(byte[] comPic) {
        this.comPic = comPic;
    }

    public String getComDec() {
        return comDec;
    }

    public void setComDec(String comDec) {
        this.comDec = comDec;
    }

    public Double getComPri() {
        return comPri;
    }

    public void setComPri(Double comPri) {
        this.comPri = comPri;
    }

    public Integer getComQua() {
        return comQua;
    }

    public void setComQua(Integer comQua) {
        this.comQua = comQua;
    }

    public Integer getComState() {
        return comState;
    }

    public void setComState(Integer comState) {
        this.comState = comState;
    }

    public Integer getCommentTotal() {
        return commentTotal;
    }

    public void setCommentTotal(Integer commentTotal) {
        this.commentTotal = commentTotal;
    }

    public Integer getRatingSum() {
        return ratingSum;
    }

    public void setRatingSum(Integer ratingSum) {
        this.ratingSum = ratingSum;
    }

    public Timestamp getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Timestamp updateTime) {
        this.updateTime = updateTime;
    }
}
