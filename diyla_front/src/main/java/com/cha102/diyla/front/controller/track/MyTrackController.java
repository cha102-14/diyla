package com.cha102.diyla.front.controller.track;

import com.cha102.diyla.track.CommodityTrackDTO;
import com.cha102.diyla.track.CommodityTrackService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

@Controller
public class MyTrackController {


    @Autowired
    private CommodityTrackService service;




    @RequestMapping(method = RequestMethod.GET, value = "/track/track")
    public String trackList(@RequestParam("memId") Integer memId, ModelMap model, HttpServletRequest req, HttpServletResponse resp) {
        System.out.println(memId);
        List<CommodityTrackDTO> trackList = service.findById(memId);
//        for (CommodityTrackDTO c : trackList) {
//            System.out.println(c);
//        }
        req.setAttribute("trackList", trackList);
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("trackList.jsp");
        try {
            requestDispatcher.forward(req, resp);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "trackList";

    }
}
