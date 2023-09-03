package com.cha102.diyla.shoppingCartRedis;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Repository;
import org.springframework.web.server.ResponseStatusException;

import com.cha102.diyla.commodityModel.Commodity;

import redis.clients.jedis.Jedis;
import redis.clients.jedis.Transaction;
//
@Repository
public class CartRepository {
//	    private Jedis jedis;
	    @Autowired
	    private CommodityRepository commodityRepository;
	    public static final Jedis jedis = new Jedis("localhost", 6379);

	    public String getCartKey(Integer memId) {
	        return "cart:" + memId;
	    }

	    // 新增
	    public void addItem(Integer memId, Integer comNo, Integer comAmount) {
	        String redisKey = getCartKey(memId);
	        String field = String.valueOf(comNo);

	        Transaction transaction = jedis.multi();
	        transaction.hincrBy(redisKey, field, comAmount);
	        transaction.exec();
	    }

	    // 改
	    public void modify(Integer memId, Integer comNo, Integer comAmount) {
	        String redisKey = getCartKey(memId);
	        String field = String.valueOf(comNo);

	        jedis.hset(redisKey, field, String.valueOf(comAmount));
	    }

	    // 刪單一
	    public void delete(Integer memId, Integer comNo) {
	        String redisKey = getCartKey(memId);
	        String field = String.valueOf(comNo);

	        jedis.hdel(redisKey, field);
	    }

	    // 刪全部
	    public void clear(Integer memId) {
	        String redisKey = getCartKey(memId);

	        jedis.del(redisKey);
	    }

	    public List<CartListDTO> getAll(Integer memId) {
	        String redisKey = getCartKey(memId);
	        Map<String, String> cartMap = jedis.hgetAll(redisKey);
	        List<CartListDTO> cartItems = new ArrayList<>();
	        for (Map.Entry<String, String> entry : cartMap.entrySet()) {
	            Integer comNo = Integer.valueOf(entry.getKey());
	            Integer comAmount = Integer.valueOf(entry.getValue());
	            Commodity commodity = commodityRepository.findByComNO(comNo);
	            if (commodity != null) {
	                CartListDTO cartListDTO = new CartListDTO();
	                cartListDTO.setComNo(comNo);
	                cartListDTO.setComName(commodity.getComName());
	                cartListDTO.setComPic(commodity.getComPic());
	                cartListDTO.setComPri(commodity.getComPri());
	                cartListDTO.setComAmount(comAmount);
	                cartItems.add(cartListDTO);
	            } else {
	                throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "wrong commodity");
	            }
	        }
	        return cartItems;
	    }

	    public Integer getTotalAmount(Integer memId) {
	        List<CartListDTO> cartItems = getAll(memId);
	        return cartItems.stream().mapToInt(CartListDTO::getComAmount).sum();
	    }

	    public Integer getTotalPrice(Integer memId) {
	        List<CartListDTO> cartItems = getAll(memId);
	        return cartItems.stream().mapToInt(item -> item.getComAmount() * item.getComPri()).sum();
	    }
	
	
//	@Autowired
//	private RedisTemplate<String, String> redisTemplate;
//	@Autowired
//	private CommodityRepository commodityRepository;
//
//	private HashOperations<String, String, String> hashOperations;
//
//	@PostConstruct
//	private void init() {
//		hashOperations = redisTemplate.opsForHash();
//	}
//
//	public String getCartKey(Integer memId) {
//		return "cart:" + memId;
//	}
//
//	// 新增
//	public void addItem(Integer memId, Integer comNo, Integer comAmount) {
//		String redisKey = getCartKey(memId);
//		String field = String.valueOf(comNo);
//		// 取得原數量
//		String existingAmount = hashOperations.get(redisKey, field);
//		Integer currentAmount = Integer.parseInt(existingAmount);
//		Integer newAmount = currentAmount + comAmount;
//		hashOperations.put(redisKey, field, String.valueOf(newAmount));
//
//	}
//
//	// 改
//	public void modify(Integer memId, Integer comNo, Integer comAmount) {
//		String redisKey = getCartKey(memId);
//		String field = String.valueOf(comNo);
//		hashOperations.put(redisKey, field, String.valueOf(comAmount));
//
//	}
//
//	// 刪單一
//	public void delete(Integer memId, Integer comNo) {
//		String redisKey = getCartKey(memId);
//		String field = String.valueOf(comNo);
//		hashOperations.delete(redisKey, field);
//	}
//
//	// 刪全部
//	public void clear(Integer memId) {
//		String redisKey = getCartKey(memId);
//		hashOperations.delete(redisKey);
//
//	}
//
//	public  List<CartListDTO> getAll(Integer memId) {
//		String redisKey = getCartKey(memId);
//		Map<String, String> cartMap = hashOperations.entries(redisKey);
//		List<CartListDTO> cartItems = new ArrayList<>();
//		for (Map.Entry<String, String> entry : cartMap.entrySet()) {
//			Integer comNo = Integer.valueOf(entry.getKey());
//			Integer comAmount = Integer.valueOf(entry.getValue());
//			Commodity commodity = commodityRepository.findByComNO(comNo);
//			if (commodity != null) {
//				CartListDTO cartListDTO = new CartListDTO();
//				cartListDTO.setComNo(comNo);
//				cartListDTO.setComName(commodity.getComName());
//				cartListDTO.setComPic(commodity.getComPic());
//				cartListDTO.setComPri(commodity.getComPri());
//				cartListDTO.setComAmount(comAmount);
//				cartItems.add(cartListDTO);
//			} else {
//				throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "wrong commodity");
//			}
//		}
//		return cartItems;
//	}
//
//	public Integer getTotalAmount(Integer memId) {
//		List<CartListDTO> cartItems = getAll(memId);
//		return cartItems.stream().mapToInt(CartListDTO::getComAmount).sum();
//	}
//
//	public Integer getTotalPrice(Integer memId) {
//		List<CartListDTO> cartItems = getAll(memId);
//		return cartItems.stream().mapToInt(item -> item.getComAmount() * item.getComPri()).sum();
//	}
//
}
