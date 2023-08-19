package com.cha102.diyla.commodityOrderDetail;


import java.util.List;

import com.cha102.diyla.shoppingcart.ShoppingCartVO;

public interface CommodityOrderDetailDao {
	
	void insert(Integer orderNo, List<ShoppingCartVO> shoppingCartList);

	List<CommodityOrderDetailVO> getAll(Integer orderNo);

}
