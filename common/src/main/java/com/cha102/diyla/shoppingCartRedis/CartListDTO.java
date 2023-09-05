package com.cha102.diyla.shoppingCartRedis;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Data
@Getter
@Setter
@AllArgsConstructor
public class CartListDTO {
	private Integer memId;
	private Integer comNo;
	private String comName; 
	private Integer comPri; // 商品價格（可選）
	private byte[] comPic; // 商品圖片URL（可選）
	private Integer comAmount; // 商品數量
	private String ShowPic;



	public CartListDTO() {
	}

}
