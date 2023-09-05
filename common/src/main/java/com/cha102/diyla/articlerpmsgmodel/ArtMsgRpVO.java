package com.cha102.diyla.articlerpmsgmodel;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Size;
import java.sql.Timestamp;
@Entity
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "ARTICLE_MESSAGE_REPORT")
public class ArtMsgRpVO {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="RPMSG_NO")
    private Integer rpMsgNo;
    @Column(name="RPMSG_CONTEXT")
    @NotEmpty(message = "請輸入檢舉原因")
    @Size(min=2,max=40,message="檢舉原因: 長度必需在{min}到{max}之間")
    private String rpMsgContext;
    @Column(name="RPMSG_TIME",insertable = false,updatable = false)
    private Timestamp rpMsgTime;
    @Column(name="RPMSG_STATUS",insertable = false)
    private Byte rpMsgStatus;
    @Column(name="MEM_ID",updatable = false)
    private Integer memId;
    @Column(name="MSG_NO",updatable = false)
    private Integer msgNo;

}
