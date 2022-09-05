package com.example.travelsystem.tools;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginInterceptor extends HandlerInterceptorAdapter {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        if (request.getSession().getAttribute("userSession") != null) {
            return true;
        } else {
            response.sendRedirect(request.getContextPath() + "/index.jsp");
            return false;
        }
    }
}
