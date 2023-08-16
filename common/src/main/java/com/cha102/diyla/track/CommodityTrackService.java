package com.cha102.diyla.track;

import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CommodityTrackService {

    private CommodityTrackDAO commodityTrackDAO;

    public CommodityTrackService(CommodityTrackDAO commodityTrackDAO) {
        this.commodityTrackDAO = commodityTrackDAO;
    }

    public List<CommodityTrackVO> findAllByMemId(Integer memId) {
        return commodityTrackDAO.findAllByMemId(memId);
    }
}
