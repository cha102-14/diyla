package com.cha102.diyla.front.controller.diyCate;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.cha102.diyla.diycatemodel.*;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import com.cha102.diyla.diycatemodel.DiyCateService;

@Controller
public class DiyCateController {
	
	@Autowired
	DiyCateService diyCateService;
	
	@GetMapping("/diyCate/diyCateList")
	public String getAllCateFront(ModelMap model ) {
//		ObjectMapper objectMapper = new ObjectMapper();
		List<DiyCateEntity> diyCateList = diyCateService.getAllDiyCates();
		model.addAttribute("diyCateList",diyCateList);

		
		return "/diyCateViewFront/diyCateView_2.jsp";
	}
	
	@GetMapping("/diyCate/bookDiyOrder")
	public String newDiyOrder(
			@RequestParam("DiyNo")Integer DiyNo , Model model) {
//		ObjectMapper objectMapper = new ObjectMapper();
//		List<DiyCateEntity> diyCateList = diyCateService.getAllDiyCates();
		DiyCateEntity diyCateEntity = diyCateService.findById(DiyNo);
		model.addAttribute("diyCateEntity",diyCateEntity);
		System.out.println(diyCateEntity);
		
		return "/diybooking/diybooking.jsp";
	}
	
	
	@GetMapping("/diyCate/diyCate_detail")
	public String getOneCateFront(ModelMap model,@RequestParam int diyNo ) {
//		ObjectMapper objectMapper = new ObjectMapper();
		System.out.println(diyNo);
		DiyCateEntity diyCateEntity = diyCateService.getDiyCateById(diyNo);
//		System.out.println(diyCateEntity.);
		model.addAttribute("DiyCateEntity",diyCateEntity);

		
		return "/diyCateViewFront/diyOneCate.jsp";
	}


	@GetMapping("/diyCate/reserve")
	public String reserve(ModelMap model,@RequestParam int diyNo ) {
		DiyCateEntity diyCateEntity = diyCateService.getDiyCateById(diyNo);
//		System.out.println(diyCateEntity.);
		model.addAttribute("DiyCateEntity",diyCateEntity);


		return "/diybooking/diybooking.jsp";
	}
	
	

	
	

}
