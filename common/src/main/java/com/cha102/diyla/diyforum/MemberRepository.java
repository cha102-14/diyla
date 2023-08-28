package com.cha102.diyla.diyforum;

import org.springframework.data.jpa.repository.JpaRepository;

public interface MemberRepository  extends JpaRepository<MemberEntity,Integer>{
}
//創建實體後 再用 MemberRepository 去繼承JpaRepository 就可以取代DAO