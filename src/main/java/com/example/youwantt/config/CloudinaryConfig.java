package com.example.youwantt.config;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import java.util.Map;

@Configuration
public class CloudinaryConfig {


    @Bean
    public Cloudinary cloudinary() {
        return new Cloudinary(ObjectUtils.asMap(
                "cloud_name", "dmal3wbbc",
                "api_key", "515643461869422",
                "api_secret", "PbiBoYAl9COjlu03Fn2VXJuZbmQ"
        ));
    }
}
