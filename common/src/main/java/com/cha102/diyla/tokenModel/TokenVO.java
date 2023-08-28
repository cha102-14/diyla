package com.cha102.diyla.tokenModel;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import java.sql.Timestamp;

@Entity
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "TOKEN")
public class TokenVO {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "TOKEN_NO")
    private Integer tokenNo;
    @Column(name = "TOKEN_COUNT")
    private Integer tokenCount;
    @Column(name = "TOKEN_GETUSE")
    private Byte tokenGetUse;
    @Column(name = "TOKEN_TIME", insertable = false)
    private Timestamp tokenTime;
    @Column(name = "MEM_ID")
    private Integer memId;
}
