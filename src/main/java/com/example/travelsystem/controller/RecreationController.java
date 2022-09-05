package com.example.travelsystem.controller;

import com.example.travelsystem.entity.Hotel;
import com.example.travelsystem.entity.Recreation;
import com.example.travelsystem.service.RecreationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("recreation2")
public class RecreationController {

    @Autowired
    private RecreationService service;

    @GetMapping
    public Response<List<Recreation>> getRecreationList() {
        return Response.makeSuccessResult(service.getRecreationList());
    }
}
