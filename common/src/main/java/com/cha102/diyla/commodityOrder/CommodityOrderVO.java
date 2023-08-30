package com.cha102.diyla.commodityOrder;

import java.sql.Timestamp;
import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@Entity
@Table(name = "commodity_order")
@NoArgsConstructor
@AllArgsConstructor
public class CommodityOrderVO {
	@Id
	@Column(name = "ORDER_NO")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer orderNO;
	@Column(name = "MEM_ID")
	private Integer memId;
	@Column(name = "ORDER_TIME")
	private Timestamp orderTime;
	@Column(name = "ORDER_STATUS")
	private Integer orderStatus;
	@Column(name = "ORDER_PRICE")
	private Integer orderPrice;
	@Column(name = "DISCOUNT_PRICE")
	private Integer discountPrice;
	@Column(name = "ACTUAL_PRICE")
	private Integer actualPrice;
	@Column(name = "UPDATE_TIME")
	private Timestamp updateTime;
	@Column(name = "RECIPIENT")
	private String recipient;
	@Column(name = "RECIPIENT_ADDRESS")
	private String recipientAddress;
	@Column(name = "PHONE")
	private String phone;

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

	public CommodityOrderVO(Integer memId, Integer orderStatus, Integer orderPrice, Integer discountPrice,
			Integer actualPrice) {
		this.memId = memId;
		this.orderStatus = orderStatus;
		this.orderPrice = orderPrice;
		this.discountPrice = discountPrice;
		this.actualPrice = actualPrice;
	}

}
