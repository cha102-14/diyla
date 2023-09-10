package com.cha102.diyla.articleModel;

import com.cha102.diyla.member.MemVO;
import com.cha102.diyla.member.MemberService;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import javax.validation.constraints.NotEmpty;
import java.sql.Timestamp;

@Entity
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "ARTICLE")
public class ArtVO {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "ART_NO")
    private Integer artNo;
    @NotEmpty(message = "請輸入文章標題")
    @Column(name = "ART_TITLE")
    private String artTitle;
    @Column(name = "ART_PIC")
    private byte[] artPic;
    @NotEmpty(message = "請輸入文章內容")
    @Column(name = "ART_CONTEXT")
    private String artContext;
    @Column(name = "ART_TIME", insertable = false, updatable = false)
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm")
    private Timestamp artTime;
    @Column(name = "ART_STATUS", insertable = false)
    private byte artStatus;
    @Column(name = "MEM_ID", updatable = false)
    private Integer memId;
    @Transient
    private MemVO memVO;

    public String getMemVO() {
        MemberService memSvc = new MemberService();
        MemVO memVO = memSvc.selectMem(memId);
        String email = memVO.getMemEmail();
        return email;
    }
}