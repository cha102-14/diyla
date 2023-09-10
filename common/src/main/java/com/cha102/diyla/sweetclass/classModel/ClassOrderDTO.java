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

    public ClassOrderDTO(Integer classId,Byte status,Byte[] classPic,String className,Date classDate,Integer totalPrice,ClassVO classVO,ClassReserveVO classReserveVO){
        this.classId=classId;
        this.status=status;
        this.classPic=classPic;
        this.className=className;
        this.classDate=classDate;
        this.totalPrice=totalPrice;
        this.classVO=classVO;
        this.classReserveVO=classReserveVO;
    }



}
