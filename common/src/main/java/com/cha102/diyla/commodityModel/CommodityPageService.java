package com.cha102.diyla.commodityModel;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

@Service
public class CommodityPageService {
    private CommodityPageRepository commodityPageRepository;

    public CommodityPageService(CommodityPageRepository commodityPageRepository) {
        this.commodityPageRepository = commodityPageRepository;
    }

    public Page<Commodity> findAll(Integer page) {
        Pageable pageable = PageRequest.of(page, 3, Sort.by("comNO").ascending());
        return commodityPageRepository.findAll(pageable);
    }
}
