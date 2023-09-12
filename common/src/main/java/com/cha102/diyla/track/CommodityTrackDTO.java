package com.cha102.diyla.track;

import lombok.Getter;

@Getter
public class CommodityTrackDTO {
    private Integer trackId;
    private Integer memId;
    private Integer comNO;
    private String comName;
    private byte[] comPic;
    private Integer comPri;
    private Integer comQua;



    public CommodityTrackDTO(Object[] objects){
        this.trackId=(Integer) objects[0];
        this.memId = (Integer) objects[1];
        this.comNO = (Integer) objects[2];
        this.comName = (String) objects[3];
        this.comPic = (byte[]) objects[4];
        this.comPri = (Integer) objects[5];
        this.comQua = (Integer) objects[6];
    }
}
