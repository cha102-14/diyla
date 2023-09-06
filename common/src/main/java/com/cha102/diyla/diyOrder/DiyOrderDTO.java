package com.cha102.diyla.diyOrder;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
@Getter
@Setter
@ToString
public class DiyOrderDTO {
	
	
	
	private Date diyReserveDate;
	private Integer diyPeriod;
	private Integer peopleCount;
	
	
	
	public DiyOrderDTO (Object[] objects){
        this.diyReserveDate= (Date) objects[0];
        this.diyPeriod= (Integer) objects[1];
        this.peopleCount= (Integer) objects[2];

    }



	public DiyOrderDTO() {
		
	}
	
	
	

}
