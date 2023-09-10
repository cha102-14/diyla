package com.cha102.diyla.commodityOrder;

import java.util.List;


import com.cha102.diyla.shoppingcart.ShoppingCartVO;

public interface CommodityOrderDao {
	int insert(CommodityOrderVO commodityOrderVO);

	void delete(Integer orderNo);


	void updateStatus(Integer status, Integer orderNO);

//	void update(CommodityOrderVO commodityOrderVO);
	
	CommodityOrderVO findByOrderNo(Integer OrderNo);


	List<CommodityOrderVO> getAllByMemId(Integer memId);

	List<CommodityOrderVO> getAll();
	
	void update(Integer status,Integer orderNo,String recipient,String recipientAddress,String phone);
//	List<CommodityOrderVO> sortBy(String sql);


}
