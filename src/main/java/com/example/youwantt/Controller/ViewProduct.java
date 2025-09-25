package com.example.youwantt.Controller;

import com.example.youwantt.Bean.User;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import org.springframework.stereotype.Controller;

@Controller
public class ViewProduct {

    @GetMapping("/viewProduct")
    public ModelAndView home() {
        ModelAndView mav = new ModelAndView("viewProduct"); // name without .jsp
        mav.addObject("user", new User());
        return mav;
    }
}
