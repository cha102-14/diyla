package com.cha102.diyla.diyForum;

import java.io.Serializable;

public class DiyForumVO implements Serializable {
	/**
	*/
	private static final long serialVersionUID = 1L;    //序列化版本號，用於確保序列化和反序列化過程中的兼容性。
	private Integer artiNo;
	private Integer memId;
	private Integer diyNo;
	private String artiCont;
	private Integer diyGrade;
	private String memName;

// 因為需要在頁面上顯示會員名字，所以寫了一個 left join 查詢，然後將這個欄位加入了這個類別中。
	public DiyForumVO() {
	}

	public DiyForumVO(Integer artiNo, Integer memId, Integer diyNo, String artiCont, Integer diyGrade, String memName) {
		this.artiNo = artiNo;
		this.memId = memId;
		this.diyNo = diyNo;
		this.artiCont = artiCont;
		this.diyGrade = diyGrade;
		this.memName = memName;
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

	public String getMemName() {
		return memName;
	}

	public void setMemName(String memName) {
		this.memName = memName;
	}
}

//因為需要在頁面上展示會員名字，所以進行了一個 left join 查詢，並將這個欄位加入到這個類別中。
