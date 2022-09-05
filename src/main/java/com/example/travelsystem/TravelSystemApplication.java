package com.example.travelsystem;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ImportResource;

@ImportResource("classpath:applicationContext.xml")
@SpringBootApplication
@MapperScan("com.example.travelsystem.dao")
public class TravelSystemApplication {
    public static void main(String[] args) {
        SpringApplication.run(TravelSystemApplication.class, args);
        System.out.println("application running...");
    }

}
