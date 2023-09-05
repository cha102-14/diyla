package com.cha102.diyla.diyreservemodel;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.sql.Timestamp;
import java.util.Date;


@Data
@Entity
@Table(name = "diy_reserve_result")
@AllArgsConstructor
@NoArgsConstructor
public class DiyReserveResultEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "DIY_RESERVE_NO")
    private Integer diyReserveNo;

    @Column(name = "DIY_RESERVE_DATE", nullable = false)
    private Date diyReserveDate;

    @Column(name = "DIY_PERIOD", nullable = false)
    private Integer diyPeriod;

    @Column(name = "PEO_COUNT", nullable = false)
    private Integer peoCount;

    @Column(name = "RESERVE_STATUS", nullable = false)
    private Integer reserveStatus;

    @Column(name = "RESERVE_UPD_TIME", nullable = false)
    private Timestamp reserveUpdTime;

    @Column(name = "ITEM_QUANTITY", nullable = false)
    private Integer itemQuantity;

    @Column(name = "PEO_LIMIT", nullable = false)
    private Integer peoLimit;

}
