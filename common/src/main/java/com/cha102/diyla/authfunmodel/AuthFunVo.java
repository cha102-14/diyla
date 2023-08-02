package com.cha102.diyla.authfunmodel;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.io.Serializable;
@Getter
@Setter
@ToString
public class AuthFunVo implements java.io.Serializable {
    private String authFun;
    private Integer authId;
}
