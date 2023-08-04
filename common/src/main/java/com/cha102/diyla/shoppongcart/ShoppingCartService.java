package com.cha102.diyla.shoppongcart;

import java.util.List;

import com.cha102.diyla.commodityModel.CommodityVO;

public class ShoppingCartService {

	ShoppingCartDaoImpl dao = new ShoppingCartDaoImpl();

	public ShoppingCartService() {
		ShoppingCartDaoImpl dao = new ShoppingCartDaoImpl();

	}

	public ShoppingCartVO addShoppingCart(Integer memId, Integer comNo, Integer amount) {
		ShoppingCartVO shoppingCartVO = new ShoppingCartVO();
		shoppingCartVO.setMemId(memId);
		shoppingCartVO.setComNo(comNo);
		shoppingCartVO.setComAmount(amount);
		dao.insert(memId, comNo, amount);
		return shoppingCartVO;
	
	}

	public void delete(Integer memId, Integer comNo) {
		dao.delete(memId, comNo);
	}

	public ShoppingCartVO update(int memId, int comNo, int amount) {
		ShoppingCartVO shoppingCartVO = new ShoppingCartVO();
		shoppingCartVO.setMemId(memId);
		shoppingCartVO.setComNo(comNo);
		shoppingCartVO.setComAmount(amount);
		dao.update(memId, comNo, amount);
		return shoppingCartVO;
	}

	public List<ShoppingCartVO> getAll(int memId) {
		return dao.getAll(memId);
	}
}
