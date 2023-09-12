package com.cha102.diyla.front.controller.shop;

import com.cha102.diyla.commodityModel.CommodityVO;
import com.cha102.diyla.member.MemVO;
import com.cha102.diyla.track.CommodityTrackService;
import com.cha102.diyla.track.CommodityTrackVO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/shop")
public class TrackController {

    private HttpSession httpSession;

    private HttpServletRequest req;
    private CommodityTrackService commodityTrackService;

    public TrackController(HttpSession httpSession, HttpServletRequest req, CommodityTrackService commodityTrackService) {
        this.httpSession = httpSession;
        this.req = req;
        this.commodityTrackService = commodityTrackService;
    }

    @RequestMapping("/track/{comNO}")
    @ResponseBody
    public String track(@PathVariable Integer comNO, Model model) {
        MemVO memVO = (MemVO) httpSession.getAttribute("memVO");
        if (memVO == null) {
            return null;
        }

        Integer memId = memVO.getMemId();

        if (commodityTrackService.isTracking(comNO,memId)) {
            return "已在追蹤清單裡";
        }
        CommodityTrackVO commodityTrackVO = new CommodityTrackVO();
        commodityTrackVO.setMemId(memId);
        commodityTrackVO.setComNO(comNO);
        commodityTrackService.save(commodityTrackVO);
        return "已加入追蹤";
    }


}
