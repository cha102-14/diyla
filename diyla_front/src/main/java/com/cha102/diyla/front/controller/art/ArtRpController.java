package com.cha102.diyla.front.controller.art;

import com.cha102.diyla.articleModel.ArtService;
import com.cha102.diyla.articlemsgmodel.ArtMsgService;
import com.cha102.diyla.articlerpmsgmodel.ArtMsgRpService;
import com.cha102.diyla.articlerpmsgmodel.ArtMsgRpVO;
import org.json.JSONObject;
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
import java.io.BufferedReader;
import java.io.IOException;
import java.util.List;
import java.util.stream.Collectors;

@Controller
public class ArtRpController {

    @Autowired
    ArtMsgRpService artRpSvc;
    @Autowired
    ArtMsgService artMsgSvc;

    @RequestMapping(method = RequestMethod.POST, value = "/art/rpmsg")
    public String rpmsg(@Valid ArtMsgRpVO artMsgRpVO, BindingResult result, ModelMap model, HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
        List<FieldError> errorRpList = result.getFieldErrors()
                .stream()
                .filter(fieldname -> fieldname.getField().equals("msgContext"))
                .collect(Collectors.toList());
        result = new BeanPropertyBindingResult(artMsgRpVO, "artMsgRpVO");
        for (FieldError fieldError : errorRpList) {
            result.addError(fieldError);
        }
        if (result.hasErrors()) {
            model.addAttribute("errorRpList", errorRpList);
            return "/art/oneart.jsp";
        }

        BufferedReader reader = req.getReader();
        StringBuilder strb = new StringBuilder();
        String line;
        while ((line = reader.readLine()) != null) {
            strb.append(line);
        }
        JSONObject datas = new JSONObject(strb.toString());
        String rpContent = datas.getString("report");
        Integer memId = datas.getInt("memId");
        Integer msgNo = datas.getInt("msgNo");

        artMsgRpVO.setRpMsgContext(rpContent);
        artMsgRpVO.setMemId(memId);
        artMsgRpVO.setMsgNo(msgNo);

        artRpSvc.addArtMsg(artMsgRpVO);
        model.addAttribute("success", artMsgRpVO);

        res.getWriter().write("success");
        return null;
    }

    @RequestMapping(method = RequestMethod.POST, value = "/art/deleteArt")
    public String deleteArt(@RequestParam("artNo") Integer artNo, ModelMap model, HttpServletRequest req, HttpServletResponse res){
        ArtService artSvc = new ArtService();
        Integer[] allMsgNo = artMsgSvc.selectAllMsgNoByArtNo(artNo);
        for (int i = 0; i < allMsgNo.length; i++) {
            artRpSvc.deleteAllRpByMsgNo(allMsgNo[i]);
        }
        artMsgSvc.deleteAllMsgByArtno(artNo);
        artSvc.deleteArt(artNo);

        return "/art/personalart.jsp";
    }
}
