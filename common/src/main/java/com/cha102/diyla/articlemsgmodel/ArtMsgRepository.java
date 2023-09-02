package com.cha102.diyla.articlemsgmodel;


import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository
public interface ArtMsgRepository extends JpaRepository<ArtMsgVO, Integer> {
    @Query(value = "select * from ARTICLE_MESSAGE where ART_NO = ?1", nativeQuery = true)
    List<ArtMsgVO> getArtMsgByArtNo(Integer memId);
    @Transactional
    @Modifying
    @Query(value="update article_message set MSG_STATUS = 0 where MSG_NO=?1", nativeQuery = true)
    void updateStatus(Integer msgNO);

    @Transactional
    @Modifying
    @Query(value="update article_message set MSG_STATUS = 1 where MSG_NO=?1", nativeQuery = true)
    void rollbackStatus(Integer msgNO);
}


