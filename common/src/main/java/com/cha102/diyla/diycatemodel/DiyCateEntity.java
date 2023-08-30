package com.cha102.diyla.diycatemodel;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.math.BigDecimal;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "diy_cate")
public class DiyCateEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "DIY_NO")
    private int diyNo;

    @Column(name = "DIY_NAME", nullable = false)
    private String diyName;

    @Column(name = "DIY_GRA_PEOCOUNT", nullable = false)
    private int diyGradePersonCount;

    @Column(name = "DIY_GRA_STARCOUNT", nullable = false)
    private int diyGradeStarCount;

    @Column(name = "DIY_STATUS", nullable = false)
    private int diyStatus;

    @Column(name = "DIY_CATE_NAME", nullable = false)
    private int diyCategoryName;

    @Lob
    @Column(name = "DIY_PIC")
    private byte[] diyPicture;

    @Column(name = "ITEM_DETAILS", nullable = false)
    private String itemDetails;

    @Column(name = "AMOUNT",nullable = false)
    private BigDecimal amount;

    @JsonIgnore
    @Transient
    private String diyCategoryDisplayName;

    @JsonIgnore
    @Transient
    private String diyStatusName;

    @JsonIgnore
    @Transient
    private String image;

    @JsonProperty("diyCategoryDisplayName")
    public String getDiyCategoryDisplayName() {
        switch (diyCategoryName) {
            case 0:
                return "其他";
            case 1:
                return "蛋糕";
            case 2:
                return "派餅";
            case 3:
                return "麵包";
            default:
                return "未知";
        }
    }
    @JsonProperty("diyStatusName")
    public String getDiyStatusName() {
        return diyStatus == 0 ? "上架" : "下架";
    }
}
