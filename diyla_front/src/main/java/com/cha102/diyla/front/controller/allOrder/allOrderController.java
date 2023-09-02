package com.cha102.diyla.front.controller.allOrder;

import com.cha102.diyla.diycatemodel.DiyOrderDTO;
import com.cha102.diyla.diycatemodel.DiyOrderDTOService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
public class allOrderController {
    @Autowired
    private DiyOrderDTOService service;
    @RequestMapping(method = RequestMethod.GET, value = "/allOrder/allOrder")
    public String diyOrder(@RequestParam("memId") Integer memId, ModelMap model){
        System.out.println(memId);
        List<DiyOrderDTO> diyList = service.findById(memId);
        model.addAttribute("diyList",diyList);
        return "/allOrder/allOrder.jsp";
    }

}
