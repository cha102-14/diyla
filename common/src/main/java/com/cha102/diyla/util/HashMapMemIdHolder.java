package com.cha102.diyla.util;

import com.cha102.diyla.member.MemVO;

import java.util.HashMap;

public class HashMapMemIdHolder {

    public static final HashMap<String, Integer> HOLDER = new HashMap<>();

    public void put(String key, Integer memId) {
        HOLDER.put(key, memId);
    }

    public Integer get(String key) {
        return HOLDER.get(key);
    }

    public void remove(String key) {
        HOLDER.remove(key);
    }
}
