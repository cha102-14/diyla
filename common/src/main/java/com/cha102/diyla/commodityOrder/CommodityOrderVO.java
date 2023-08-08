package com.cha102.diyla.commodityOrder;

import java.sql.Timestamp;

public class CommodityOrderVO {
	private Integer orderNO;
	private Integer memId;
	private Timestamp orderTime;
	private Integer orderStatus;
	private Integer orderPrice;
	private Integer discountPrice;
	private Integer actualPrice;
	private Timestamp updateTime;

	public Integer getOrderNO() {
		return orderNO;
	}

	public void setOrderNO(Integer opderNO) {
		this.orderNO = opderNO;
	}

	public Integer getMemId() {
		return memId;
	}

	public void setMemId(Integer memId) {
		this.memId = memId;
	}

	public Timestamp getOrderTime() {
		return orderTime;
	}

	public void setOrderTime(Timestamp orderTime) {
		this.orderTime = orderTime;
	}

	public Integer getOrderStatus() {
		return orderStatus;
	}

	public void setOrderStatus(Integer orderStatus) {
		this.orderStatus = orderStatus;
	}

	public Integer getOrderPrice() {
		return orderPrice;
	}

	public void setOrderPrice(Integer orderPrice) {
		this.orderPrice = orderPrice;
	}

	public Integer getDiscountPrice() {
		return discountPrice;
	}

	public void setDiscountPrice(Integer discountPrice) {
		this.discountPrice = discountPrice;
	}

	public Integer getActualPrice() {
		return actualPrice;
	}

	public void setActualPrice(Integer actualPrice) {
		this.actualPrice = actualPrice;
	}

	public Timestamp getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(Timestamp updateTime) {
		this.updateTime = updateTime;
	}

	public CommodityOrderVO(Integer opderNO, Integer memId, Timestamp orderTime, Integer orderStatus,
			Integer orderPrice, Integer discountPrice, Integer actualPrice, Timestamp updateTime) {
		super();
		this.orderNO = opderNO;
		this.memId = memId;
		this.orderTime = orderTime;
		this.orderStatus = orderStatus;
		this.orderPrice = orderPrice;
		this.discountPrice = discountPrice;
		this.actualPrice = actualPrice;
		this.updateTime = updateTime;
	}

	public CommodityOrderVO() {
		super();
	}


}
