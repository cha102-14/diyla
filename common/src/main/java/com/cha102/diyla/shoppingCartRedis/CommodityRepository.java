package com.cha102.diyla.shoppingCartRedis;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.cha102.diyla.commodityModel.Commodity;
@Repository
public interface CommodityRepository extends JpaRepository<Commodity, Integer> {
	
	Commodity findByComNO(@Param("comNo")Integer comNo);
}
