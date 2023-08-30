package com.cha102.diyla.util;

import com.cha102.diyla.member.MemVO;
import com.google.gson.Gson;
import redis.clients.jedis.Jedis;

public class RedisMemberHolder implements MemberHolder {

    public static final Jedis jedis = new Jedis("127.0.0.1", 6379);

    public static final Gson gson = new Gson();


    @Override

    public void put(String key, MemVO memVO) {
        jedis.set(key, gson.toJson(memVO));
    }

    @Override
    public MemVO get(String key) {
        return  gson.fromJson(jedis.get(key), MemVO.class);
    }

    @Override
    public void remove(String key) {
        jedis.del(key);
    }
}
