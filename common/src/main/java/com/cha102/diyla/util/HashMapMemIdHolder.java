package com.cha102.diyla.util;

import com.cha102.diyla.member.MemVO;

import java.util.HashMap;

public class HashMapMemIdHolder {

    public static final HashMap<String, Integer> HOLDER = new HashMap<>();
    public static final HashMap<String, String> SESSIONHOLDER = new HashMap<>();

    public void put(String key, Integer memId) {
        HOLDER.put(key, memId);
    }
    public void put(String jsessionidKey, String jsessionid) {
    	SESSIONHOLDER.put(jsessionidKey, jsessionid);
    }

    public Integer get(String key) {
        return HOLDER.get(key);
    }
    public String getj(String key) {
    	return SESSIONHOLDER.get(key);
    }

    public void remove(String key) {
        HOLDER.remove(key);
    }
}
