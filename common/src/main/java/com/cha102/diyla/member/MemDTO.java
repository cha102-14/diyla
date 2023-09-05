package com.cha102.diyla.member;


import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

import javax.persistence.Column;

@Getter
@Setter
@ToString
@NoArgsConstructor
public class MemDTO implements java.io.Serializable {

    private Integer memId;
    private String memName;
    private String memEmail;
    private String memPhone;
    private Boolean blacklistArt;


    public MemDTO(Object[] objects) {
        this.memId = (Integer) objects[0];
        this.memName = (String) objects[1];
        this.memEmail = (String) objects[2];
        this.memPhone = (String) objects[3];
        this.blacklistArt = String.valueOf((Byte) objects[4]).equalsIgnoreCase("1");

    }

}
