package com.example.travelsystem.controller;

import com.example.travelsystem.entity.Scenicspot;
import com.example.travelsystem.service.ScenicspotService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("attractions")
public class AttractionsController {

    @Autowired
    private ScenicspotService service;

    @GetMapping
    public Response<List<Scenicspot>> getAttractionsList() {
        return Response.makeSuccessResult(service.getScenicspotList());
    }
}
