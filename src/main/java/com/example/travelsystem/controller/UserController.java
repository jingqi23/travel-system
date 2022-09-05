package com.example.travelsystem.controller;

import com.alibaba.fastjson.JSONObject;
import com.example.travelsystem.exception.APICodeMsg;
import com.example.travelsystem.exception.BaseException;
import com.example.travelsystem.service.UserService;
import com.example.travelsystem.token.TokenX;
import com.example.travelsystem.tools.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("user")
public class UserController {

    @Autowired
    private UserService userService;

    @PostMapping("login")
    public Response<JSONObject> login(@RequestBody JSONObject jsonObject) throws BaseException {
        String userName = jsonObject.getString("userName");
        String password = jsonObject.getString("password");
        if (StringUtils.isNullOrEmpty(userName) || StringUtils.isNullOrEmpty(password)) {
            throw new BaseException(APICodeMsg.REQUEST_PARAM_ERROR);
        }
        String name = userService.login2(userName, password);
        JSONObject result = new JSONObject();
        result.put("name", name);
        result.put("token", TokenX.getToken(userName));
        return Response.makeSuccessResult(result);
    }

    @PostMapping("register")
    public Response<String> register(@RequestBody JSONObject jsonObject) throws BaseException {
        String userName = jsonObject.getString("userName");
        String password = jsonObject.getString("password");
        String name = jsonObject.getString("name");
        String phone = jsonObject.getString("phone");
        String idNumber = jsonObject.getString("idNumber");
        int sex = jsonObject.getIntValue("sex");

        if (StringUtils.isNullOrEmpty(userName)) throw new BaseException(APICodeMsg.REQUEST_PARAM_ERROR, "userName can not be empty");
        if (StringUtils.isNullOrEmpty(password)) throw new BaseException(APICodeMsg.REQUEST_PARAM_ERROR, "password can not be empty");
        if (StringUtils.isNullOrEmpty(name)) throw new BaseException(APICodeMsg.REQUEST_PARAM_ERROR, "name can not be empty");
        if (StringUtils.isNullOrEmpty(phone)) throw new BaseException(APICodeMsg.REQUEST_PARAM_ERROR, "phone can not be empty");
        if (StringUtils.isNullOrEmpty(idNumber)) throw new BaseException(APICodeMsg.REQUEST_PARAM_ERROR, "idNumber can not be empty");

        userService.register(userName, password, name, phone, sex, idNumber);
        return Response.makeSuccessResult(null);
    }

}
