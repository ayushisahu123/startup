package com.example.youwantt.Controller;

import com.example.youwantt.Bean.User;
import com.example.youwantt.Dao.UserDao;
import com.example.youwantt.Service.CustomUserDetailsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class VendorRegistration {
    @Autowired
    private BCryptPasswordEncoder encoder;

    @Autowired
    private UserDao userDao;
    @Autowired
    private CustomUserDetailsService customUserDetailsService;
    @GetMapping("/registerVendor")
    public ModelAndView home() {
        ModelAndView mav = new ModelAndView("vendorRegistration"); // name without .jsp
        mav.addObject("user", new User());
        return mav;
    }


    @GetMapping("/vendorLogin")
    public ModelAndView vendorLogin() {
        ModelAndView mav = new ModelAndView("vendorLogin"); // name without .jsp
        mav.addObject("user", new User());
        return mav;
    }


    @GetMapping("/vendorDashboard")
    public ModelAndView vendorDashboard() {
        ModelAndView mav = new ModelAndView("vendorDashboard"); // name without .jsp
        mav.addObject("user", new User());
        return mav;
    }

    @GetMapping("/processVendorLogin")
    public ModelAndView processVendorLogin() {
        ModelAndView mav = new ModelAndView("vendorLogin"); // name without .jsp
        mav.addObject("user", new User());
        return mav;
    }
//    @PostMapping("/registerVendorRegistration")
//    public ModelAndView processRegistration(
//            @ModelAttribute("user") User user,
//            @RequestParam("licenseFile") MultipartFile file) {
//        ModelAndView mav = new ModelAndView();
//
//        if (user.getUsername() == null || user.getUsername().trim().isEmpty() ||
//                user.getEmail() == null || user.getEmail().trim().isEmpty() ||
//                user.getPassword() == null || user.getPassword().trim().isEmpty() || user.getMobileNumber() == null) {
//
//            mav.setViewName("vendorRegistration"); // back to registration page
//            mav.addObject("message", "All fields are required!");
//            mav.addObject("user", user); // keep filled values
//            return mav;
//        }
//        try {
//            user.setRole("Vendor");
//            user.setAddress(user.getAddress());
//            user.setPassword(encoder.encode(user.getPassword()));
//            user.setMobileNumber(user.getMobileNumber());
//            user.setName(user.getUsername());
//            user.setUsername(user.getUsername());
//            user.setEmail(user.getEmail());
//            // encoding yaha
//            int result = userDao.saveVendor(user);
//
//            if (result > 0) {
//                mav.setViewName("vendorDashboard");
//                mav.addObject("message", "Registration successful!");
//                mav.addObject("user", user);
//            } else {
//                mav.setViewName("vendorRegistration");
//                mav.addObject("message", "Registration failed. Please try again.");
//            }
//
//        } catch (Exception e) {
//            e.printStackTrace();
//            mav.setViewName("vendorRegistration");
//            mav.addObject("message", "Error occurred while registering. Please try again.");
//        }
//        // TODO: yahan DB save logic
//        System.out.println("Vendor Registered: ");
//        System.out.println("File uploaded: ");
//        return mav;
//    }
        @PostMapping("/registerVendorRegistration")
        public ModelAndView processRegistration (
                @ModelAttribute("user") User user){

            ModelAndView mav = new ModelAndView();

            // Basic validation
            if (user.getUsername() == null || user.getUsername().trim().isEmpty() ||
                    user.getEmail() == null || user.getEmail().trim().isEmpty() ||
                    user.getPassword() == null || user.getPassword().trim().isEmpty() ||
                    user.getMobileNumber() == null) {

                mav.setViewName("vendorRegistration");
                mav.addObject("message", "All fields are required!");
                mav.addObject("user", user);
                return mav;
            }

            try {
                // Populate user details
                user.setRole("ROLE_VENDOR");
                user.setAddress(user.getAddress());
                user.setPassword(encoder.encode(user.getPassword()));
                user.setMobileNumber(user.getMobileNumber());
                user.setName(user.getUsername());
                user.setUsername(user.getUsername());
                user.setEmail(user.getEmail());

                int result = userDao.saveVendor(user);

                if (result > 0) {
                    // ✅ Stay on the same page; let SweetAlert redirect

                    // ✅ Auto-login the user
                    UserDetails userDetails = customUserDetailsService.loadUserByUsername(user.getEmail());

                    UsernamePasswordAuthenticationToken authToken =
                            new UsernamePasswordAuthenticationToken(
                                    userDetails, null, userDetails.getAuthorities());

                    SecurityContextHolder.getContext().setAuthentication(authToken);

                    // ✅ Redirect to vendor dashboard
//                    mav.setViewName("redirect:/vendorDashboard");
                    mav.setViewName("vendorRegistration");
                    mav.addObject("message", "Registration successful!");
                    mav.addObject("user", user);
                } else {
                    mav.setViewName("vendorRegistration");
                    mav.addObject("message", "Registration failed. Please try again.");
                }

            } catch (Exception e) {
                e.printStackTrace();
                mav.setViewName("vendorRegistration");
                mav.addObject("message", "Error occurred while registering. Please try again.");
            }

            System.out.println("Vendor Registered");
            return mav;
        }
    }

