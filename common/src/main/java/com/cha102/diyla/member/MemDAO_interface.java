package com.cha102.diyla.member;

import java.util.List;

public interface MemDAO_interface {
	
	public void insert(MemVO memVo);
	public void delete(Integer mem_id);
	public void update(MemVO memvo);

	public void updatePw(String newPassword,String email);

	public MemVO findByPrimaryKey(Integer mem_id);
	public List<MemVO> getAll();

	public MemVO selectLogin(String memEmail,String memPassword);

	public MemVO selectPw(String memEmail,String memPhone);

	public void updateStatus(String email);
	
	
}
