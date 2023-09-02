package com.cha102.diyla.noticeModel;

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

    @Column(name = "NOTICE_CONTEXT")
    private String noticeContext;

    @Column(name = "NOTICE_TIME")
    private Timestamp noticeTime = Timestamp.valueOf(LocalDateTime.now());

    @Column(name = "NOTICE_STATUS")
    private Integer noticeStatus;
}
