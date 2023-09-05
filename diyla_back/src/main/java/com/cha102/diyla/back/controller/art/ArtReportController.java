package com.cha102.diyla.back.controller.art;

import com.cha102.diyla.articleModel.ArtService;
import com.cha102.diyla.articlemsgmodel.ArtMsgService;
import com.cha102.diyla.articlerpmsgmodel.ArtDTO;
import com.cha102.diyla.articlerpmsgmodel.ArtMsgRpService;
import com.cha102.diyla.member.MemberService;
import com.cha102.diyla.noticeModel.NoticeService;
import com.cha102.diyla.noticeModel.NoticeVO;
import com.cha102.diyla.tokenModel.TokenService;
import com.cha102.diyla.util.JedisNotice;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import java.io.IOException;
import java.util.List;

@Controller
public class ArtReportController {
    @Autowired
    ArtMsgRpService artMsgRpService;

    @Autowired
    ArtMsgService artMsgService;
    @Autowired
    NoticeService noticeService;

    @GetMapping("/art/artReport")
    public String artReport(ModelMap model) {
        List<ArtDTO> list = artMsgRpService.getAllDTO();
        model.addAttribute("list", list);
        return "/WEB-INF/artReport.jsp";
    }

    @RequestMapping(method = RequestMethod.POST, value = "/art/successRpMsg")
    public String successRpMsg(@RequestParam("memId") Integer memId,@RequestParam("rpMsgNo") Integer rpMsgNo,@RequestParam("msgNo") Integer msgNo, ModelMap model) throws ServletException, IOException {
        artMsgRpService.deleteArtMsg(rpMsgNo);
        artMsgService.updateStatus(msgNo);

        MemberService memSvc = new MemberService();
        memSvc.reportCount(memId);
        //新增個人通知
        NoticeVO noticeVO = new NoticeVO();
        noticeVO.setNoticeTitle("您的留言因受到檢舉並審核通過，提醒您若受到檢舉三次將只能瀏覽文章。");
        noticeService.addNotice(noticeVO);
        //存入redis
        JedisNotice.setJedisNotice(memId,"reportCount");
        if(memSvc.selectReportCount(memId)%3 == 0){
            memSvc.addArtBlackList(memId);
            //新增個人通知
            noticeVO.setNoticeTitle("您因多次受到檢舉已進入黑名單，無法再使用該功能。");
            noticeService.addNotice(noticeVO);
            //存入redis
            JedisNotice.setJedisNotice(memId,"ArtBlack");
        }


        List<ArtDTO> list = artMsgRpService.getAllDTO();
        model.addAttribute("list", list);
        return "/WEB-INF/artReport.jsp";
    }

    @RequestMapping(method = RequestMethod.POST, value = "/art/deleteRpMsg")
    public String deleteRpMsg(@RequestParam("rpMsgNo") Integer rpMsgNo,@RequestParam("msgNo") Integer msgNo, ModelMap model) throws ServletException, IOException {
        artMsgRpService.deleteArtMsg(rpMsgNo);
        artMsgService.rollbackStatus(msgNo);

        List<ArtDTO> list = artMsgRpService.getAllDTO();
        model.addAttribute("list", list);
        return "/WEB-INF/artReport.jsp";
    }
}
