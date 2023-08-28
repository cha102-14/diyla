package com.cha102.diyla.diyreserveresult;


import lombok.Data;

import javax.persistence.*;
import java.sql.Timestamp;
import java.util.Date;


@Data
@Entity
@Table(name = "diy_reserve_result")
public class DiyReserveResultEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "DIY_RESERVE_NO")
    private int diyReserveNo;

    @Column(name = "DIY_RESERVE_DATE", nullable = false)
    private Date diyReserveDate;

    @Column(name = "DIY_PERIOD", nullable = false)
    private int diyPeriod;

    @Column(name = "PEO_COUNT", nullable = false)
    private int peoCount;

    @Column(name = "RESERVE_STATUS", nullable = false)
    private int reserveStatus;

    @Column(name = "RESERVE_UPD_TIME", nullable = false)
    private Timestamp reserveUpdTime;

    @Column(name = "ITEM_QUANTITY", nullable = false)
    private int itemQuantity;

}
