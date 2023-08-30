package com.cha102.diyla.back.controller.shop;

import com.cha102.diyla.commodityClassModel.CommodityClassEntity;
import com.cha102.diyla.commodityClassModel.CommodityClassJpaService;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.List;

@RestController
@RequestMapping("/shop/commodityClass")
public class CommodityClassRestController {


    private CommodityClassJpaService commodityClassJpaService;

    public CommodityClassRestController(CommodityClassJpaService commodityClassJpaService) {
        this.commodityClassJpaService = commodityClassJpaService;
    }

    @RequestMapping("/getAll")
    public List<CommodityClassEntity> getAll() {
        return commodityClassJpaService.getAll();
    }

    @PostMapping("/update")
    // 根據前端傳來的JSON Mapping對應的型別
    public List<CommodityClassEntity> update(@RequestBody CommodityClassEntity commodityClassEntity) {

        commodityClassEntity.setUpdateTime(Timestamp.valueOf(LocalDateTime.now()));
        commodityClassJpaService.save(commodityClassEntity);

        return commodityClassJpaService.getAll();
    }

}
