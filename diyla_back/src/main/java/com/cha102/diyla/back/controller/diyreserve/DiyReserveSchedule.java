package com.cha102.diyla.back.controller.diyreserve;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.cha102.diyla.diyreservemodel.DiyReserveResultService;

@Component
public class DiyReserveSchedule {  // 排程器 spring boot版本
	
	@Autowired
	DiyReserveController diyReserveController;

	
	@Scheduled(cron = "*/10 * * * * ?")
	public void test() {
		diyReserveController.getAllSummary();
	}
}
