package com.cha102.diyla.commodityClassModel;

public class CommodityClassService {
    CommodityClassDao dao = new CommodityClassDaoImpl();

    public int insert(CommodityClassVO commodityClassVO) {
        return dao.insert(commodityClassVO);
    }


}
