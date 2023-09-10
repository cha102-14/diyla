package com.cha102.diyla.articlemsgmodel;

import com.cha102.diyla.member.MemVO;
import com.cha102.diyla.member.MemberService;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import javax.validation.constraints.NotEmpty;
import java.sql.Timestamp;

@Entity
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "ARTICLE_MESSAGE")
public class ArtMsgVO {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "MSG_NO")
    private Integer msgNo;
    @Column(name = "MSG_CONTEXT")
    @NotEmpty(message = "請輸入留言內容")
    private String msgContext;
    @Column(name = "MSG_TIME", insertable = false, updatable = false)
    private Timestamp msgTime;
    @Column(name = "MSG_STATUS")
    private Byte msgStatus;
    @Column(name = "MEM_ID", updatable = false)
    private Integer memId;
    @Column(name = "ART_NO", updatable = false)
    private Integer artNo;
    @Transient
    private MemVO memVO;

    public String getMemVO() {
        MemberService memSvc = new MemberService();
        MemVO memVO = memSvc.selectMem(memId);
        String email = memVO.getMemEmail();
        return email;
    }
}
