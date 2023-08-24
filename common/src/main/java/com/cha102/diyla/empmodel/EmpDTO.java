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
    private String empAccount;
    private String empPassword;
    private String empEmail;
    private String typeFun;
    private Boolean empStatus;



    public EmpDTO(Object[] objects){
        this.empId = (Integer) objects[0];
        this.empName = (String) objects[1];
        this.empEmail = (String) objects[2];
        this.typeFun = (String) objects[3];
        this.empStatus = String.valueOf((Byte) objects[4]).equalsIgnoreCase("1");
    }
}

