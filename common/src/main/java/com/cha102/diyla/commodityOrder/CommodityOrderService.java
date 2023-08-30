package com.cha102.diyla.commodityOrder;

import java.util.List;

import com.cha102.diyla.shoppingcart.ShoppingCartService;
import com.cha102.diyla.shoppingcart.ShoppingCartVO;

public class CommodityOrderService {
	CommodityOrderDaoJNDI dao = new CommodityOrderDaoJNDI();

	public void updateStatus(Integer status, Integer orderNO) {
		dao.updateStatus( status,  orderNO);
	}
	public void update(Integer status,Integer orderNo,String recipient,String recipientAddress,String phone) {
		dao.update(status, orderNo,recipient,recipientAddress,phone);
	}

	public Integer insert(CommodityOrderVO commodityOrderVO) {
		return dao.insert(commodityOrderVO);
	}

	public List<CommodityOrderVO> getAllByMemId(Integer memId) {
		return dao.getAllByMemId(memId);
	}

	public CommodityOrderVO findByOrderNo(Integer OrderNo) {
		return dao.findByOrderNo(OrderNo);
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
	//後台訂單
	public List<CommodityOrderVO> getAll() {
		return dao.getAll();
	}
//	//依訂單編號排序
//	public List<CommodityOrderVO> sortByOrderNo(){
//		String  sql = "SELECT * FROM commodity_order ORDER BY ORDER_NO";
//		
//		return dao.sortBy(sql);
//	}
//	//依訂單價格排序
//	public List<CommodityOrderVO> sortByActualPrice(){
//		String  sql = "SELECT * FROM commodity_order ORDER BY ACTUAL_PRICE";
//		return dao.sortBy(sql);
//	}
}
 