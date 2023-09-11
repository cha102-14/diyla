package com.cha102.diyla.noticeModel;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository
public interface NoticeRepository extends JpaRepository<NoticeVO,Integer> {

    List<NoticeVO> findAllByMemIdOrderByNoticeTimeDesc(Integer menId);
    @Transactional
    @Modifying
    @Query(value="UPDATE notice SET `NOTICE_STATUS` = '1' WHERE NOTICE_NO = ?1", nativeQuery = true)
    void updateStatus(Integer noticeNo);
}
