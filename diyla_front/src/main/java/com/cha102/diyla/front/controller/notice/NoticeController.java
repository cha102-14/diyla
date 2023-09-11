package com.cha102.diyla.front.controller.notice;

import com.cha102.diyla.noticeModel.NoticeService;
import com.cha102.diyla.noticeModel.NoticeVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class NoticeController {
    private HttpSession session;
    @Autowired
    private NoticeService noticeService;

    public NoticeController(HttpSession session, NoticeService noticeService) {
        this.session = session;
        this.noticeService = noticeService;
    }

    @GetMapping("/notice/get/{memId}")
    @ResponseBody
    public List<NoticeVO> findAllByMemId(@PathVariable Integer memId) {
        return noticeService.findAllByMemId(memId);
    }

    @PostMapping("/notice/saveRead")
    public void noticeRead(@RequestBody List<NoticeVO> noticeVOS) {
        noticeService.saveNotice(noticeVOS);
    }

    @PostMapping("/notice/saveNewNotice")
    public void saveNewNotice(List<NoticeVO> noticeVOS) {
        noticeService.saveNotice(noticeVOS);
    }

    @PostMapping("/notice/updateStatus")
    @ResponseBody
    public String updateStatus(@RequestBody Map<String,String> map){
        Integer noticeNo = Integer.valueOf(map.get("noticeNo"));
        noticeService.updateStatus(noticeNo);
        return "success";}
}
