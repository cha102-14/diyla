package com.cha102.diyla.front.controller.art;

import com.cha102.diyla.articleModel.ArtService;
import com.cha102.diyla.articleModel.ArtVO;
import com.cha102.diyla.articlemsgmodel.ArtMsgService;
import com.cha102.diyla.articlemsgmodel.ArtMsgVO;
import com.cha102.diyla.noticeModel.NoticeService;
import com.cha102.diyla.noticeModel.NoticeVO;
import com.cha102.diyla.util.JedisNotice;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BeanPropertyBindingResult;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;
import java.io.IOException;
import java.util.List;
import java.util.stream.Collectors;

@Controller
public class ArtMsgController {
    @Autowired
    ArtMsgService artMsgSvc;
    @Autowired
    NoticeService noticeService;


    @RequestMapping(method = RequestMethod.POST, value = "/art/insert")
    public String insert(@RequestParam("memId") Integer memId, @Valid ArtMsgVO artMsgVO, BindingResult result, ModelMap model, HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

        List<FieldError> errorsMsgList = result.getFieldErrors()
                .stream()
                .filter(fieldname -> fieldname.getField().equals("msgContext"))
                .collect(Collectors.toList());
        result = new BeanPropertyBindingResult(artMsgVO, "artMsgVO");
        for (FieldError fieldError : errorsMsgList) {
            result.addError(fieldError);
        }
        if (result.hasErrors()) {
            model.addAttribute("errorsMsgList",errorsMsgList);
            select(memId,artMsgVO,model,req,res);
            return "/art/oneart.jsp";
        }

        ArtService artSvc = new ArtService();
        Integer artNo = Integer.valueOf(req.getParameter("artNo"));
        ArtVO artVO = artSvc.getArtByArtNo(artNo);

        artMsgVO.setMsgStatus((byte) 1); //預設顯示留言
        artMsgSvc.addArtMsg(artMsgVO);
        List<ArtMsgVO> list = artMsgSvc.getAllByArtNo(artNo);
        //新增個人通知
        NoticeVO noticeVO = new NoticeVO();
        noticeVO.setNoticeTitle("您的文章有一個新留言，快來看看吧～");
        noticeVO.setMemId(memId);
        noticeService.addNotice(noticeVO);
        //存入redis
        JedisNotice.setJedisNotice(memId,"addArtMsg");

        model.addAttribute("artVO", artVO);
        model.addAttribute("list",list);

        return "/art/oneart.jsp";
    }

    @RequestMapping(method = RequestMethod.POST, value = "/art/select")
    public String select(@RequestParam("memId") Integer memId, ArtMsgVO artMsgVO, ModelMap model, HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        ArtService artSvc = new ArtService();
        Integer artNo = Integer.valueOf(req.getParameter("artNo"));
        ArtVO artVO = artSvc.getArtByArtNo(artNo);
        List<ArtMsgVO> list = artMsgSvc.getAllByArtNo(artNo);

        model.addAttribute("artVO", artVO);
        model.addAttribute("list",list);

        return "/art/oneart.jsp";
    }


}
