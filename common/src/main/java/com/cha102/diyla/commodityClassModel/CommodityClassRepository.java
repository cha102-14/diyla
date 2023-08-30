package com.cha102.diyla.commodityClassModel;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
@Repository
public interface CommodityClassRepository extends JpaRepository<CommodityClassEntity,Integer> {
    List<CommodityClassEntity> findAll();
}
