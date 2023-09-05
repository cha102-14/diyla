package com.cha102.diyla.diycatemodel;


import lombok.Getter;
import java.sql.Date;
@Getter
public class DiyOrderDTO {

    private Integer diyNo;
    private Integer memId;
    private byte reservationStatus;
    private byte[] diyPic;
    private String diyCateName;
    private Date diyReserveDate;
    private Integer diyPrice;


    public DiyOrderDTO(Object[] objects){
        this.diyNo = (Integer) objects[0];
        this.memId = (Integer) objects[1];
        this.reservationStatus = (Byte) objects[2];
        this.diyPic = (byte[]) objects[3];
        this.diyCateName = (String) objects[4];
        this.diyReserveDate = (Date) objects[5];
        this.diyPrice = (Integer) objects[6];

    }

}
