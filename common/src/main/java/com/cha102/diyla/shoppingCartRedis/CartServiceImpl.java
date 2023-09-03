package com.cha102.diyla.shoppingCartRedis;

import java.util.ArrayList;
import java.util.Base64;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cha102.diyla.shoppingcart.ShoppingCartVO;
@Service
public class CartServiceImpl implements CartService{
	@Autowired
	private CartRepository cartRepository;

	@Override
	public void addItem(CartListDTO dto) {
		Integer memId = dto.getMemId();
		Integer comNo = dto.getComNo();
		Integer comAmount =dto.getComAmount();
		cartRepository.addItem(memId, comNo, comAmount);
	}

	@Override
	public void modifyComAmount(CartListDTO dto) {
		Integer memId = dto.getMemId();
		Integer comNo = dto.getComNo();
		Integer comAmount =dto.getComAmount();
		cartRepository.modify(memId, comNo, comAmount);
	}

	@Override
	public List<CartListDTO> getAll(Integer memId) {
		return cartRepository.getAll(memId);
	}

	@Override
	public void clear(Integer memId) {
		cartRepository.clear(memId);
	}

	@Override
	public void delete(Integer memId, Integer comNo) {
		cartRepository.delete(memId, comNo);
	}

	@Override
	public void setShowPic(CartListDTO dto) {
		dto.setShowPic("data:image/png;base64," + Base64.getEncoder().encodeToString(dto.getComPic()));
	}

	@Override
	public Integer getTotalPrice(Integer memId) {
		return cartRepository.getTotalPrice(memId);
	}

	@Override
	public Integer getTotalAmount(Integer memId) {
		return cartRepository.getTotalAmount(memId);
	}
	@Override
	public List<ShoppingCartVO> cartToVOList(Integer memId){
		List<CartListDTO> cartListDTOList =getAll(memId);
		List<ShoppingCartVO>cartVOList =new ArrayList<>();
		for(CartListDTO dto:cartListDTOList) {
			ShoppingCartVO cartVO = new ShoppingCartVO();
			cartVO.setComNo(dto.getComNo());
			cartVO.setMemId(memId);
			cartVO.setComName(dto.getComName());
			cartVO.setComAmount(dto.getComAmount());
			cartVO.setComPri(dto.getComPri());
			cartVOList.add(cartVO);
		}
		return cartVOList;
	}























}
