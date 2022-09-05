package com.example.travelsystem.service;

import java.util.List;

import com.example.travelsystem.entity.Feedback;
import com.example.travelsystem.entity.User;


public interface FeedbackService {

    boolean add(Feedback feedback);

    List<Feedback> getList(int currentPageNo, int pageSize);

    int getCount();

    boolean deleteById(Integer delId);

    Feedback getById(String id);
}
