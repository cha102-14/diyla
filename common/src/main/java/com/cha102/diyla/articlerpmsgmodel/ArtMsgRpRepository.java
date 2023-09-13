package com.cha102.diyla.articlerpmsgmodel;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository
public interface ArtMsgRpRepository extends JpaRepository<ArtMsgRpVO, Integer> {
    @Transactional
    @Query(value = "select RPMSG_NO,RPMSG_CONTEXT,RPMSG_TIME,RPMSG_STATUS,amr.MEM_ID,am.MSG_Context,am.MSG_NO from  article_message_report amr join article_message am on amr.MSG_NO = am.MSG_NO;", nativeQuery = true)
    List<Object[]> getAll();

    @Transactional
    @Modifying
    @Query(value = "DELETE FROM `diyla`.`article_message_report` WHERE MSG_NO=?1", nativeQuery = true)
    void deleteAllRp(Integer msgNO);
}

