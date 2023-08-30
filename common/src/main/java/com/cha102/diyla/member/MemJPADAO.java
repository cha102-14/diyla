package com.cha102.diyla.member;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface MemJPADAO extends JpaRepository<MemSpringVO,Integer> {

    @Query(nativeQuery = true,value = "SELECT COUNT(1) FROM MEMBER WHERE MEM_ID")
    int getMemListCount();
    @Query(nativeQuery = true, value = "SELECT mem_id,mem_name,mem_email,mem_phone,mem_status,blacklist_art from member order by mem_id limit ?1,?2")
    List<Object[]> getAllMem(Integer pageIndex, Integer pageSize);

}
