package com.cha102.diyla.shoppingcart;

import java.io.Serializable;

import com.cha102.diyla.commodityModel.CommodityVO;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class CartItemVO implements Serializable {
	private Integer memId;
	private CommodityVO commodityVO;
	private Integer comAmount;
	private Integer price;
}
