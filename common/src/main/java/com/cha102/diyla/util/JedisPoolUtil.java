package com.cha102.diyla.util;

import redis.clients.jedis.JedisPool;
import redis.clients.jedis.JedisPoolConfig;

public class JedisPoolUtil {
    private static JedisPool pool = null;

    private JedisPoolUtil() {
    }

    public static JedisPool getJedisPool() {
        if (pool == null) {
            synchronized (JedisPoolUtil.class) {
                if (pool == null) {  //兩次驗證是因為考量第一次初始化的時候
                    JedisPoolConfig config = new JedisPoolConfig();
                    config.setMaxTotal(8);
                    config.setMaxIdle(8);
                    config.setMaxWaitMillis(10000);
                    pool = new JedisPool(config, "localhost", 6379);
                }
            }
        }
        return pool;
    }

    // 可在ServletContextListener的contextDestroyed裡呼叫此方法註銷Redis連線池
    public static void shutdownJedisPool() {
        if (pool != null)
            pool.destroy();
    }

}
