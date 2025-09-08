package com.example.youwantt.Controller;

import com.example.youwantt.Bean.User;
import com.example.youwantt.Dao.UserDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class RegistrationController {
    @Autowired
    private BCryptPasswordEncoder encoder;
    @Autowired
    private UserDao userDao;
    @GetMapping("/register")
    public ModelAndView showRegistrationForm() {
        ModelAndView mav = new ModelAndView("registration"); // name without .jsp
        mav.addObject("user", new User());
        return mav;
    }

    @GetMapping("/selectProfile")
    public ModelAndView shoeProfile() {
        ModelAndView mav = new ModelAndView("selectProfile"); // name without .jsp
        mav.addObject("user", new User());
        return mav;
    }

    @PostMapping("/customerDashboard")
    public ModelAndView customerDashboard() {
        ModelAndView mav = new ModelAndView("CustomerDashboard"); // name without .jsp
        mav.addObject("user", new User());
        return mav;

    }

    @PostMapping("/register")
    public ModelAndView processRegistration(@ModelAttribute("user") User user) {
        ModelAndView mav = new ModelAndView();

        // ✅ Null / empty field checks
        if (user.getUsername() == null || user.getUsername().trim().isEmpty() ||
                user.getEmail() == null || user.getEmail().trim().isEmpty() ||
                user.getPassword() == null || user.getPassword().trim().isEmpty()) {

            mav.setViewName("registration"); // back to registration page
            mav.addObject("message", "All fields are required!");
            mav.addObject("user", user); // keep filled values
            return mav;
        }

        try {
            user.setPassword(encoder.encode(user.getPassword())); // encoding yaha
            int result = userDao.saveUser(user);

            if (result > 0) {
                mav.setViewName("CustomerDashboard");
                mav.addObject("message", "Registration successful!");
                mav.addObject("user", user);
            } else {
                mav.setViewName("registration");
                mav.addObject("message", "Registration failed. Please try again.");
            }

        } catch (Exception e) {
            e.printStackTrace();
            mav.setViewName("registration");
            mav.addObject("message", "Error occurred while registering. Please try again.");
        }

        return mav;
    }

}
