package com.cha102.diyla.diyreserveresult;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.util.Date;
@Data
@AllArgsConstructor
@NoArgsConstructor
public class DIYReserveVO implements Serializable{

    @JsonFormat(pattern = "yyyy-MM-dd")
    private Date diyReserveDate;
    private int diyPeriod;
    private long itemQuantity;
}
