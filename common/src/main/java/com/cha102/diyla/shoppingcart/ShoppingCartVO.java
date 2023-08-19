package com.cha102.diyla.shoppingcart;

import java.io.Serializable;
import java.util.List;

import com.cha102.diyla.commodityModel.CommodityVO;

public class ShoppingCartVO implements Serializable {
	private Integer memId;
	private Integer comNo;
	private Integer comAmount;
	public Integer getMemId() {
		return memId;
	}
	public void setMemId(Integer memId) {
		this.memId = memId;
	}
	public Integer getComNo() {
		return comNo;
	}
	public void setComNo(Integer comNo) {
		this.comNo = comNo;
	}
	public Integer getComAmount() {
		return comAmount;
	}
	public void setComAmount(Integer comAmount) {
		this.comAmount = comAmount;
	}
	public ShoppingCartVO(Integer memId, Integer comNo, Integer comAmount) {
		super();
		this.memId = memId;
		this.comNo = comNo;
		this.comAmount = comAmount;
	}
	public ShoppingCartVO() {
		super();
	}

	
	




}
