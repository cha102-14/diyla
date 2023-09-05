package com.cha102.diyla.noticeModel;

import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class NoticeService {

    private NoticeRepository noticeRepository;

    public NoticeService(NoticeRepository noticeRepository) {
        this.noticeRepository = noticeRepository;
    }

    public List<NoticeVO> findAllByMemId(Integer memId) {

        return  noticeRepository.findAllByMemIdOrderByNoticeTimeDesc(memId);
    }

    public void saveNotice(List<NoticeVO> noticeVOS) {
        noticeRepository.saveAll(noticeVOS);
    }


}
