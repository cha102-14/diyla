package com.cha102.diyla.sweetclass.classModel;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

import java.sql.Date;
@Getter
@Setter
@NoArgsConstructor
@ToString
public class ClassOrderDTO {

    private Integer classId;
    private Byte status;
    private Byte[] classPic;
    private String className;
    private Date classDate;
    private Integer totalPrice;
    private ClassVO classVO;
    private ClassReserveVO classReserveVO;

    public void setClassPic(byte[] classPics) {
    }



}
