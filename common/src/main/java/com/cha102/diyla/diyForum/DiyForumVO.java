package com.cha102.diyla.diyForum;

public class DiyForumVO {
    private Integer artiNo;
    private Integer memId;
    private Integer diyNo;
    private String artiCont;
    private Integer diyGrade;

    public DiyForumVO() {
    }

    public DiyForumVO(Integer artiNo, Integer memId, Integer diyNo, String artiCont, Integer diyGrade) {
        this.artiNo = artiNo;
        this.memId = memId;
        this.diyNo = diyNo;
        this.artiCont = artiCont;
        this.diyGrade =  diyGrade;
    }

    @Override
	public String toString() {
		return "DiyForumVO [artiNo=" + artiNo + ", memId=" + memId + ", diyNo=" + diyNo + ", artiCont=" + artiCont
				+ ", diyGrade=" + diyGrade + "]";
	}

    public Integer getArtiNo() {
        return artiNo;
    }

    public void setArtiNo(Integer artiNo) {
        this.artiNo = artiNo;
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

    public String getArtiCont() {
        return artiCont;
    }

    public void setArtiCont(String artiCont) {
        this.artiCont = artiCont;
    }

    public Integer getDiyGrade() {
        return diyGrade;
    }

    public void setDiyGrade(Integer diyGrade) {
        this.diyGrade = diyGrade;
    }
}
