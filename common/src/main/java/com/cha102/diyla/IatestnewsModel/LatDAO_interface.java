package com.cha102.diyla.IatestnewsModel;

import java.util.List;

public interface LatDAO_interface {
	public void insert(LatestnewsVO LatestnewsVO);
    public void update(LatestnewsVO LatestnewsVO);
    public void delete(Integer newsNo);
    public LatestnewsVO findByPrimaryKey(Integer newsNo);
    public List<LatestnewsVO> getAll();
    public List<LatestnewsVO> getAllShowCheck();
}
