package com.cha102.diyla.shoppingcart;

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

@Getter
@Setter
@Entity
@Table(name = "shopping_cart_list")
@IdClass(ShoppongCartId.class)
@NoArgsConstructor
@AllArgsConstructor
public class ShoppingCartVO {
	@Id
	@Column(name = "MEM_ID")
	private Integer memId;
	@Id
	@Column(name = "COM_NO")
	private Integer comNo;
	@Column(name = "COM_AMOUNT")
	private Integer comAmount;
	@Transient
	private String comName;
	@Transient
	private byte[] comPic;
	@Transient
	private String showPic;
	@Transient
	private Integer comPri;

	public ShoppingCartVO(Integer memId, Integer comNo, Integer comAmount) {
		super();
		this.memId = memId;
		this.comNo = comNo;
		this.comAmount = comAmount;
	}

}

class ShoppongCartId implements Serializable {
	private static final long serialVersionUID = 1L;
	private Integer memId;
	private Integer comNo;

	@Override
	public int hashCode() {
		return Objects.hash(comNo, memId);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		ShoppongCartId other = (ShoppongCartId) obj;
		return Objects.equals(comNo, other.comNo) && Objects.equals(memId, other.memId);
	}

}