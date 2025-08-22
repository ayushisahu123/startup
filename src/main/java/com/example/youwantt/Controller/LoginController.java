package com.example.youwantt.Controller;

import com.example.youwantt.Bean.User;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class LoginController {

    @GetMapping("/login")
    public ModelAndView showLoginForm() {
        ModelAndView mav = new ModelAndView("login"); // name without .jsp
        mav.addObject("user", new User());
        return mav;
    }
}
