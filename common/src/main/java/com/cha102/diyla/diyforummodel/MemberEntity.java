package com.cha102.diyla.diyforummodel;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.util.Date;

//VO
@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "member")
public class MemberEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="MEM_ID")
    private Integer memId;

    @Column(name = "MEM_NAME")
    private String memName;

    @Column(name = "MEM_EMAIL")
    private String memEmail;

    @Column(name = "MEM_PASSWORD")
    private String memPassword;

    @Column(name = "MEM_PHONE")
    private String memPhone;

    @Column(name = "MEM_BIRTHDAY")
    @Temporal(TemporalType.DATE)
    private Date memBirthday;

    @Column(name = "MEM_GENDER")
    private Integer memGender;

    @Column(name = "MEM_ADDRESS")
    private String memAddress;

    @Column(name = "MEM_STATUS")
    private Integer memStatus;

    @Column(name = "MEM_TOKEN")
    private Integer memToken;

    @Column(name = "MEM_DATE")
    @Temporal(TemporalType.TIMESTAMP)
    private Date memDate;

    @Column(name = "BLACKLIST_COM")
    private Integer blacklistCom;

    @Column(name = "BLACKLIST_ART")
    private Integer blacklistArt;

    @Column(name = "BLACKLIST_DIY")
    private Integer blacklistDiy;

    @Column(name = "BLACKLIST_CLASS")
    private Integer blacklistClass;

    @Column(name = "RPMSG_COUNT")
    private Integer rpmsgCount;
}
