package com.cha102.diyla.shoppingcart;

import java.util.List;

public interface ShoppingCartDao {
	void insert(Integer memId, Integer commNo, Integer amount);

	void update(Integer memId, Integer commNo, Integer amount);

	void delete(Integer memId, Integer commNo);

	void clear(Integer memId);	
	
	ShoppingCartVO getOne(Integer memId, Integer commNo);

	List<ShoppingCartVO> getAll(Integer memId);
}
