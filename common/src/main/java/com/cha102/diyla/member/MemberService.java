package com.cha102.diyla.member;

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

		if (mem_name == null || (mem_name.trim()).length()==0){
			exMsgs.add("請輸入姓名");
		}

		if (mem_email == null || (mem_email.trim()).length()==0){
			exMsgs.add("請輸入信箱");
		}
//		if (mem_email.equals()){
//			exMsgs.add("此信箱已註冊");
//		}
		//		EmailValidator emailValidator = EmailValidator.getInstance();
//		if(!emailValidator.isValid(mem_email)){
//			exMsgs.add("信箱格式錯誤，請重新輸入");
//		}

		if (mem_password == null || (mem_password.trim()).length()==0){
			exMsgs.add("請輸入密碼");
		}
		String pwReg = "^\\w{6,12}$";
		if (!(mem_password.matches(pwReg))){
			exMsgs.add("密碼格式錯誤，請重新輸入");
		}

		if (mem_phone == null || (mem_phone.trim()).length()==0){
			exMsgs.add("請輸入電話");
		}
		String phoneReg ="^\\d{10,}$";
		if(!(mem_phone.matches(phoneReg))){
			exMsgs.add("電話格式錯誤，請重新輸入");
		}

//		if (mem_birthday == null){
//			exMsgs.add("請輸入生日");
//		}



		if (mem_gender == null){
			exMsgs.add("請輸入性別");
		}

		if (mem_address == null || (mem_phone.trim()).length()==0){
			exMsgs.add("請輸入地址");
		}
		dao.insert(mem);
		return mem;

//		保留正確的資訊
//		信箱不能重複

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
	
	public void deletMem(Integer memId) {
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

		if(email == null || (email.trim()).isEmpty()){
			exMsgs.add("請輸入信箱");
		}
		if(password == null || (password.trim()).isEmpty()){
			exMsgs.add("請輸入密碼");
		}
		if(mem ==null){
			exMsgs.add("無此信箱或密碼錯誤");
		}

//		EmailValidator emailValidator = EmailValidator.getInstance();
//		if (!emailValidator.isValid(email)){
//			exMsgs.add("格式錯誤，請重新輸入");
//		}


		return mem;

	}

//	public boolean email(String email){
//		L
//	}


}
