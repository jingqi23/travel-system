package com.example.travelsystem.service;

import com.example.travelsystem.dao.TestDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class TestService {
    @Autowired
    private TestDao testDao;

    public void test() {
//        int s = testDao.test();
//        System.out.println(s);
    }
}
