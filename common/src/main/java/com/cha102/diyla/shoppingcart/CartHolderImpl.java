package com.cha102.diyla.shoppingcart;

import java.lang.reflect.Type;
import java.util.List;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;

import redis.clients.jedis.Jedis;

public class CartHolderImpl implements CartHolder {
	private static Type typeToken = new TypeToken<List<CartItemVO>>() {
	}.getType();

	private static Jedis jedis = new Jedis("127.0.0.1", 6379);
	private Gson gson = new Gson();

	@Override
	public void put(String cartNo, List<CartItemVO> cartItems) {
		jedis.set(cartNo, gson.toJson(cartItems));
	}

	@Override
	public List<CartItemVO> getAll(String cartNo) {
		return gson.fromJson(jedis.get(cartNo), typeToken);
	}

	@Override
	public void remove(String cartNo) {
		jedis.del(cartNo);
	}

}
