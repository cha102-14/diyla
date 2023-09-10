package com.cha102.diyla.commodityOrderDetail;

import java.util.ArrayList;
import java.util.List;

import com.cha102.diyla.commodityModel.CommodityDaoImpl;
import com.cha102.diyla.commodityModel.CommodityService;
import com.cha102.diyla.commodityModel.CommodityVO;
import com.cha102.diyla.shoppingcart.ShoppingCartVO;

public class CommodityOrderDetailService {
	CommodityOrderDetailDaoJNDI dao = new CommodityOrderDetailDaoJNDI();
	
	public void insert(Integer orderNo, List<ShoppingCartVO> shoppingCartList) {
		dao.insert(orderNo, shoppingCartList);
	}

	public List<CommodityOrderDetailVO> getAll(Integer orderNo) {
		CommodityDaoImpl commodityDaoImpl = new CommodityDaoImpl();
		List<CommodityOrderDetailVO>detailVOs = dao.getAll(orderNo);
		List<Integer>comNoList = new ArrayList<>();
		for(CommodityOrderDetailVO detailVO:detailVOs) {
			comNoList.add(detailVO.getComNo());
		}
		List<CommodityVO>commodityVOs = commodityDaoImpl.getAllByComNo(comNoList);
		for(CommodityOrderDetailVO detailVO:detailVOs) {
			for(CommodityVO commodityVO:commodityVOs) {
				if(detailVO.getComNo()==commodityVO.getComNO()) {
					detailVO.setComName(commodityVO.getComName());
					detailVO.setUnitPrice(commodityVO.getComPri());
					detailVO.setComPrice(commodityVO.getComPri()*detailVO.getComQuantity());
				}
			}
		}
		return detailVOs;
	};
}
