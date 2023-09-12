package com.cha102.diyla.track;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository
public interface CommodityTrackRepository extends JpaRepository<CommodityTrackVO,Integer>{

    @Query(value = "select TRACK_ID,MEM_ID,t.COM_NO,COM_NAME,COM_PIC,COM_PRI,COM_QUA from commodity_track t join commodity c on t.COM_NO = c.COM_NO where mem_id=?1",nativeQuery = true)
    List<Object[]> findAll(Integer memID);

    CommodityTrackVO findFirstByComNOAndMemId(Integer comNo, Integer memId);
}
