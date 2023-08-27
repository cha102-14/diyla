package com.cha102.diyla.commodityCommentModel;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CommodityCommentRepository extends JpaRepository<CommodityCommentVO,Integer> {
    List<CommodityCommentVO> findAllByComNo(Integer comNo);
}
