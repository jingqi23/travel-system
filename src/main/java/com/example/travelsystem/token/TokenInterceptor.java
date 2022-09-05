package com.example.travelsystem.token;

import com.example.travelsystem.exception.APICodeMsg;
import com.example.travelsystem.exception.BaseException;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.lang.reflect.Method;

public class TokenInterceptor implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {

        if (!(handler instanceof HandlerMethod)) {
            System.out.println("not HandlerMethod, pass");
            return true;
        }
        HandlerMethod handlerMethod = (HandlerMethod) handler;
        Method method = handlerMethod.getMethod();

        if (method.isAnnotationPresent(NeedToken.class) && method.getAnnotation(NeedToken.class).required()) {
            String token = request.getHeader("token");
            System.out.println("token:" + token);
            String uid = TokenX.verifyToken(token);
            if (token == null || uid == null) {
                throw new BaseException(APICodeMsg.TOKEN_INVALID);
            }
            request.setAttribute("uid", uid);
        }
        return true;
    }
}
