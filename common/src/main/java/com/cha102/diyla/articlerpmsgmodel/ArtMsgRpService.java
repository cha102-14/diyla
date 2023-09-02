package com.cha102.diyla.articlerpmsgmodel;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Service
public class ArtMsgRpService {
    @Autowired
    ArtMsgRpRepository artMsgRpRepository;

    public ArtMsgRpService() {
    }


    public void addArtMsg(ArtMsgRpVO artMsgRpVO) {
        artMsgRpRepository.save(artMsgRpVO);
    }

    public void updateArtMsg(ArtMsgRpVO artMsgRpVO) {
        artMsgRpRepository.save(artMsgRpVO);
    }

    public void deleteArtMsg(Integer artMsgRpNo) {
        if (artMsgRpRepository.existsById(artMsgRpNo))
            artMsgRpRepository.deleteById(artMsgRpNo);
    }

    public ArtMsgRpVO getOneArtMsg(Integer artMsgRpNo) {
        Optional<ArtMsgRpVO> optional = artMsgRpRepository.findById(artMsgRpNo);
        return optional.orElse(null);
    }

    public List<ArtMsgRpVO> getAll() {
        return artMsgRpRepository.findAll();
    }

    public List<ArtDTO> getAllDTO() {
        List<Object[]> r = artMsgRpRepository.getAll();
        List<ArtDTO> dto = r.stream().map(ArtDTO::new).collect(Collectors.toList());
        return dto;
    }
}

