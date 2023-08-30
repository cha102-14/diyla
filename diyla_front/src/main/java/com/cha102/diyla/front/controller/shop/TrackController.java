package com.cha102.diyla.front.controller.shop;

import com.cha102.diyla.commodityModel.CommodityVO;
import com.cha102.diyla.track.CommodityTrackService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping("/shop")
public class TrackController {

    private HttpServletRequest req;
    private CommodityTrackService commodityTrackService;
    public TrackController(HttpServletRequest req, CommodityTrackService commodityTrackService) {
        this.req = req;
        this.commodityTrackService = commodityTrackService;
    }

    @RequestMapping("/track/{comNO}")
    public String track(@PathVariable Integer comNO, Model model) {
        Integer memNO = 1;
        List<CommodityVO> commodityVOS = commodityTrackService.findAllByMemId(memNO);
        model.addAttribute("commodityList", commodityVOS);
        return "shop/commodityTrack.jsp";

    }




}
