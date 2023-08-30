package com.cha102.diyla.util;

import com.cha102.diyla.member.MemVO;

import java.util.HashMap;

public class HashMapMemHolder implements MemberHolder{

    public static final HashMap<String, MemVO> HOLDER = new HashMap<>();

    @Override
    public void put(String key, MemVO memVO) {
        HOLDER.put(key, memVO);
    }

    @Override
    public MemVO get(String key) {
        return HOLDER.get(key);
    }

    @Override
    public void remove(String key) {
        HOLDER.remove(key);
    }
}
