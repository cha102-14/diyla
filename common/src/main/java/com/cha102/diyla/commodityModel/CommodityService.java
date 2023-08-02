package com.cha102.diyla.commodityModel;

import java.util.Base64;
import java.util.List;

public class CommodityService {
    CommodityDao dao = new CommodityDaoImpl();

    public int insert(CommodityVO commodityVO) {
        return dao.insert(commodityVO);
    }

    public List<CommodityVO> getAll() {
        List<CommodityVO> commodityVOS = dao.getAll();
        for (CommodityVO commodityVO : commodityVOS) {
            commodityVO.setShowPic("data:image/png;base64," + Base64.getEncoder().encodeToString(commodityVO.getComPic()));
        }
        return commodityVOS;
    }
}
