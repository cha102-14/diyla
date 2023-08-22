package com.cha102.diyla.member;

import org.apache.commons.validator.routines.EmailValidator;

import java.sql.Date;
import java.util.List;

public class MemberService {
	private MemDAO_interface dao;
	
	public MemberService() {

		dao = new MemDAO();
	}
	
	public MemVO addMem(List<String> exMsgs,String mem_name,String mem_email,String mem_password,String mem_phone,java.sql.Date mem_birthday,Integer mem_gender,String mem_address) {
		MemVO mem = new MemVO();
		mem.setMemName(mem_name);
		mem.setMemEmail(mem_email);
		mem.setMemPassword(mem_password);
		mem.setMemPhone(mem_phone);
		mem.setMemBirthday(mem_birthday);
		mem.setMemGender(mem_gender);
		mem.setMemAddress(mem_address);
		String nameReg = "^[(\u4e00-\u9fa5)(a-zA-Z0-9_)]{2,10}$";
		if (mem_name == null || (mem_name.trim()).length()==0){
			exMsgs.add("請輸入姓名");
		}else if (!(mem_name.matches(nameReg))){
			exMsgs.add("姓名格式只能為中、英文字母、數字和_ , 且長度必需在2到10之間");
		}
		EmailValidator emailValidator = EmailValidator.getInstance();

		if (mem_email == null || (mem_email.trim()).length()==0){
			exMsgs.add("請輸入信箱");
		} else if (!emailValidator.isValid(mem_email)){
			exMsgs.add("信箱格式錯誤，請重新輸入");
		}
		String pwReg = "^\\w{6,12}$";
		if (mem_password == null || (mem_password.trim()).length()==0){
			exMsgs.add("請輸入密碼");
		} else if (!(mem_password.matches(pwReg))){
			exMsgs.add("密碼格式錯誤，請重新輸入");
		}
		String phoneReg ="^\\d{10,}$";
		if (mem_phone == null || (mem_phone.trim()).length()==0){
			exMsgs.add("請輸入電話");
		} else if(!(mem_phone.matches(phoneReg))){
			exMsgs.add("電話格式錯誤，請重新輸入");
		}

		if (mem_gender == null){
			exMsgs.add("請輸入性別");
		}
		String addReg = "^[(\u4e00-\u9fa5)(a-zA-Z0-9-,)]$";
		if (mem_address == null || (mem_address.trim()).length()==0){
			exMsgs.add("請輸入地址");
		} else if (!(mem_address.matches(addReg))){
			exMsgs.add("地址格式只能為中、英文字母、數字、-和,");
		}

		MemberService memSer = new MemberService();
		List<MemVO> lists = memSer.selectAll();
		for (MemVO list: lists){
			if(mem_email.equals(list.getMemEmail())){
				exMsgs.add("該信箱已註冊");
			}
		}

		if(exMsgs.isEmpty()){
			dao.insert(mem);
		}

		return mem;


	}
	
	public MemVO updateMem(String mem_name,String mem_password,String mem_phone,String mem_address) {
		MemVO mem = new MemVO();
		mem.setMemName(mem_name);
		mem.setMemPassword(mem_password);
		mem.setMemPhone(mem_phone);
		mem.setMemAddress(mem_address);
		dao.update(mem);
		return mem;
		
	}

	public MemVO updateNewPw(List<String> exMsgs,String mem_password,String mem_email){
		MemVO mem = new MemVO();
		EmailValidator emailValidator = EmailValidator.getInstance();
		if(mem_email == null || (mem_email.trim()).isEmpty()){
			exMsgs.add("請輸入信箱");
		} else if (!emailValidator.isValid(mem_email)){
			exMsgs.add("格式錯誤，請重新輸入");
		}

		String pwReg = "^\\w{6,12}$";
		if (mem_password == null || (mem_password.trim()).length()==0){
			exMsgs.add("請輸入密碼");
		} else if (!(mem_password.matches(pwReg))){
			exMsgs.add("密碼格式錯誤，請重新輸入");
		}
		mem.setMemPassword(mem_password);
		mem.setMemEmail(mem_email);
		if (exMsgs.isEmpty()){
			dao.updatePw(mem_password,mem_email);
		}

		return mem;
	}
	
	public void deleteMem(Integer memId) {
		dao.delete(memId);
	}
	
	public MemVO selectMem(Integer memId) {
		MemVO mem = new MemVO();
		dao.findByPrimaryKey(memId);
		return mem;
	}
	
	public List<MemVO> selectAll(){
		return dao.getAll();
	}

	public MemVO login(List<String> exMsgs,String email, String password){
		MemVO mem = dao.selectLogin(email,password);
		EmailValidator emailValidator = EmailValidator.getInstance();
		if(email == null || (email.trim()).isEmpty()){
			exMsgs.add("請輸入信箱");
		} else if (!emailValidator.isValid(email)){
			exMsgs.add("格式錯誤，請重新輸入");
		}
		if(password == null || (password.trim()).isEmpty()){
			exMsgs.add("請輸入密碼");
		}
		if(mem ==null){
			exMsgs.add("無此信箱或密碼錯誤");
		}

		if(mem.getMemStatus()==0){
			exMsgs.add("因您的信箱尚未認證，請至您的信箱確認");
		}

		return mem;

	}

	public MemVO forgetPw(List<String> exMsgs,String email, String phone){
		MemVO mem = dao.selectPw(email,phone);
		EmailValidator emailValidator = EmailValidator.getInstance();
		if(email == null || (email.trim()).isEmpty()){
			exMsgs.add("請輸入信箱");
		} else if (!emailValidator.isValid(email)){
			exMsgs.add("格式錯誤，請重新輸入");
		}
		String phoneReg ="^\\d{10,}$";
		if(phone == null || (phone.trim()).isEmpty()){
			exMsgs.add("請輸入電話");
		} else if(!(phone.matches(phoneReg))){
			exMsgs.add("電話格式錯誤，請重新輸入");
		}
		if(mem ==null){
			exMsgs.add("無此信箱或電話錯誤");
		}

		return mem;

	}


}
