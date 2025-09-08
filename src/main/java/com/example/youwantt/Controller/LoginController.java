package com.example.youwantt.Controller;

import com.example.youwantt.Bean.User;
import com.example.youwantt.Dao.UserDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class LoginController {
    @Autowired
    private UserDao userDao;
    @GetMapping("/login")
    public ModelAndView showLoginForm() {
        System.out.println("login controller");
        ModelAndView mav = new ModelAndView("login"); // name without .jsp
        mav.addObject("user", new User());
        return mav;
    }


    @PostMapping("/processLogin")
    public ModelAndView processLogin(@ModelAttribute("user") User user) {
        System.out.println("POST /login called with: " + user.getEmail());

        User dbUser = userDao.validateUser(user.getEmail(), user.getPassword());

        if (dbUser != null) {
            ModelAndView mav = new ModelAndView("home");
            mav.addObject("message", "Login successful!");
            mav.addObject("user", dbUser);
            return mav;
        } else {
            ModelAndView mav = new ModelAndView("login");
            mav.addObject("error", "Invalid email or password!");
            return mav;
        }
    }
}
