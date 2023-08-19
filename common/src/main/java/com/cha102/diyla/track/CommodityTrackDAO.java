package com.cha102.diyla.track;

import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface CommodityTrackDAO extends JpaRepository<CommodityTrackVO,Integer> {
    List<CommodityTrackVO> findAllByMemId(Integer memId);
}
