package com.cha102.diyla.commodityOrderDetail;

import java.io.Serializable;
import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.Table;
import javax.persistence.Transient;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@Table(name = "commodity_order_detail")
@IdClass(CommodityOrderDetailVOId.class)
public class CommodityOrderDetailVO {
	// 複合主鍵
	@Id
	@Column(name = "ORDER_NO")
	private Integer orderNo;
	@Id
	@Column(name = "COM_NO")
	private Integer comNo;
	private String comName;
	@Column(name = "COM_QUANTITY")
	private Integer comQuantity;
	@Column(name = "COM_PRICE")
	private Integer comPrice;
	@Transient
	private Integer unitPrice;

	@Override
	public String toString() {
		return "CommodityOrderDetailVO{" + "orderNo=" + orderNo + ", comNo=" + comNo + ", comQuantity=" + comQuantity
				+ ", comPrice=" + comPrice + '}';
	}

}

class CommodityOrderDetailVOId implements Serializable {
	private static final long serialVersionUID = 1L;
	private Integer orderNo;
	private Integer comNo;

	@Override
	public int hashCode() {
		return Objects.hash(comNo, orderNo);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		CommodityOrderDetailVOId other = (CommodityOrderDetailVOId) obj;
		return Objects.equals(comNo, other.comNo) && Objects.equals(orderNo, other.orderNo);
	}

}
