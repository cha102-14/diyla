package com.cha102.diyla.commodityModel;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Data
@Entity
@Table(name = "commodity")
@Getter
@Setter
public class Commodity {
	@Id
	@Column(name = "COM_NO")
	private Integer comNO;
	@Column(name = "COM_CLASS_NO")
	private Integer comClassNo;
	@Column(name = "COM_NAME")
	private String comName;
	@Column(name = "COM_PIC")
	private byte[] comPic;
	@Transient
	private String showPic;
	@Column(name = "COM_DEC")
	private String comDes;
	@Column(name = "COM_PRI")
	private Integer comPri;
	@Column(name = "COM_QUA")
	private Integer comQua;
	@Column(name = "COM_STATE")
	private Integer comState;
	@Column(name = "COMMENT_TOTAL")
	private Integer commentTotal;
	@Column(name = "RATING_SUM")
	private Integer ratingSum;
	@Column(name = "UPDATE_TIME", columnDefinition = "TIMESTAMP  DEFAULT CURRENT_TIMESTAMP")
	private Timestamp updateTime;
}
