package com.cha102.diyla.articleModel;

import java.util.List;

public interface ArtService_interface {
    public ArtVO addArt(String artTitle, String artContext, Integer memId);

    public ArtVO addArtAndPic(String artTitle, String artContext, Integer memId, byte[] artPic);

    public ArtVO addArtPic(byte[] artPic);

    public void deleteArt(Integer artNo);


    ArtVO updateArtAndPic(Integer artNo, String artTitle, byte[] artPic, String artContext, byte artStatus);

    public ArtVO updateArt(Integer artNo, String artTitle, String artContext, byte artStatus);

    public ArtVO updateArtStatus(byte artStatus, Integer artNo);

    public List<ArtVO> getArtByMemId(Integer memId);

    public ArtVO getArtByArtNo(Integer artNo);

    public List<ArtVO> getAllArt();

    public List<ArtVO> getAllNoCheckArt();

    public List<ArtVO> getAllCheckArt();

}
