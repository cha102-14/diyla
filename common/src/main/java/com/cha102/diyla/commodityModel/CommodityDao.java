package com.cha102.diyla.commodityModel;

import java.util.List;

public interface CommodityDao {

    int insert(CommodityVO commodity);

    List<CommodityVO> getAll();


}
