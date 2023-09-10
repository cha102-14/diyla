package com.cha102.diyla.commonproblemmodel;

import java.util.List;

public class PbmService {

    private  PbmDAO_interface dao;

    public PbmService(){
        dao = new PbmDAO();
    }

    public PbmVO addPbm(PbmVO pbmvo){
        dao.insert(pbmvo);

        return  pbmvo;
    }

    public  PbmVO updatePbm(PbmVO pbmvo){
        dao.update(pbmvo);
        return pbmvo;
    }

    public void deletePbm(Integer pbmNo){
        dao.delete(pbmNo);
    }

    public PbmVO getOnePbm(Integer pbmNo){
        return dao.findByPrimaryKey(pbmNo);
    }

    public List<PbmVO> getAll(){
        return dao.getAll();
    }
}
