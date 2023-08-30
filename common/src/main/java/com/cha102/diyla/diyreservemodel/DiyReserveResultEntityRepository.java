package com.cha102.diyla.diyreservemodel;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;
import java.util.List;

public interface DiyReserveResultEntityRepository extends JpaRepository<DiyReserveResultEntity, Integer> {

    @Query("SELECT new com.cha102.diyla.diyreservemodel.DIYReserveVO(d.diyReserveDate, d.diyPeriod, SUM(d.itemQuantity)) FROM DiyReserveResultEntity d " +
            "WHERE d.diyReserveDate BETWEEN CURRENT_DATE AND :endDate " +
            // "AND d.diyPeriod = :period " +
            "GROUP BY d.diyReserveDate, d.diyPeriod")
    List<DIYReserveVO[]> getItemQuantityByDateRange(@DateTimeFormat(pattern = "yyyy-MM-dd") @Param("endDate") Date endDate);
}
