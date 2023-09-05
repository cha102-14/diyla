package com.cha102.diyla.member;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

public interface MemJPADAO extends JpaRepository<MemSpringVO, Long> {

    @Query(nativeQuery = true, value = "SELECT COUNT(1) FROM MEMBER WHERE MEM_ID")
    int getMemListCount();

    @Query(nativeQuery = true, value = "SELECT mem_id,mem_name,mem_email,mem_phone,blacklist_art from member where if ('' !='',mem_email = ?3,1=1)order by mem_id limit ?1,?2")
    List<Object[]> getAllMem(Integer pageIndex, Integer pageSize,String memEmail );


    @Transactional
    @Modifying
    @Query(nativeQuery = true,
           value = "UPDATE diyla.member SET BLACKLIST_ART =:blacklistArt WHERE MEM_ID =:memId")
    int changeMemStatus(@Param("memId") Integer memId, @Param("blacklistArt") Integer blacklistArt);

//    @Query(nativeQuery = true,
//           value = "SELECT mem_id,mem_name,mem_email,mem_phone,blacklist_art from member where mem_email = ?1")
//    MemSpringVO returnMemInformation(String memEmail);
}
