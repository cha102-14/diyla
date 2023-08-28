package com.cha102.diyla.front.controller.track;

import com.cha102.diyla.track.CommodityTrackDTO;
import com.cha102.diyla.track.CommodityTrackService;
import com.cha102.diyla.track.CommodityTrackVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class MyTrackController {


    @Autowired
    private CommodityTrackService service;


//    @PostMapping("trackList")
//    public String trackList(@RequestParam("memId") Integer memID, Model model){
//        System.out.println(memID);
//        List<CommodityTrackDTO> track = service.findById(memID);
//        model.addAttribute("track",track);
//        return "track/trackList";
//
//    }

    @RequestMapping(method = RequestMethod.POST, value = "track")
    public String trackList(
            @RequestParam("memId") Integer memId,
            ModelMap model, HttpServletRequest req){
//        Integer memId = Integer.valueOf(req.getParameter("memId"));
//        HttpSession session = req.getSession();
//        Integer memId = (Integer) session.getAttribute("memId");
        System.out.println(memId);
        List<CommodityTrackDTO> track = service.findById(memId);
        model.addAttribute("track",track);
        return "track/trackList";

    }
}
