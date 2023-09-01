package com.cha102.diyla.shoppingcart;

import java.util.List;

import com.cha102.diyla.commodityModel.CommodityVO;

//定義規格
public interface CartHolder {
	void put(String cartNo,List<CartItemVO> cartItems);
	
	List<CartItemVO> getAll(String cartNo);
	
	void remove(String cartNo);
}
