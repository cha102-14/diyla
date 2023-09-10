package com.cha102.diyla.front.controller.shop;

import com.cha102.diyla.commodityCommentModel.CommodityCommentService;
import com.cha102.diyla.commodityCommentModel.CommodityCommentVO;
import com.cha102.diyla.commodityModel.CommodityService;
import com.cha102.diyla.commodityModel.CommodityVO;
import com.cha102.diyla.member.MemVO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/shop")
public class CommodityCommentController {

    private HttpSession session;
    private CommodityService commodityService = new CommodityService();
    private CommodityCommentService commodityCommentService;

    public CommodityCommentController(HttpSession session, CommodityCommentService commodityCommentService) {
        this.session = session;
        this.commodityCommentService = commodityCommentService;
    }

    @RequestMapping("/commodityComment/goInsertPage")
    public String goInsertPage(Model model, @RequestParam("comNo") Integer comNO) {
        MemVO memVO = (MemVO) session.getAttribute("memVO");
         CommodityVO commodityVO = commodityService.findByID(comNO);
        model.addAttribute("commodityVO", commodityVO);
        return "/shop/commentPage.jsp";
    }

    @PostMapping("/commodityComment/insertComment/{comNO}")
    public String insertComment(
            @RequestParam("rating") Integer rating,
            @RequestParam("comContent") String comContent,
            @PathVariable Integer comNO) {
        CommodityCommentVO commodityCommentVO = new CommodityCommentVO();
        MemVO memVO = (MemVO) session.getAttribute("memVO");
        commodityCommentVO.setComNo(comNO);
        commodityCommentVO.setRating(rating);
        commodityCommentVO.setComContent(comContent);
        if (memVO == null) {
            commodityCommentVO.setMemId(1);
        } else {
            commodityCommentVO.setMemId(memVO.getMemId());
        }
        commodityCommentService.save(commodityCommentVO);
        return "index.jsp";
    }

    @GetMapping("/commodityComment/get/{comNO}")
    @ResponseBody
    public List<CommodityCommentVO> findAllByComNo(@PathVariable Integer comNO, HttpServletRequest request) {

        String sort = request.getParameter("sort");
        sort = sort == null ? "" : sort;
        return commodityCommentService.getAllByComNo(comNO,sort);
    }

}
