package com.cha102.diyla.member;


import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;

@Getter
@Setter
@NoArgsConstructor
@Entity
@Table(name="MEMBER")
public class MemSpringVO implements java.io.Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "MEM_ID")
    private Integer memId;
    @Column(name = "MEM_NAME")
    private String memName;
    @Column(name="MEM_EMAIL")
    private String memEmail;
    @Column(name="MEM_PHONE")
    private String memPhone;
    @Column(name="BLACKLIST_ART")
    private Boolean blacklistArt;


}

