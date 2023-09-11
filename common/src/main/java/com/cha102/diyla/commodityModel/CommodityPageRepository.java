package com.cha102.diyla.commodityModel;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.PagingAndSortingRepository;

public interface CommodityPageRepository extends JpaRepository<Commodity,Integer> {
    Page<Commodity> findAll(Pageable pageable);
}
