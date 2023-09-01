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

import com.cha102.diyla.shoppingcart.ShoppingCartServiceSpring;
import com.cha102.diyla.shoppingcart.ShoppingCartVO;
import com.google.gson.Gson;

@Controller
public class ShoppingCartSpring {
	@Autowired
	private ShoppingCartServiceSpring shoppingCartService;
    private static final Gson gson = new Gson();

	@PostMapping("/shop/insert")
	public ResponseEntity<String> insert(@RequestBody ShoppingCartVO shoppingCartVO) {
		try {
			shoppingCartService.insert(shoppingCartVO);
			JSONObject jsonResponse = new JSONObject();
			jsonResponse.put("success", true);
			return ResponseEntity.ok(jsonResponse.toString());
		} catch (Exception e) {
			JSONObject jsonResponse = new JSONObject();
			jsonResponse.put("success", false);
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(jsonResponse.toString());
		}
	}

	@PostMapping("/shop/update")
	public ResponseEntity<String> update(@RequestBody ShoppingCartVO shoppingCartVO) {
		try {
			shoppingCartService.update(shoppingCartVO);
			JSONObject jsonResponse = new JSONObject();
			jsonResponse.put("success", true);
			return ResponseEntity.ok(jsonResponse.toString());
		} catch (Exception e) {
			JSONObject jsonResponse = new JSONObject();
			jsonResponse.put("success", false);
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(jsonResponse.toString());
		}
	}

	@PostMapping("/shop/delete")
	public ResponseEntity<String> deleteCartItem(@RequestParam Integer comNo, @RequestParam Integer memId) {
		try {
			shoppingCartService.delete(memId, comNo);
			JSONObject jsonResponse = new JSONObject();
			jsonResponse.put("success", true);
			return ResponseEntity.ok(jsonResponse.toString());
		} catch (Exception e) {
			JSONObject jsonResponse = new JSONObject();
			jsonResponse.put("success", false);
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(jsonResponse.toString());
		}
	}

	@DeleteMapping("/shop/clear/{memId}")
	public ResponseEntity<String> deleteByMemId(@PathVariable Integer memId) {
		try {
			shoppingCartService.deleteByMemId(memId);
			JSONObject jsonResponse = new JSONObject();
			jsonResponse.put("success", true);
			return ResponseEntity.ok(jsonResponse.toString());

		} catch (Exception e) {
			JSONObject jsonResponse = new JSONObject();
			jsonResponse.put("success", false);
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(jsonResponse.toString());
		}
	}
	@GetMapping("/shop/getlist/{memId}")
	public String getCartList(Model model,@PathVariable Integer memId) {
		System.out.println("confirm!!");
		List<ShoppingCartVO> cartList = shoppingCartService.findByMemId(memId);
		Integer totalPrice=0;
		if (cartList.size() > 0) {
			totalPrice = shoppingCartService.getTotalPrice(memId);
			for (ShoppingCartVO shoppingCartVO : cartList) {
				shoppingCartService.setShowPic(shoppingCartVO);
			}
		}
		model.addAttribute("memId",memId);
		model.addAttribute("shoppingCartList",cartList);
		model.addAttribute("totalPrice",totalPrice);
	    return "shoppingCart/listAll.jsp";
	}
	
	@PostMapping("/shop/getCartQuantity")
	public ResponseEntity<Map<String, Integer>> getCartQuantity(@RequestBody Map<String, Integer> request) {
	    Integer memId = request.get("memId");
	    Integer totalQuantity = shoppingCartService.getTotalAmount(memId); 
	    Map<String, Integer> response = new HashMap<>();
	    response.put("totalQuantity", totalQuantity);
	    return ResponseEntity.ok(response);
	}
}
