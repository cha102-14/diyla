package com.cha102.diyla.backstagefunmodel;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

import javax.persistence.*;

@Getter
@Setter
@ToString
@NoArgsConstructor
// 宣告為實體(@Entity)
@Entity
// 對應資料庫表名稱
@Table(name="backstage_fun")
public class BackStageFunVO implements java.io.Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "AUTH_ID")
    private Integer authId;
    @Column(name = "AUTH_FUN")
    private String authFun;
    @Column(name = "TYPE_FUN")
    private String typeFun;
}
