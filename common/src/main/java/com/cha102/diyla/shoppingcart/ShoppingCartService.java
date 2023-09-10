package com.cha102.diyla.shoppingcart;

import java.util.ArrayList;
import java.util.Base64;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.springframework.stereotype.Service;

import com.cha102.diyla.commodityModel.CommodityService;
import com.cha102.diyla.commodityModel.CommodityVO;

@Service
public class ShoppingCartService {
	CommodityService commodityService = new CommodityService();
	ShoppingCartDaoImpl dao = new ShoppingCartDaoImpl();
	ShoppingCartVO shoppingCartVO = null;

	public ShoppingCartService() {
		ShoppingCartDaoImpl dao = new ShoppingCartDaoImpl();
	}

	public ShoppingCartVO addShoppingCart(Integer memId, Integer comNo, Integer amount) {
		// 先查詢 無則新增 有擇改數量
		ShoppingCartVO shoppingCartVO = dao.getOne(memId, comNo);
		if (shoppingCartVO == null) {
			dao.insert(memId, comNo, amount);
		} else {
			Integer currentAmount = shoppingCartVO.getComAmount();
			dao.update(memId, comNo, currentAmount + amount);
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

//	public static List<Integer> getComNoList(List<ShoppingCartVO> shoppingCartList) {
//		List<Integer> comNoList = new ArrayList<>();
//		for (ShoppingCartVO cartVO : shoppingCartList) {
//			comNoList.add(cartVO.getComNo());
//		}
//		return comNoList;
//	}

	public List<ShoppingCartVO> getCartList(Integer memId) {
		return dao.getCartList(memId);
	}
	//顯示圖片用 將byte arrays轉base64
	public static void setShowPic(ShoppingCartVO cartVO) {
		cartVO.setShowPic("data:image/png;base64," + Base64.getEncoder().encodeToString(cartVO.getComPic()));
	}

	public int getTotalPrice(List<ShoppingCartVO> cartlist) {
		int totalPrice = 0;
		for (ShoppingCartVO cartItem : cartlist) {
			totalPrice += (cartItem.getComAmount() * cartItem.getComPri());
		}
		return totalPrice;
	}
	public List<ShoppingCartVO> getCart(Integer memId,Map<String,String> memCart){
		CommodityService commodityService = new CommodityService();
		//取得所有key
		List<Integer> intKeysList = memCart.keySet()
			    .stream()
			    .map(Integer::parseInt)
			    .collect(Collectors.toList());
		List<CommodityVO>commList =commodityService.getAllByComNo(intKeysList);
		List<ShoppingCartVO> cartVOs = new ArrayList<>();
		for (CommodityVO comm : commList) {
	        String cartValue = memCart.get(String.valueOf(comm.getComNO()));
	        if (cartValue != null) {
	            ShoppingCartVO cartVO = new ShoppingCartVO();
	            cartVO.setMemId(memId);
	            cartVO.setComNo(comm.getComNO());
	            cartVO.setComPri(comm.getComPri());
	            cartVO.setComName(comm.getComName());
	            cartVO.setComAmount(Integer.parseInt(cartValue));
	            cartVOs.add(cartVO);
	        }
	    }
		return cartVOs;
	}
}
