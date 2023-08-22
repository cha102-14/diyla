package com.cha102.diyla.util;

import com.cha102.diyla.member.MemVO;

public interface MemberHolder {

    void put(String key, MemVO memVO);

    MemVO get(String key);

    void remove(String key);


}
