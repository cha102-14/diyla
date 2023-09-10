package com.cha102.diyla.diycatemodel;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
public interface DiyCateRepository extends JpaRepository<DiyCateEntity, Integer> {
	
	@Transactional
	@Query(value="SELECT * FROM diyla.diy_cate where DIY_STATUS = 0", nativeQuery = true)
    List<DiyCateEntity> findAllPutOn();

}
