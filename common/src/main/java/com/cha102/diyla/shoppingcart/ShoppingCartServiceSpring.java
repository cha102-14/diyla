package com.cha102.diyla.shoppingcart;

import java.util.List;
import java.util.Optional;

public interface ShoppingCartServiceSpring {
	void insert(ShoppingCartVO shoppingCartVO);

	void update(ShoppingCartVO shoppingCartVO);

	void delete(Integer memId, Integer comNo);

	void deleteByMemId(Integer memId);
	

	Optional<ShoppingCartVO> findByMemIdAndComNo(Integer memId, Integer comNo);

	List<ShoppingCartVO> findByMemId(Integer memId);
	
	void setShowPic(ShoppingCartVO cartVO);
	
	Integer getTotalPrice(Integer memId);
	
	Integer getTotalAmount(Integer memId);
}
