package com.cha102.diyla.back.controller.diyreserve;


import com.cha102.diyla.diyreservemodel.DIYReserveVO;
import com.cha102.diyla.diyreservemodel.DiyReserveResultEntity;
import com.cha102.diyla.diyreservemodel.DiyReserveResultService;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

@RestController
@RequestMapping("/api/diy-reserve")
public class DiyReserveController {

    //@Resource是依賴注入的方式，使得控制器可以使用diyReserveService來執行預訂相關的業務邏輯。
    @Resource
    private DiyReserveResultService diyReserveService;

    //GetMapping查詢   PostMapping新增
    @GetMapping("/peoItemQuantityReport")
    public List<DIYReserveVO[]> getItemQuantityReport(
            // @RequestParam(value = "endDate",required = false) Date endDate,
            // @RequestParam("period") int period
    ) {
        //設定只能訂六十天內
        Calendar calendar = Calendar.getInstance();
        //將當前日期加上60天，得到一個結束日期，表示預訂的時間範圍最多為60天。
        calendar.add(Calendar.DAY_OF_MONTH, 60);
        Date endDate = calendar.getTime();
        return diyReserveService.getItemQuantityByDateRange(endDate);
    }

    // 執行預訂
    @PostMapping("/reserve")
    public DiyReserveResultEntity makeReservation(@RequestBody DiyReserveResultEntity reservation) {
        // 檢查所選DIY_PERIOD是否已滿（PEO_COUNT >= 10）
        int selectedPeriod = reservation.getDiyPeriod();
        int currentPeoCount = diyReserveService.getCurrentPeoCount(selectedPeriod);

        if (currentPeoCount >= 10) {
            // 設定RESERVE_STATUS為1（不可預約）
            reservation.setReserveStatus(1);
        } else {
            // 設定RESERVE_STATUS為0（可預約）
            reservation.setReserveStatus(0);
        }

        // 設定PEO_LIMIT為剩餘可用位數
        reservation.setPeoLimit(10 - currentPeoCount);

        // 根據需要設定其他欄位（DIY_RESERVE_DATE、RESERVE_UPD_TIME、ITEM_QUANTITY）

        // 儲存預訂
        return diyReserveService.insert(reservation);
    }
    
    @RequestMapping("/diyResult/allPeriodResult")
    public List<DiyReserveResultEntity> getAllSummary(){  // 可新增訂單之後再去呼叫此方法，就不需要排程器了
    	List<DiyReserveResultEntity> diyReserveResultEntityList = diyReserveService.getAllSummaryFromOrder();
//    	model.addAttribute("diyReserveResultEntityList",diyReserveResultEntityList);
    	
    	 
    	return diyReserveResultEntityList;
    	
    };
    
    
    
    
    
    
    

}
