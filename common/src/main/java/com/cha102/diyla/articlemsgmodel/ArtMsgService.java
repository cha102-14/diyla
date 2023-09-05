package com.cha102.diyla.articlemsgmodel;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class ArtMsgService {
    @Autowired
    ArtMsgRepository artMsgRepository;

    public ArtMsgService() {
    }


    public void addArtMsg(ArtMsgVO artMsgVO) {
        artMsgRepository.save(artMsgVO);
    }

    public void updateArtMsg(ArtMsgVO artMsgVO) {
        artMsgRepository.save(artMsgVO);
    }

    public void deleteArtMsg(Integer artMsgNo) {
        if (artMsgRepository.existsById(artMsgNo))
            artMsgRepository.deleteById(artMsgNo);
    }

    public ArtMsgVO getOneArtMsg(Integer msgNo) {
        Optional<ArtMsgVO> optional = artMsgRepository.findById(msgNo);
        return optional.orElse(null);
    }

    public List<ArtMsgVO> getAll() {
        return artMsgRepository.findAll();
    }

    public List<ArtMsgVO> getAllByArtNo(Integer artNo) {
        return artMsgRepository.getArtMsgByArtNo(artNo);
    }

    public void updateStatus(Integer msgNo) {
        artMsgRepository.updateStatus(msgNo);
    }
    public void rollbackStatus(Integer msgNo) {
        artMsgRepository.rollbackStatus(msgNo);
    }
}
