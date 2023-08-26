package com.cha102.diyla.back.controller.shop;

import com.cha102.diyla.commodityClassModel.CommodityClassEntity;
import com.cha102.diyla.commodityClassModel.CommodityClassJpaService;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

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

}
