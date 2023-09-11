package com.cha102.diyla.back.controller.shop;

import com.cha102.diyla.commodityClassModel.CommodityClassService;
import com.cha102.diyla.commodityClassModel.CommodityClassVO;
import com.cha102.diyla.commodityModel.Commodity;
import com.cha102.diyla.commodityModel.CommodityPageService;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;

@Controller
@RequestMapping("/shop")
public class CommodityPageController {
    private CommodityPageService commodityPageService;
    CommodityClassService classService = new CommodityClassService();

    public CommodityPageController(CommodityPageService commodityPageService) {
        this.commodityPageService = commodityPageService;
    }

    @RequestMapping("/commodity/get/{page}")
    public String findAll(Model model, @PathVariable Integer page) {

        List<CommodityClassVO> commodityClasses = classService.getAll();
        HashMap<Integer, String> classNameMap = new HashMap<>();
        for (CommodityClassVO commodityClassVO : commodityClasses) {
            //將類別編號當key，類別名稱當Value放進HashMap中
            classNameMap.put(commodityClassVO.getComClassNo(), commodityClassVO.getComClassName());
        }
        Page<Commodity> pages = commodityPageService.findAll(page);
        List<Commodity> commodityList = pages.getContent();
        int size = pages.getSize();
        model.addAttribute("classNameMap", classNameMap);
        model.addAttribute("commodityList", commodityList);
        model.addAttribute("pageSize", size);
        return "/shop/listCommodity2.jsp";
    }

}
