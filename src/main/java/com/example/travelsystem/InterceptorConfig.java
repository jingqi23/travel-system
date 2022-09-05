package com.example.travelsystem;

import com.example.travelsystem.token.TokenInterceptor;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class InterceptorConfig implements WebMvcConfigurer {
    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        System.out.println("addInterceptors...");
        registry.addInterceptor(new TokenInterceptor()).addPathPatterns("/**");
    }
}
