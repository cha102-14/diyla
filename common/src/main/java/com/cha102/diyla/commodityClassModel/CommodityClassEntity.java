package com.cha102.diyla.commodityClassModel;

import lombok.Data;

import javax.persistence.*;
import java.io.Serializable;
import java.sql.Timestamp;

@Entity
@Table(name = "commodity_class")
@Data
public class CommodityClassEntity implements Serializable {
    @Id
    @Column(name = "COM_CLASS_NO",nullable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer comClassNo;
    @Column(name = "COM_CLASS_NAME",nullable = false)
    private String comClassName;
    @Column(name = "UPDATE_TIME")
    @GeneratedValue
    private Timestamp updateTime;


}
