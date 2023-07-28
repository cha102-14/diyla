package com.cha102.diyla.member;

import java.sql.Date;

public class MemVo implements java.io.Serializable{
	private Integer mem_id;
	private String mem_name;
	private String mem_email;
	private String mem_password;
	private String mem_phone;
	private Date mem_birthday;
	private Integer mem_gender;
	private String mem_address;
	private Integer mem_status;
	private Integer mem_token;
	private Date mem_date;
	private Integer blacklist_com;
	private Integer blacklist_art;
	private Integer blacklist_diy;
	private Integer blacklist_class;
	private Integer rpmsg_count;
	
	public Integer getMem_id() {
		return mem_id;
	}
	
	public void setMem_id(Integer mem_id) {
		this.mem_id = mem_id;
	}
	
	public String getMem_name() {
		return mem_name;
	}
	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}
	public String getMem_email() {
		return mem_email;
	}
	public void setMem_email(String mem_email) {
		this.mem_email = mem_email;
	}
	public String getMem_password() {
		return mem_password;
	}
	public void setMem_password(String mem_password) {
		this.mem_password = mem_password;
	}
	public String getMem_phone() {
		return mem_phone;
	}
	public void setMem_phone(String mem_phone) {
		this.mem_phone = mem_phone;
	}
	public Date getMem_birthday() {
		return mem_birthday;
	}
	public void setMem_birthday(Date mem_birthday) {
		this.mem_birthday = mem_birthday;
	}
	public Integer getMem_gender() {
		return mem_gender;
	}
	public void setMem_gender(Integer mem_gender) {
		this.mem_gender = mem_gender;
	}
	public String getMem_address() {
		return mem_address;
	}
	public void setMem_address(String mem_address) {
		this.mem_address = mem_address;
	}
	public Integer getMem_status() {
		return mem_status;
	}
	public void setMem_status(Integer mem_status) {
		this.mem_status = mem_status;
	}
	public Integer getMem_token() {
		return mem_token;
	}
	public void setMem_token(Integer mem_token) {
		this.mem_token = mem_token;
	}
	public Date getMem_date() {
		return mem_date;
	}
	public void setMem_date(Date mem_date) {
		this.mem_date = mem_date;
	}
	public Integer getBlacklist_com() {
		return blacklist_com;
	}
	public void setBlacklist_com(Integer blacklist_com) {
		this.blacklist_com = blacklist_com;
	}
	public Integer getBlacklist_art() {
		return blacklist_art;
	}
	public void setBlacklist_art(Integer blacklist_art) {
		this.blacklist_art = blacklist_art;
	}
	public Integer getBlacklist_diy() {
		return blacklist_diy;
	}
	public void setBlacklist_diy(Integer blacklist_diy) {
		this.blacklist_diy = blacklist_diy;
	}
	public Integer getBlacklist_class() {
		return blacklist_class;
	}
	public void setBlacklist_class(Integer blacklist_class) {
		this.blacklist_class = blacklist_class;
	}
	public Integer getRpmsg_count() {
		return rpmsg_count;
	}
	public void setRpmsg_count(Integer rpmsg_count) {
		this.rpmsg_count = rpmsg_count;
	}

	
	
	

	
}
