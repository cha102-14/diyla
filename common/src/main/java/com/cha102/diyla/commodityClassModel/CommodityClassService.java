package com.cha102.diyla.commodityClassModel;

import java.util.List;

public class CommodityClassService {
    CommodityClassDao dao = new CommodityClassDaoImpl();

    public int insert(CommodityClassVO commodityClassVO) {
        return dao.insert(commodityClassVO);
    }
    public List<CommodityClassVO> getAll() {
        return dao.getAll();
    }

}
