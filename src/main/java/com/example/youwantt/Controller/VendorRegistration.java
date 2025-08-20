package com.example.youwantt.Controller;

import com.example.youwantt.Bean.User;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class VendorRegistration {

    @GetMapping("/registerVendor")
    public ModelAndView home() {
        ModelAndView mav = new ModelAndView("vendorRegistration"); // name without .jsp
        mav.addObject("user", new User());
        return mav;
    }

    @PostMapping("/vendorDashboard")
    public ModelAndView vendorDashboard() {
        ModelAndView mav = new ModelAndView("vendorDashboard"); // name without .jsp
        mav.addObject("user", new User());
        return mav;
    }

}
