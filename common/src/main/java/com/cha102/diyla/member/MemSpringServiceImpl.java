package com.cha102.diyla.member;

import com.alibaba.fastjson.JSONObject;
import com.cha102.diyla.empmodel.EmpDTO;
import com.cha102.diyla.enums.AuthFunEnum;
import com.cha102.diyla.noticeModel.NoticeService;
import com.cha102.diyla.noticeModel.NoticeVO;
import com.cha102.diyla.util.JedisNotice;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.ObjectUtils;
import redis.clients.jedis.Jedis;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class MemSpringServiceImpl implements MemSpringService {

    @Autowired
    private MemJPADAO memJPADAO;

    @Autowired
    private NoticeService noticeService;

    @Override
    public String getAllMem(JSONObject jsonObject) {
        int pageIndex = jsonObject.getIntValue("pageIndex");
        int pageSize = jsonObject.getIntValue("pageSize");
        String memEmail = jsonObject.getString("memEmail");
        Integer allMemCount = 1;
        List<Object[]> allMemObjArr = memJPADAO.getAllMem(pageSize * (pageIndex - 1), pageSize, memEmail);
        List<MemDTO> memDTOList = allMemObjArr.stream().map(MemDTO::new).collect(Collectors.toList());
        if (ObjectUtils.isEmpty(memEmail)) {
            allMemCount = memJPADAO.getMemListCount();
        }
        JSONObject returnJSONObject = new JSONObject();
        returnJSONObject.put("totalSize", allMemCount);
        returnJSONObject.put("memList", memDTOList);
        return JSONObject.toJSONString(returnJSONObject);
    }

    @Override
    public String changeMemStatus(JSONObject jsonObject) {
        int memId = jsonObject.getIntValue("memId");
//        Boolean memCurrentState = memJPADAO.getMemStatus(memId);
//        TODO 查詢到當前會員狀態後顯示相對應狀態在查詢會員修改頁面
        Boolean memStatus = jsonObject.getBooleanValue("memStatus");
        int changeMemArtStatus = memJPADAO.changeMemStatus(memId, jsonObject.getIntValue("memStatus"));
        JSONObject returnJSONObject = new JSONObject();
        returnJSONObject.put("memStatus", memStatus);
        if (changeMemArtStatus > 0) {
//            討論區滿三次會寫入黑名單通知進Redis
//            同時key: memId Value: Black 寫入 Redis
//            新增個人通知
            NoticeVO noticeVO = new NoticeVO();
            noticeVO.setNoticeTitle("您的討論區功能已能正常使用，請謹守討論區使用規範");
            noticeVO.setMemId(memId);
            noticeService.addNotice(noticeVO);
//            存入Redis

            JedisNotice.setJedisNotice(memId, "addArtMsg");
            return JSONObject.toJSONString(returnJSONObject);
        } else {
            return "";
        }
    }

//    @Override
//    public String returnMemInformation(JSONObject jsonObject) {
//        String memEmail = jsonObject.getString("memEmail");
//        MemSpringVO memInformation = memJPADAO.returnMemInformation(memEmail);
//        return memInformation.toString();
//    }
}
