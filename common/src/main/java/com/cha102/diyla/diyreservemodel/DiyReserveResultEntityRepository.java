package com.cha102.diyla.diyreservemodel;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Repository;

import java.util.Date;
import java.util.List;


@Repository
public interface DiyReserveResultEntityRepository extends JpaRepository<DiyReserveResultEntity, Integer> {



    @Query("SELECT new com.cha102.diyla.diyreservemodel.DIYReserveVO(d.diyReserveDate, d.diyPeriod, SUM(d.itemQuantity)) FROM DiyReserveResultEntity d " +
            "WHERE d.diyReserveDate BETWEEN CURRENT_DATE AND :endDate " +
            // "AND d.diyPeriod = :period " +
            "GROUP BY d.diyReserveDate, d.diyPeriod")
    List<DIYReserveVO[]> getItemQuantityByDateRange(@DateTimeFormat(pattern = "yyyy-MM-dd") @Param("endDate") Date endDate);

    @Query("SELECT new com.cha102.diyla.diyreservemodel.DIYReserve2VO(d.diyReserveDate, d.diyPeriod, SUM(d.peoCount)) FROM DiyReserveResultEntity d " +
            "WHERE d.diyReserveDate BETWEEN CURRENT_DATE AND :endDate " +
            "GROUP BY d.diyReserveDate, d.diyPeriod")
    List<DIYReserve2VO[]> getPeoCountByDateRange(@Param("endDate") Date endDate);

    @Query(value="SELECT * FROM diyla.diy_reserve_result where DIY_RESERVE_DATE = ? AND DIY_PERIOD = ?", nativeQuery = true)
    public DiyReserveResultEntity getOneSummary(Date diyReserveDate, Integer diyPeriod );

}
