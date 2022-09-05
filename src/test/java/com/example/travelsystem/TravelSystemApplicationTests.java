package com.example.travelsystem;

import com.example.travelsystem.dao.TestDao;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;

@SpringBootTest
class TravelSystemApplicationTests {

    @Autowired
    private TestDao testDao;

    @Test
    void contextLoads() {
        List<com.example.travelsystem.entity.Test> testList = testDao.selectList(null);
        testList.forEach(System.out::println);

    }

}
