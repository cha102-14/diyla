package com.cha102.diyla.shoppingCartRedis;

import java.util.List;

import com.cha102.diyla.shoppingcart.ShoppingCartVO;

public interface CartService {
	public void addItem(CartListDTO dto);

	public abstract void modifyComAmount(CartListDTO dto);

	public abstract List<CartListDTO> getAll(Integer memId);

	public abstract void clear(Integer memId);

	public abstract void delete(Integer memId, Integer comNo);

	void setShowPic(CartListDTO dto);

	Integer getTotalPrice(Integer memId);

	Integer getTotalAmount(Integer memId);

	List<ShoppingCartVO> cartToVOList(Integer memId);
}
