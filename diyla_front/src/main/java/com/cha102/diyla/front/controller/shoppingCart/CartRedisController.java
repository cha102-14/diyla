package com.cha102.diyla.front.controller.shoppingCart;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;

import com.cha102.diyla.shoppingCartRedis.CartListDTO;
import com.cha102.diyla.shoppingCartRedis.CartService;
import com.cha102.diyla.shoppingcart.ShoppingCartServiceSpring;
import com.cha102.diyla.shoppingcart.ShoppingCartVO;
import com.cha102.diyla.tokenModel.TokenService;
@Controller
public class CartRedisController {
	@Autowired
	CartService cartService;


	@PostMapping("/shopR/insert")
	public ResponseEntity<String> insert(@RequestBody CartListDTO dto) {
		try {
			cartService.addItem(dto);
			JSONObject jsonResponse = new JSONObject();
			jsonResponse.put("success", true);
			return ResponseEntity.ok(jsonResponse.toString());
		} catch (Exception e) {
			System.out.println("aaaa");
			JSONObject jsonResponse = new JSONObject();
			jsonResponse.put("success", false);
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(jsonResponse.toString());
		}
	}

	@PostMapping("/shopR/update")
	public ResponseEntity<String> update(@RequestBody CartListDTO dto) {
		try {
			cartService.modifyComAmount(dto);
			JSONObject jsonResponse = new JSONObject();
			jsonResponse.put("success", true);
			return ResponseEntity.ok(jsonResponse.toString());
		} catch (Exception e) {
			JSONObject jsonResponse = new JSONObject();
			jsonResponse.put("success", false);
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(jsonResponse.toString());
		}
	}

	@PostMapping("/shopR/delete")
	public ResponseEntity<String> deleteCartItem(@RequestParam Integer comNo, @RequestParam Integer memId) {
		try {
			cartService.delete(memId, comNo);
			JSONObject jsonResponse = new JSONObject();
			jsonResponse.put("success", true);
			return ResponseEntity.ok(jsonResponse.toString());
		} catch (Exception e) {
			JSONObject jsonResponse = new JSONObject();
			jsonResponse.put("success", false);
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(jsonResponse.toString());
		}
	}

	@DeleteMapping("/shopR/clear/{memId}")
	public ResponseEntity<String> deleteByMemId(@PathVariable Integer memId) {
		try {
			cartService.clear(memId);
			JSONObject jsonResponse = new JSONObject();
			jsonResponse.put("success", true);
			return ResponseEntity.ok(jsonResponse.toString());

		} catch (Exception e) {
			JSONObject jsonResponse = new JSONObject();
			jsonResponse.put("success", false);
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(jsonResponse.toString());
		}
	}

	@GetMapping("/shopR/getlist/{memId}")
	public String getCartList(Model model, @PathVariable Integer memId) {
		List<CartListDTO> cartList = cartService.getAll(memId);
		Integer totalPrice = 0;
		if (cartList.size() > 0) {
			totalPrice = cartService.getTotalPrice(memId);
			for (CartListDTO cartDTO : cartList) {
				cartService.setShowPic(cartDTO);
			}
		}
		model.addAttribute("memId", memId);
		model.addAttribute("shoppingCartList", cartList);
		model.addAttribute("totalPrice", totalPrice);
		return "shoppingCart/listAll.jsp";
	}

	@PostMapping("/shopR/getCartQuantity")
	public ResponseEntity<Map<String, Integer>> getCartQuantity(@RequestBody Map<String, Integer> request) {
		Integer memId = request.get("memId");
		Integer totalQuantity = cartService.getTotalAmount(memId);
		Map<String, Integer> response = new HashMap<>();
		response.put("totalQuantity", totalQuantity);
		return ResponseEntity.ok(response);
	}
	@GetMapping("/shopR/checkout/{memId}")
	public String checkout(Model model, @PathVariable Integer memId ) {
		System.out.println("hi");
		TokenService tokenService = new TokenService();
		List<ShoppingCartVO> shoppingCartVOList= cartService.cartToVOList(memId);
		Integer totalPrice =cartService.getTotalPrice(memId);
		Integer maxToken = tokenService.getTokenTotalByMemId(memId);
		System.out.println("token:"+maxToken);
		System.out.println("total:"+totalPrice);
		model.addAttribute("memId", memId);
		model.addAttribute("shoppingCartList", shoppingCartVOList);
		model.addAttribute("totalPrice", totalPrice);
		model.addAttribute("maxToken", maxToken);
		return "/checkout/order.jsp";
	}
}
