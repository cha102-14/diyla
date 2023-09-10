package com.cha102.diyla.empmodel;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class EmpAccountAO {
    private String empAccount;
    private String empPassword;
    private String doubleCheckPassword;
    private String valid;

}
