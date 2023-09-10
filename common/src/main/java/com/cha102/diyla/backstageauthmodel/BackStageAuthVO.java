package com.cha102.diyla.backstageauthmodel;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

import java.io.Serializable;

@Getter
@Setter
@NoArgsConstructor
@ToString
public class BackStageAuthVO implements Serializable {
    private Integer empId;
    private Integer authId;


}
