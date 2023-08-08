package com.cha102.diyla.commodityOrder;

import java.util.List;

public interface CommodityOrderDao {
	int insert(CommodityOrderVO commodityOrderVO);

	void delete(Integer orderNo);
	
	void update(CommodityOrderVO commodityOrderVO,Integer status);

	CommodityOrderVO findByOrderNo(Integer OrderNo);

	List<CommodityOrderVO> getAll(Integer memNo);
}
