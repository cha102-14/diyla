package com.diy.model;

public class DiyCateVO implements java.io.Serializable {
    private Integer diyNo;
    private String diyName;
    private Integer diyGraPeoCount;
    private Integer diyGraStarCount;
    private Byte diyStatus;
    private Byte diyCateName;
    private byte[] diyPic;
    private String itemDetails;

    public Integer getDiyNo() {
        return diyNo;
    }
    public void setDiyNo(Integer diyNo) {
        this.diyNo = diyNo;
    }
    public String getDiyName() {
        return diyName;
    }
    public void setDiyName(String diyName) {
        this.diyName = diyName;
    }
    public Integer getDiyGraPeoCount() {
        return diyGraPeoCount;
    }
    public void setDiyGraPeoCount(Integer diyGraPeoCount) {
        this.diyGraPeoCount = diyGraPeoCount;
    }
    public Integer getDiyGraStarCount() {
        return diyGraStarCount;
    }
    public void setDiyGraStarCount(Integer diyGraStarCount) {
        this.diyGraStarCount = diyGraStarCount;
    }
    public Byte getDiyStatus() {
        return diyStatus;
    }
    public void setDiyStatus(Byte diyStatus) {
        this.diyStatus = diyStatus;
    }
    public Byte getDiyCateName() {
        return diyCateName;
    }
    public void setDiyCateName(Byte diyCateName) {
        this.diyCateName = diyCateName;
    }
    public byte[] getDiyPic() {
        return diyPic;
    }
    public void setDiyPic(byte[] diyPic) {
        this.diyPic = diyPic;
    }
    public String getItemDetails() {
        return itemDetails;
    }
    public void setItemDetails(String itemDetails) {
        this.itemDetails = itemDetails;
    }
}

