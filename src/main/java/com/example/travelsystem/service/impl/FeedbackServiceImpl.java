package com.example.travelsystem.service.impl;

import com.example.travelsystem.dao.FeedbackDao;
import com.example.travelsystem.entity.Feedback;
import com.example.travelsystem.service.FeedbackService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
@Scope("prototype")
public class FeedbackServiceImpl implements FeedbackService {

    @Autowired
    private FeedbackDao feedbackDao;

    public boolean add(Feedback feedback) {
        boolean flag = false;
        int updateRows = feedbackDao.add(feedback);
        if (updateRows > 0) {
            flag = true;
            System.out.println("add success!");
        } else {
            System.out.println("add failed!");
        }

        return flag;
    }

    public List<Feedback> getList(int currentPageNo, int pageSize) {
        List<Feedback> FeedbackList;
        System.out.println("currentPageNo ---- > " + currentPageNo);
        System.out.println("pageSize ---- > " + pageSize);
        Map<String, Object> params = new HashMap<>();
        params.put("begin", (currentPageNo - 1) * pageSize);
        params.put("pageSize", pageSize);

        FeedbackList = feedbackDao.getList(params);
        return FeedbackList;
    }

    public boolean deleteById(Integer delId) {
        return feedbackDao.deleteById(delId) > 0;
    }

    public Feedback getById(String id) {
        return feedbackDao.getById(Integer.parseInt(id));
    }

    public int getCount() {
        return feedbackDao.getCount();
    }

}
