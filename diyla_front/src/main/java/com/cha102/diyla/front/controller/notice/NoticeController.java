package com.cha102.diyla.front.controller.notice;

import com.cha102.diyla.noticeModel.NoticeService;
import com.cha102.diyla.noticeModel.NoticeVO;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class NoticeController {
    private HttpSession session;
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
}
