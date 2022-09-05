package com.example.travelsystem;

import com.example.travelsystem.controller.Response;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.ArrayList;
import java.util.List;

@SpringBootTest
public class ResponseTest {

    @Test
    public void testSuccess() {
        List<String> list = new ArrayList<>();
        list.add("b");
        list.add("o");
        list.add("e");
        System.out.println(Response.makeSuccessResult(list));
    }

    @Test
    public void testFail() {
        System.out.println(Response.makeFailResult(10001, "need login"));
    }
}
