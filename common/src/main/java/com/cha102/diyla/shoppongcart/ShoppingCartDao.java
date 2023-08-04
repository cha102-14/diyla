package com.cha102.diyla.shoppongcart;

import java.util.List;

import com.cha102.diyla.commodityModel.CommodityVO;

public interface ShoppingCartDao {
	void insert(Integer memId,Integer commNo,Integer amount);

	void update(Integer memId, Integer commNo,Integer amount);

	void delete(Integer memId, Integer commNo);


	List<ShoppingCartVO> getAll(Integer memId);
}
