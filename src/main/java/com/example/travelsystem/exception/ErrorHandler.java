package com.example.travelsystem.exception;

import com.example.travelsystem.controller.Response;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;

/**
 * Created by sunshuai on 2022/8/14
 */
@ControllerAdvice
public class ErrorHandler {

    @ExceptionHandler(BaseException.class)
    @ResponseStatus(value = HttpStatus.ACCEPTED)
    @ResponseBody
    public Response<String> handleCustomException(BaseException error) {
        return Response.makeFailResult(error.getCode(), error.getMessage());
    }

}
