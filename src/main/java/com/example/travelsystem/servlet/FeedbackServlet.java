package com.example.travelsystem.servlet;

import com.example.travelsystem.entity.Feedback;
import com.example.travelsystem.service.FeedbackService;
import com.example.travelsystem.service.PrictureService;
import com.example.travelsystem.tools.Constants;
import com.example.travelsystem.tools.PageSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;

//评价
@Controller
@RequestMapping("/feedback")
public class FeedbackServlet {
    @Autowired
    @Qualifier("feedbackServiceImpl")
    FeedbackService feedbackService;

    @Autowired
    @Qualifier("prictureServiceImpl")
    PrictureService prictureService;

    @RequestMapping("add")
    public String add(HttpSession session, Feedback feedback, BindingResult result) {
        System.out.println("add()================");
        //feedback.setUser((User)session.getAttribute("userSession"));

        feedbackService.add(feedback);
        return "redirect:/pricture.jsp";
    }

    @RequestMapping("query")
    public String query(Integer pageIndex, HttpServletRequest request) {
        //查询用户列表
        List<Feedback> feedbackList;
        //设置页面容量
        int pageSize = Constants.pageSize;
        //当前页码
        int currentPageNo = 1;
        if (pageIndex != null && pageIndex != 0) {
            currentPageNo = pageIndex;
        }

        System.out.println("query pageIndex--------- > " + pageIndex);

        //总数量（表）
        int totalCount = feedbackService.getCount();
        //总页数
        PageSupport pages = new PageSupport();
        pages.setCurrentPageNo(currentPageNo);
        pages.setPageSize(pageSize);
        pages.setTotalCount(totalCount);

        int totalPageCount = pages.getTotalPageCount();

        //控制首页和尾页
        if (currentPageNo < 1) {
            currentPageNo = 1;
        } else if (currentPageNo > totalPageCount) {
            currentPageNo = totalPageCount;
        }


        feedbackList = feedbackService.getList(currentPageNo, pageSize);
        request.setAttribute("feedbackList", feedbackList);
        request.setAttribute("totalPageCount", totalPageCount);
        request.setAttribute("currentPageNo", currentPageNo);
        return "manager/feedbacklist";
    }


    @RequestMapping("del/{id}")
    public String delfeedback(@PathVariable("id") Integer id) {
        HashMap<String, String> resultMap = new HashMap<>();
        if (id <= 0) {
            resultMap.put("delResult", "notexist");
        } else {
            if (feedbackService.deleteById(id)) {
                resultMap.put("delResult", "true");
            } else {
                resultMap.put("delResult", "false");
            }
        }
        return "redirect:/feedback/query";
    }


}