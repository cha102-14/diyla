package com.cha102.diyla.commodityOrder;

import java.util.List;

import com.cha102.diyla.shoppingcart.ShoppingCartService;
import com.cha102.diyla.shoppingcart.ShoppingCartVO;

public class CommodityOrderService {
	CommodityOrderDaoJNDI dao = new CommodityOrderDaoJNDI();

	public void update(Integer status, Integer orderNO) {
		dao.update( status,  orderNO);
	}

	public Integer insert(Integer memId) {
		return dao.insert(memId);
	}

	public List<CommodityOrderVO> getAll(Integer memId) {
		return dao.getAll(memId);
	}

	public CommodityOrderVO findByOrderNo(Integer OrderNo) {
		dao.findByOrderNo(OrderNo);
		return null;
	}

	public void delete(Integer orderNo) {
		dao.delete(orderNo);
	}
	//查詢該會員目前購物車所有:結帳用
	public List<ShoppingCartVO> findByMemId(Integer memId) {
		ShoppingCartService cartService = new ShoppingCartService();
		List<ShoppingCartVO> cartVOs = cartService.getAll(memId);
		return cartVOs;
	}
}
 