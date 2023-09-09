package com.cha102.diyla.front.controller.art;

import com.cha102.diyla.articleModel.ArtService;
import com.cha102.diyla.articleModel.ArtVO;
import org.springframework.stereotype.Component;
import redis.clients.jedis.Jedis;

import javax.annotation.PostConstruct;
import java.util.Base64;
import java.util.List;

@Component
public class DataImportToRedis {

    ArtService artService = new ArtService();

    @PostConstruct
    public void importDataToRedis() {
        Jedis jedis = new Jedis("localhost", 6379);

        List<ArtVO> datas = artService.getAllArt();

        for (ArtVO data : datas) {
            jedis.set("art:" + data.getArtNo(), Base64.getEncoder().encodeToString(data.getArtPic()));
        }

        jedis.close();

    }
}
