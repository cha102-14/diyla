package com.cha102.diyla.empmodel;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
public class EmpVO implements java.io.Serializable {

    private Integer empId;
    private String empName;
    private String empAccount;
    private String empPassword;
    private Boolean empStatus;

    public EmpVO(String empName,String empAccount,String empPassword,Boolean empStatus){
        this.empName = empName;
        this.empAccount = empAccount;
        this.empPassword = empPassword;
        this.empStatus = empStatus;

    }
    public EmpVO(String empName,String empAccount,String empPassword,Boolean empStatus, Integer empId){
        this.empName = empName;
        this.empAccount = empAccount;
        this.empPassword = empPassword;
        this.empStatus = empStatus;
        this.empId =empId;
    }

}

