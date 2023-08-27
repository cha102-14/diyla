package com.cha102.diyla.empmodel;

import com.mysql.cj.x.protobuf.MysqlxDatatypes;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;
import org.springframework.util.ObjectUtils;

import javax.persistence.*;
import javax.swing.*;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

@Getter
@Setter
@ToString
@NoArgsConstructor
// 宣告為實體(@Entity)
@Entity
// 類別名稱若要取跟資料庫相對應Table不同 就要使用Table註冊name , 預設為將類別名稱視為與Table Name同名
@Table(name="employee")
// 啟用稽核(Auditing)的實體中都必須註冊這個 Listener，否則是沒有效果
//@EntityListeners(AuditingEntityListener.class)
//如有註冊@EntityListeners SpringBootWebApplication
public class EmpVO implements java.io.Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "EMP_ID")
    private Integer empId;
    @Column(name = "EMP_NAME")
    private String empName;
    @Column(name = "EMP_ACCOUNT")
    private String empAccount;
    @Column(name = "EMP_PASSWORD")
    private String empPassword;
    @Column(name = "EMP_EMAIL")
    private String empEmail;
    @Column(name = "EMP_STATUS")
    private Boolean empStatus;

    public EmpVO(String empName, String empAccount, String empPassword, String empEmail, Boolean empStatus){
        this.empName = empName;
        this.empAccount = empAccount;
        this.empPassword = empPassword;
        this.empEmail = empEmail;
        this.empStatus = empStatus;

    }
    public EmpVO(String empName,String empAccount,String empPassword,String empEmail,Boolean empStatus, Integer empId){
        this.empName = empName;
        this.empAccount = empAccount;
        this.empPassword = empPassword;
        this.empEmail = empEmail;
        this.empStatus = empStatus;
        this.empId =empId;
    }

    public EmpVO(Object[] objects){
        this.empId = (Integer) objects[0];
        this.empName = (String) objects[1];
        this.empEmail = (String) objects[2];
        this.empStatus = Boolean.valueOf((String) objects[3]);
    }
}

