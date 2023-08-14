package com.cha102.diyla.commonproblemmodel;

import com.cha102.diyla.IatestnewsModel.LatestnewsVO;

import java.util.List;

public interface PbmDAO_interface {
    public void insert(PbmVO PbmVO);
    public void update(PbmVO PbmVO);
    public void delete(Integer pbmNo);
    public PbmVO findByPrimaryKey(Integer pbmNo);
    public List<PbmVO> getAll();
}
