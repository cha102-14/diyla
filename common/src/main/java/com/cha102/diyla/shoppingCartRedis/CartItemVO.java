package com.cha102.diyla.shoppingCartRedis;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class CartItemVO {
	private Integer comAmount;
	private String comJson;
}
