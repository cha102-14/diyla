package com.cha102.diyla.util;

import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;

import java.util.List;

public class JedisNotice {

    private static JedisPool pool = JedisPoolUtil.getJedisPool();

    public  static List<String> getJedisNotice(Integer memId){
        String key = String.valueOf(memId);
        Jedis jedis = null;
        jedis = pool.getResource();
        List<String> data = jedis.lrange(key,0,-1);
        jedis.close();
        return data;
    }
    public static void setJedisNotice(Integer memId,String forum){
        Jedis jedis = pool.getResource();
        jedis.rpush(String.valueOf(memId),forum);
        jedis.close();
    }

    public static void delJedisNotice(Integer memId){
        Jedis jedis =pool.getResource();
        jedis.del(String.valueOf(memId));
        jedis.close();
    }
}
