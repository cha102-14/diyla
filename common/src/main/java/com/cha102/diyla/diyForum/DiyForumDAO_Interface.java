package com.cha102.diyla.diyForum;

import java.util.List;

public interface DiyForumDAO_Interface {
	public void insert(DiyForumVO DiyForumVO);
    public void update(DiyForumVO DiyForumVO);
    public void delete(Integer artiNo);
    public DiyForumVO findByPrimaryKey(Integer artiNo);
    public List<DiyForumVO> getAll();
}