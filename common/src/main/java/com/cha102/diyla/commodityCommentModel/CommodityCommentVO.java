package com.cha102.diyla.commodityCommentModel;

import lombok.Data;

import javax.persistence.*;
import java.sql.Timestamp;
import java.time.LocalDateTime;

@Entity
@Table(name = "COMMODITY_COMMENT")
@Data
public class CommodityCommentVO {
    @Transient
    public static String average;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "COM_COMMENT_NO")
    private Integer comCommentNo;

    @Column(name = "COM_NO")
    private Integer comNo;

    @Transient
    private String memName;

    @Column(name = "MEM_ID")
    private Integer memId;

    @Column(name = "RATING")
    private Integer rating;

    @Column(name = "COM_CONTENT")
    private String comContent;

    @Column(name = "COM_TIME")
    private Timestamp comTime = Timestamp.valueOf(LocalDateTime.now());

    @Transient
    private String commentTime;
    @Transient
    private String star;
}
