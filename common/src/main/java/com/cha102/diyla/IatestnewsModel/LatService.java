package com.cha102.diyla.IatestnewsModel;

import java.util.List;

public class LatService {
    private LatDAO_interface dao;

    public LatService() {
        dao = new LatDAO();
    }

    public LatestnewsVO addLat(LatestnewsVO latestnewsVO) {

        dao.insert(latestnewsVO);

        return latestnewsVO;
    }

    public LatestnewsVO updateLat(LatestnewsVO latestnewsVO) {


        dao.update(latestnewsVO);
        return latestnewsVO;
    }

    public void deleteLat(Integer newsNo) {
        dao.delete(newsNo);
    }

    public LatestnewsVO getOneLat(Integer newsNo) {
        return dao.findByPrimaryKey(newsNo);
    }

    public List<LatestnewsVO> getAll() {
        return dao.getAll();
    }

    public List<LatestnewsVO> getAllShowCheck() {
        return dao.getAllShowCheck();
    }

}
