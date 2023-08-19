package com.cha102.diyla.front.controller.shop;

import com.cha102.diyla.track.CommodityTrackService;
import com.cha102.diyla.track.CommodityTrackVO;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@RestController
@RequestMapping("/shop")
public class TrackController {

    private HttpServletRequest req;
    private CommodityTrackService commodityTrackService;
    public TrackController(HttpServletRequest req, CommodityTrackService commodityTrackService) {
        this.req = req;
        this.commodityTrackService = commodityTrackService;
    }

    @RequestMapping("/track/{comNO}")
    public List<CommodityTrackVO> track(@PathVariable Integer comNO, Model model) {
        Integer memNO = 1;
        String referer = req.getHeader("referer");
        System.out.println("referer:"+ referer);
        commodityTrackService.findAllByMemId(1);
        return commodityTrackService.findAllByMemId(1);
    }




}
