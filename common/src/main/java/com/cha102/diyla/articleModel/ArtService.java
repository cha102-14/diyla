package com.cha102.diyla.articleModel;

import java.util.List;

public class ArtService implements ArtService_interface {

    private ArtDAO_interface dao;

    public ArtService() {
        dao = new ArtDAO();
    }

    @Override
    public ArtVO addArt(String artTitle, String artContext, Integer memId) {
        ArtVO artVO = new ArtVO();
        artVO.setArtTitle(artTitle);
        artVO.setArtContext(artContext);
        artVO.setMemId(memId);

        dao.insert(artVO);

        return artVO;
    }

    public ArtVO addArtAndPic(String artTitle, String artContext, Integer memId, byte[] artPic) {
        ArtVO artVO = new ArtVO();
        artVO.setArtTitle(artTitle);
        artVO.setArtContext(artContext);
        artVO.setMemId(memId);
        artVO.setArtPic(artPic);

        dao.insert(artVO);

        return artVO;
    }

    @Override
    public ArtVO addArtPic(byte[] artPic) {
        ArtVO artVO = new ArtVO();
        artVO.setArtPic(artPic);

        dao.insert(artVO);

        return artVO;
    }

    @Override
    public void deleteArt(Integer artNo) {
        dao.deleteById(artNo);
    }

    @Override
    public ArtVO updateArtAndPic(Integer artNo, String artTitle, byte[] artPic, String artContext, byte artStatus) {
        ArtVO artVO = new ArtVO();
        artVO.setArtTitle(artTitle);
        artVO.setArtPic(artPic);
        artVO.setArtContext(artContext);
        artVO.setArtStatus(artStatus);
        artVO.setArtNo(artNo);

        dao.update(artVO);
        return artVO;
    }

    @Override
    public ArtVO updateArt(Integer artNo, String artTitle, String artContext, byte artStatus) {
        ArtVO artVO = new ArtVO();
        artVO.setArtTitle(artTitle);
        artVO.setArtContext(artContext);
        artVO.setArtStatus(artStatus);
        artVO.setArtNo(artNo);

        dao.update(artVO);
        return artVO;
    }


    @Override
    public ArtVO updateArtStatus(byte artStatus, Integer artNo) {
        ArtVO artVO = new ArtVO();
        artVO.setArtNo(artNo);
        artVO.setArtStatus(artStatus);

        dao.updateStatus(artVO);
        return artVO;
    }

    @Override
    public List<ArtVO> getArtByMemId(Integer memId) {
        return dao.findByMemId(memId);
    }

    public ArtVO getArtByArtNo(Integer artNo) {
        return dao.findByArtNo(artNo);
    }

    @Override
    public List<ArtVO> getAllArt() {
        return dao.getAll();
    }

    public List<ArtVO> getAllNoCheckArt() {
        return dao.getAllNoCheck();
    }


}
