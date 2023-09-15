package com.cha102.diyla.noticeModel;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import javax.persistence.*;
import java.sql.Timestamp;
import java.time.LocalDateTime;

@Entity
@Table(name = "NOTICE")
@Data
public class NoticeVO {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "NOTICE_NO")
    private Integer noticeNo;

    @Column(name = "MEM_ID")
    private Integer memId;
    

    @Column(name = "NOTICE_TITLE")
    private String noticeTitle;

    //    @Column(name = "NOTICE_CONTEXT")
//    private String noticeContext;
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "Asia/Taipei")
    @Column(name = "NOTICE_TIME",insertable = false)
    private Timestamp noticeTime = Timestamp.valueOf(LocalDateTime.now());

    @Column(name = "NOTICE_STATUS",insertable = false)
    private byte noticeStatus;
}
