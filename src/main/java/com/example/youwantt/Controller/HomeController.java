package com.example.youwantt.Controller;

import com.example.youwantt.Bean.User;
import com.example.youwantt.Dao.UserDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class HomeController {


    @Autowired
    private UserDao userDao;

    @GetMapping("/")
    public ModelAndView home() {
        ModelAndView mav = new ModelAndView("home"); // name without .jsp
        mav.addObject("user", new User());
        return mav;

    }



    @GetMapping("/users")
    public ModelAndView users() {
        ModelAndView mav = new ModelAndView("user-list"); // JSP name
        mav.addObject("userList", userDao.getAllUsers());
        return mav;
    }

}