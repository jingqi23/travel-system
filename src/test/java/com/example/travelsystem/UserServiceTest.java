package com.example.travelsystem;

import com.example.travelsystem.service.UserService;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
public class UserServiceTest {

    @Autowired
    private UserService userService;

    @Test
    public void testLogin() {
        userService.login2("u3", "12312");
    }

    @Test
    public void testRegister() {
        userService.register("suns", "s123", "孙帅", "18810888888", 1, "120220222222221111");
    }
}
