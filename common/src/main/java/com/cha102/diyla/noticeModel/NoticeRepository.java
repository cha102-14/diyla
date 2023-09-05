package com.cha102.diyla.noticeModel;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface NoticeRepository extends JpaRepository<NoticeVO,Integer> {

    List<NoticeVO> findAllByMemIdOrderByNoticeTimeDesc(Integer menId);


}
