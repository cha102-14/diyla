package com.cha102.diyla.commodityModel;

import java.io.Serializable;
import java.sql.Timestamp;

public class CommodityVO implements Serializable {

    private Integer comNO;
    private Integer comClassNo;
    private String comName;
    private byte[] comPic;
    private String showPic;
    private String comDes;
    private Integer comPri;
    private Integer comQua;
    private Integer comState;
    private Integer commentTotal;
    private Integer ratingSum;
    private Timestamp updateTime;

    public CommodityVO(){}

    public CommodityVO(Integer comNO, Integer comClassNo, String comNAME, byte[] comPic, String showPic, String comDes, Integer comPri, Integer comQua, Integer comState, Integer commentTotal, Integer ratingSum, Timestamp updateTime) {
        this.comNO = comNO;
        this.comClassNo = comClassNo;
        this.comName = comName;
        this.comPic = comPic;
        this.showPic = showPic;
        this.comDes = comDes;
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

    public String getComName() {
        return comName;
    }

    public void setComName(String comName) {
        this.comName = comName;
    }

    public byte[] getComPic() {
        return comPic;
    }

    public void setComPic(byte[] comPic) {
        this.comPic = comPic;
    }

    public String getShowPic(){
        return showPic;
    }

    public void setShowPic(String showPic){
        this.showPic = showPic;
    }

    public String getComDes(){
        return comDes;
    }

    public void setComDes(String comDes){
        this.comDes = comDes;
    }

    public Integer getComPri() {
        return comPri;
    }

    public void setComPri(Integer comPri) {
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
