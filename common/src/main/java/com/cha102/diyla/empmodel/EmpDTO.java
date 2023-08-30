package com.cha102.diyla.empmodel;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

import javax.persistence.*;

@Getter
@Setter
@ToString
@NoArgsConstructor
public class EmpDTO implements java.io.Serializable {

    private Integer empId;
    private String empName;
    private byte[] empPic;
    private String empAccount;
    private String empPassword;
    private String empEmail;
    private String typeFun;
    private String typeFunChinese;
    private Boolean empStatus;



    public EmpDTO(Object[] objects){
        this.empId = (Integer) objects[0];
        this.empName = (String) objects[1];
        this.empPic = (byte[]) objects[2];
        this.empEmail = (String) objects[3];
        this.typeFun = (String) objects[4];
        this.empStatus = String.valueOf((Byte) objects[5]).equalsIgnoreCase("1");
    }

}

