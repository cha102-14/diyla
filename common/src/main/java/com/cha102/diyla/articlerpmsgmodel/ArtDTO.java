package com.cha102.diyla.articlerpmsgmodel;

import lombok.Getter;

import java.sql.Timestamp;
@Getter
public class ArtDTO {
    private Integer rpMsgNo;
    private String rpMsgContext;
    private Timestamp rpMsgTime;
    private Byte rpMsgStatus;
    private Integer memId;
    private String msgContext;
    private Integer msgNo;

    public ArtDTO (Object[] objects){
        this.rpMsgNo= (Integer) objects[0];
        this.rpMsgContext= (String) objects[1];
        this.rpMsgTime= (Timestamp) objects[2];
        this.rpMsgStatus= (Byte) objects[3];
        this.memId= (Integer) objects[4];
        this.msgContext= (String) objects[5];
        this.msgNo= (Integer) objects[6];

    }
}
