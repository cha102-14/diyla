package com.cha102.diyla.front.controller.diyreserve;


import com.cha102.diyla.diyreservemodel.DIYReserveVO;

import com.cha102.diyla.diyreservemodel.DiyReserveResultEntity;
import com.cha102.diyla.diyreservemodel.DiyReserveResultService;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

@CrossOrigin(origins = "*")
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
    @GetMapping("/all-groups")
    public List<DiyReserveResultEntity> getAllGroups() {
        // 调用service层的方法获取所有DIY预订结果
        return diyReserveService.getAllGroups();
    }
}