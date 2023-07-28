package com.cha102.diyla.shoppongcart;

import java.util.List;

import com.cha102.diyla.commodityModel.CommodityVO;

public interface ShoppingCartDao {
	void insert(int memNO,CommodityVO comm,int amount);

	void update(int mem_id, CommodityVO comm,int amount);

	void delete(int memID, CommodityVO comm);

	CommodityVO getCommByComNO(Integer comNO);

	List<CommodityVO> getAll();
}
