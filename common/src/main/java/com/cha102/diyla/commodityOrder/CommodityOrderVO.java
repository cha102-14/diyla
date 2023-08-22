package com.cha102.diyla.commodityOrder;

import java.sql.Timestamp;
import java.util.Objects;

public class CommodityOrderVO {
	private Integer orderNO;
	private Integer memId;
	private Timestamp orderTime;
	private Integer orderStatus;
	private Integer orderPrice;
	private Integer discountPrice;
	private Integer actualPrice;
	private Timestamp updateTime;
	private String recipient;
	private String recipientAddress;

	public String getRecipient() {
		return recipient;
	}

	public void setRecipient(String recipient) {
		this.recipient = recipient;
	}

	public CommodityOrderVO(Integer memId, Integer orderStatus, Integer orderPrice, Integer discountPrice,
			Integer actualPrice, String recipient, String recipientAddress, String phone) {
		super();
		this.memId = memId;
		this.orderStatus = orderStatus;
		this.orderPrice = orderPrice;
		this.discountPrice = discountPrice;
		this.actualPrice = actualPrice;
		this.recipient = recipient;
		this.recipientAddress = recipientAddress;
		this.phone = phone;
	}

	public String getRecipientAddress() {
		return recipientAddress;
	}

	public void setRecipientAddress(String recipientAddress) {
		this.recipientAddress = recipientAddress;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	private String phone;

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

	public CommodityOrderVO(Integer orderNO, Integer memId, Timestamp orderTime, Integer orderStatus,
			Integer orderPrice, Integer discountPrice, Integer actualPrice, Timestamp updateTime) {
		super();
		this.orderNO = orderNO;
		this.memId = memId;
		this.orderTime = orderTime;
		this.orderStatus = orderStatus;
		this.orderPrice = orderPrice;
		this.discountPrice = discountPrice;
		this.actualPrice = actualPrice;
		this.updateTime = updateTime;
	}

	@Override
	public int hashCode() {
		return Objects.hash(actualPrice, discountPrice, memId, orderNO, orderPrice, orderStatus, orderTime, updateTime);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		CommodityOrderVO other = (CommodityOrderVO) obj;
		return Objects.equals(actualPrice, other.actualPrice) && Objects.equals(discountPrice, other.discountPrice)
				&& Objects.equals(memId, other.memId) && Objects.equals(orderNO, other.orderNO)
				&& Objects.equals(orderPrice, other.orderPrice) && Objects.equals(orderStatus, other.orderStatus)
				&& Objects.equals(orderTime, other.orderTime) && Objects.equals(updateTime, other.updateTime);
	}

	public CommodityOrderVO() {
		super();
	}

	public CommodityOrderVO(Integer memId, Integer orderStatus, Integer orderPrice, Integer discountPrice,
			Integer actualPrice) {
		this.memId = memId;
		this.orderStatus = orderStatus;
		this.orderPrice = orderPrice;
		this.discountPrice = discountPrice;
		this.actualPrice = actualPrice;
	}

}
