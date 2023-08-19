package com.cha102.diyla.shoppingcart;

import java.util.ArrayList;
import java.util.List;

import com.cha102.diyla.commodityModel.CommodityService;
import com.cha102.diyla.commodityModel.CommodityVO;

public class ShoppingCartService {
	CommodityService commodityService = new CommodityService();
	ShoppingCartDaoImpl dao = new ShoppingCartDaoImpl();
	ShoppingCartVO shoppingCartVO = null;
	
	public ShoppingCartService() {
		ShoppingCartDaoImpl dao = new ShoppingCartDaoImpl();
	}

	public ShoppingCartVO addShoppingCart(Integer memId, Integer comNo, Integer amount) {
		//先查詢 無則新增 有擇改數量
		ShoppingCartVO shoppingCartVO = dao.getOne(memId, comNo);
		if (shoppingCartVO == null) {
			dao.insert(memId, comNo, amount);
		}
		else {
			Integer currentAmount = shoppingCartVO.getComAmount();
			dao.update(memId, comNo, currentAmount+amount);
		}
		return shoppingCartVO;

	}

	public void delete(Integer memId, Integer comNo) {
		dao.delete(memId, comNo);
	}

	public ShoppingCartVO update(Integer memId, Integer comNo, Integer amount) {
		ShoppingCartVO shoppingCartVO = new ShoppingCartVO();
		shoppingCartVO.setMemId(memId);
		shoppingCartVO.setComNo(comNo);
		shoppingCartVO.setComAmount(amount);
		dao.update(memId, comNo, amount);
		return shoppingCartVO;
	}

	public void clear(Integer memId) {
		dao.clear(memId);
	}

	public ShoppingCartVO getOne(Integer memId, Integer comNo) {
		return dao.getOne(memId, comNo);
	}

	public List<ShoppingCartVO> getAll(int memId) {
		return dao.getAll(memId);
	}
	public static List<Integer> getComNoList(List<ShoppingCartVO>shoppingCartList){
		List<Integer> comNoList = new ArrayList<>();
		for (ShoppingCartVO cartVO : shoppingCartList) {
			comNoList.add(cartVO.getComNo());
		}
		return comNoList;
	}
	
	
	public int getTotalPrice(List<ShoppingCartVO> cartlist) {
		int totalPrice = 0;
		for (ShoppingCartVO cartItem : cartlist) {
			CommodityVO commodityVO = commodityService.findByID(cartItem.getComNo());
			totalPrice += (cartItem.getComAmount() * commodityVO.getComPri());
		}
		return totalPrice;
	}
}
