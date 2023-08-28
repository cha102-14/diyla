package com.cha102.diyla.diyforummodel;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import javax.persistence.*;
import java.sql.Timestamp;

@Data
@Entity
@Table(name = "diy_forum")
public class DiyForumEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "ARTI_NO")
    private Integer artiNo;
    //
    // @Column(name = "MEM_ID", insertable = true, updatable = false)
    // private Integer memId;

    @Column(name = "DIY_NO")
    private Integer diyNo;

    @Column(name = "ARTI_CONT")
    private String artiCont;

    @Column(name = "DIY_GRA")
    private Integer diyGrade;

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "Asia/Taipei")
    @Column(name = "CREATE_TIME")
    private Timestamp createTime;


    @ManyToOne
    @JoinColumn(name = "MEM_ID")
    private MemberEntity memberEntity;

}
