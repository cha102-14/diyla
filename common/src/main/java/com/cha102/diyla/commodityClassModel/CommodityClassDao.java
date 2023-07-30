package com.cha102.diyla.commodityClassModel;

import java.util.List;

public interface CommodityClassDao {
    int insert(CommodityClassVO commodityClass);

    List<CommodityClassVO> getAll();
}
