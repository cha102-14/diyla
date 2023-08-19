package com.cha102.diyla.commonproblemmodel;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.io.Serializable;
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class PbmVO implements Serializable{

    private Integer pbmNo;
    private  Byte pbmSort;
    private  String pbmTitle;
    private  String pbmContext;
}