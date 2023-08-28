package com.cha102.diyla.diycatemodel;

import java.io.Serializable;
import java.util.Arrays;

public class DiyCateVO implements Serializable {

	private Integer diyNo;
	private String diyName;
	private Integer diyGraPeoCount;
	private Integer diyGraStarCount;
	private Byte diyStatus;
	private Byte diyCateName;
	private byte[] diyPic;
	private String itemDetails;

	// 無參數
	public DiyCateVO() {

	}

	// 帶參數的
	public DiyCateVO(Integer diyNo, String diyName, Integer diyGraPeoCount, Integer diyGraStarCount, Byte diyStatus,
			Byte diyCateName, byte[] diyPic, String itemDetails) {
		this.diyNo = diyNo;
		this.diyName = diyName;
		this.diyGraPeoCount = diyGraPeoCount;
		this.diyGraStarCount = diyGraStarCount;
		this.diyStatus = diyStatus;
		this.diyCateName = diyCateName;
		this.diyPic = diyPic;
		this.itemDetails = itemDetails;
	}

	// Getters and Setters
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

	@Override
	public String toString() {
		return "DiyCateVO [diyNo=" + diyNo + ", diyName=" + diyName + ", diyGraPeoCount=" + diyGraPeoCount
				+ ", diyGraStarCount=" + diyGraStarCount + ", diyStatus=" + diyStatus + ", diyCateName=" + diyCateName
				+ ", diyPic=" + Arrays.toString(diyPic) + ", itemDetails=" + itemDetails + "]";
	}
}
