package com.cha102.diyla.member;

import java.util.List;

public interface MemDAO_interface {
	
	public void insert(MemVo memVo);
	public void delete(Integer mem_id);
	public void update(MemVo memvo);
	public MemVo findByPrimaryKey(Integer mem_id);
	public List<MemVo> getAll();
	
	
}
