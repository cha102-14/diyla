package com.cha102.diyla.commodityModel;

import java.util.List;

public interface CommodityDao {

	int insert(CommodityVO commodity);

	List<CommodityVO> getAll();

	CommodityVO findByID(Integer comNO);

	List<CommodityVO> findByNameKeyword(String nameKeyword);

	List<CommodityVO> findByComClass(Integer comClassNO);

	List<CommodityVO> getAllState();

	CommodityVO update(CommodityVO commodity);

	// ++
	List<CommodityVO> getAllByComNo(List<Integer> comNoList);


}
