package com.cha102.diyla.front.controller.checkout;

import com.cha102.diyla.front.EcpayCheckout;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class Test {

    @RequestMapping("/test/test")
    public String test(Model model) {

        String s = EcpayCheckout.goToEcpay(1, "哈哈", 1000, "商品一批");
        model.addAttribute("checkoutPage", s);
        return "test.jsp";
    }
}
