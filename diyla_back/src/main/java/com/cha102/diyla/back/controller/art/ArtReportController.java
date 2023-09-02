package com.cha102.diyla.back.controller.art;

import com.cha102.diyla.articlemsgmodel.ArtMsgService;
import com.cha102.diyla.articlerpmsgmodel.ArtDTO;
import com.cha102.diyla.articlerpmsgmodel.ArtMsgRpService;
import com.cha102.diyla.member.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.ServletException;
import java.io.IOException;
import java.util.List;

@Controller
public class ArtReportController {
    @Autowired
    ArtMsgRpService artMsgRpService;

    @Autowired
    ArtMsgService artMsgService;

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
