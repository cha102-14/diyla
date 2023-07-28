package com.cha102.diyla.shoppongcart;

import java.io.Serializable;
import java.util.List;

import com.cha102.diyla.commodityModel.CommodityVO;

public class ShoppingCartVO implements Serializable {
	private Integer memNo;
	private Integer comNO;
	private Integer comAmount;
	public Integer getMemNo() {
		return memNo;
	}
	public void setMemNo(Integer memNo) {
		this.memNo = memNo;
	}
	public Integer getComNO() {
		return comNO;
	}
	public void setComNO(Integer comNO) {
		this.comNO = comNO;
	}
	public Integer getComAmount() {
		return comAmount;
	}
	public void setComAmount(Integer comAmount) {
		this.comAmount = comAmount;
	}
	public ShoppingCartVO(Integer memNo, Integer comNO, Integer comAmount) {
		super();
		this.memNo = memNo;
		this.comNO = comNO;
		this.comAmount = comAmount;
	}
	public ShoppingCartVO() {
		super();
	}

	
	




}
