package com.cha102.diyla.commodityClassModel;

import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CommodityClassJpaService {
    private CommodityClassRepository commodityClassRepository;


    public CommodityClassJpaService(CommodityClassRepository commodityClassRepository) {
        this.commodityClassRepository = commodityClassRepository;
    }

    public List<CommodityClassEntity> getAll() {
        return commodityClassRepository.findAll();
    }
}
