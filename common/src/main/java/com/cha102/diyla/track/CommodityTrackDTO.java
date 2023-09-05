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
        this.memId = (Integer) objects[0];
        this.comNO = (Integer) objects[1];
        this.comName = (String) objects[2];
        this.comPic = (byte[]) objects[3];
        this.comPri = (Integer) objects[4];
        this.comQua = (Integer) objects[5];
    }
}
