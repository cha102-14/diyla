package com.cha102.diyla.noticeModel;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class NoticeService {
    @Autowired
    private NoticeRepository noticeRepository;

    public NoticeService(){}

    public NoticeService(NoticeRepository noticeRepository) {
        this.noticeRepository = noticeRepository;
    }

    public List<NoticeVO> findAllByMemId(Integer memId) {

        return  noticeRepository.findAllByMemIdOrderByNoticeTimeDesc(memId);
    }

    public void saveNotice(List<NoticeVO> noticeVOS) {
        noticeRepository.saveAll(noticeVOS);
    }

    public void addNotice(NoticeVO noticeVO){
        noticeRepository.save(noticeVO);
    }
}
