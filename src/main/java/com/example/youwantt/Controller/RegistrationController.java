package com.example.youwantt.Controller;

import com.example.youwantt.Bean.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class RegistrationController {

    @GetMapping("/customerRegistration")
    public ModelAndView showRegistrationForm1() {
        ModelAndView mav = new ModelAndView("CustomerRegistration"); // name without .jsp
        mav.addObject("user", new User());
        return mav;
    }

    @GetMapping("/selectProfile")
    public ModelAndView shoeProfile() {
        ModelAndView mav = new ModelAndView("selectProfile"); // name without .jsp
        mav.addObject("user", new User());
        return mav;
    }

    @GetMapping("/register")
    public ModelAndView showRegistrationForm() {
        ModelAndView mav = new ModelAndView("registration"); // name without .jsp
        mav.addObject("user", new User());
        return mav;
    }
}
