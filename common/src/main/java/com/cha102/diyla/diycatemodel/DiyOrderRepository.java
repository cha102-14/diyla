package com.cha102.diyla.diycatemodel;

import com.cha102.diyla.diyOrder.DiyOrderVO;
import com.cha102.diyla.diycatemodel.DiyCateEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;
@Repository
public interface DiyOrderRepository extends JpaRepository<DiyCateEntity,Integer> {

    @Query(value = "select o.DIY_NO,MEM_ID,RESERVATION_STATUS,DIY_PIC,DIY_NAME,DIY_RESERVE_DATE,DIY_PRICE from diy_order o join diy_cate c on o.DIY_NO = c.DIY_NO where MEM_ID = ?1",nativeQuery = true)
    List<Object[]> findAll(Integer memID);
}
