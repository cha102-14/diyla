package com.cha102.diyla.member;

import java.sql.Date;

public class MemVO implements java.io.Serializable{
	private Integer memId;
	private String memName;
	private String memEmail;
	private String memPassword;
	private String memPhone;
	private Date memBirthday;
	private Integer memGender;
	private String memAddress;
	private Integer memStatus;
	private Integer memToken;
	private Date memDate;
	private Integer blacklistCom;
	private Integer blacklistArt;
	private Integer blacklistDiy;
	private Integer blacklistClass;

	private Integer rpmsgCount;

	public Integer getMemId() {
		return memId;
	}
	public void setMemId(Integer memId) {
		this.memId = memId;
	}
	public String getMemName() {
		return memName;
	}
	public void setMemName(String memName) {
		this.memName = memName;
	}
	public String getMemEmail() {
		return memEmail;
	}
	public void setMemEmail(String memEmail) {
		this.memEmail = memEmail;
	}
	public String getMemPassword() {
		return memPassword;
	}
	public void setMemPassword(String memPassword) {
		this.memPassword = memPassword;
	}
	public String getMemPhone() {
		return memPhone;
	}
	public void setMemPhone(String memPhone) {
		this.memPhone = memPhone;
	}
	public Date getMemBirthday() {
		return memBirthday;
	}
	public void setMemBirthday(Date memBirthday) {
		this.memBirthday = memBirthday;
	}
	public Integer getMemGender() {
		return memGender;
	}
	public void setMemGender(Integer memGender) {
		this.memGender = memGender;
	}
	public String getMemAddress() {
		return memAddress;
	}
	public void setMemAddress(String memAddress) {
		this.memAddress = memAddress;
	}
	public Integer getMemStatus() {
		return memStatus;
	}
	public void setMemStatus(Integer memStatus) {
		this.memStatus = memStatus;
	}
	public Integer getMemToken() {
		return memToken;
	}
	public void setMemToken(Integer memToken) {
		this.memToken = memToken;
	}
	public Date getMemDate() {
		return memDate;
	}
	public void setMemDate(Date memDate) {
		this.memDate = memDate;
	}
	public Integer getBlacklistCom() {
		return blacklistCom;
	}
	public void setBlacklistCom(Integer blacklistCom) {
		this.blacklistCom = blacklistCom;
	}
	public Integer getBlacklistArt() {
		return blacklistArt;
	}
	public void setBlacklistArt(Integer blacklistArt) {
		this.blacklistArt = blacklistArt;
	}
	public Integer getBlacklistDiy() {
		return blacklistDiy;
	}
	public void setBlacklistDiy(Integer blacklistDiy) {
		this.blacklistDiy = blacklistDiy;
	}
	public Integer getBlacklistClass() {
		return blacklistClass;
	}
	public void setBlacklistClass(Integer blacklistClass) {
		this.blacklistClass = blacklistClass;
	}
	public Integer getRpmsgCount() {
		return rpmsgCount;
	}
	public void setRpmsgCount(Integer rpmsgCount) {
		this.rpmsgCount = rpmsgCount;
	}

	
	
	

	
}
