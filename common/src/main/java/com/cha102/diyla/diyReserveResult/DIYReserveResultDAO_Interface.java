package com.cha102.diyla.diyReserveResult;

import java.util.List;

public interface DIYReserveResultDAO_Interface {
	public void insert(DIYReserveResultDAO LatestnewsVO);
    public void update(DIYReserveResultDAO LatestnewsVO);
    public void delete(Integer newsNo);
    public DIYReserveResultDAO findByPrimaryKey(Integer newsNo);
    public List<DIYReserveResultDAO> getAll();
}