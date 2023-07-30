package com.cha102.diyla.commodityModel;

public class CommodityService {
    CommodityDao dao = new CommodityDaoImpl();

    public int insert(CommodityVO commodityVO) {
        return dao.insert(commodityVO);
    }


}
