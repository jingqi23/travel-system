package com.example.travelsystem.servlet;

import com.example.travelsystem.entity.Food;
import com.example.travelsystem.service.FoodService;
import com.example.travelsystem.tools.Constants;
import com.example.travelsystem.tools.PageSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;


@Controller
@RequestMapping("/food")
public class FoodServlet {
    @Autowired
    @Qualifier("foodServiceImpl")
    FoodService foodService;

    @RequestMapping("add")
    public String add(HttpSession session, @RequestParam("img") MultipartFile[] img, Food food, BindingResult result) {
        System.out.println("add()================");
        //得到服务器的真实路径
        String realPath = session.getServletContext().getRealPath("/images");
        for (int i = 0; i < img.length; i++) {
            if (!img[i].isEmpty()) {
                //得到上传的文件名称
                String oname = img[i].getOriginalFilename();
                //判断文件的类型（控制上传文件的类型）
                String type = oname.substring(oname.lastIndexOf("."));
                if (type.equalsIgnoreCase(".jpg") || type.equalsIgnoreCase(".gif") || type.equalsIgnoreCase(".png")) {
                    String newName = "food" + Constants.getFileName() + type;
                    //将文件保存
                    try {
                        img[i].transferTo(new File(realPath + "/" + newName));
                    } catch (IllegalStateException | IOException e) {
                        // TODO Auto-generated catch block
                        e.printStackTrace();
                    }
                    //将新的文件名存入数据库
                    if (i == 0) {
                        food.setImg1(newName);
                    } else if (i == 1) {
                        food.setImg2(newName);
                    } else {
                        food.setImg3(newName);
                    }
                }
            }
        }
        foodService.add(food);
        return "redirect:/food/query1";


    }

    @RequestMapping("query1")
    public String query1(String queryFoodName, Integer pageIndex, HttpServletRequest request) {
        //查询用户列表
        List<Food> foodList;
        //设置页面容量
        int pageSize = Constants.pageSize;
        //当前页码
        int currentPageNo = 1;
        if (pageIndex != null && pageIndex != 0) {
            currentPageNo = pageIndex;
        }

        System.out.println("queryFoodName servlet--------" + queryFoodName);
        System.out.println("query pageIndex--------- > " + pageIndex);

        //总数量（表）
        int totalCount = foodService.getCount(queryFoodName);
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


        foodList = foodService.getList(queryFoodName, currentPageNo, pageSize);
        request.setAttribute("foodList", foodList);
        request.setAttribute("queryFoodName", queryFoodName);
        request.setAttribute("totalPageCount", totalPageCount);
        request.setAttribute("totalCount", totalCount);
        request.setAttribute("currentPageNo", currentPageNo);
        return "manager/foodlist";
    }

    @RequestMapping("query")
    @ResponseBody
    public HashMap<String, Object> query(String queryFoodName, Integer pageIndex, HttpServletRequest request) {
        //查询用户列表
        List<Food> foodList;
        //设置页面容量
        int pageSize = Constants.pageSize;
        //当前页码
        int currentPageNo = 1;
        if (pageIndex != null && pageIndex != 0) {
            currentPageNo = pageIndex;
        }

        System.out.println("queryFoodName servlet--------" + queryFoodName);
        System.out.println("query pageIndex--------- > " + pageIndex);

        //总数量（表）
        int totalCount = foodService.getCount(queryFoodName);
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

        HashMap<String, Object> resultMap = new HashMap<>();
        foodList = foodService.getList(queryFoodName, currentPageNo, pageSize);
        resultMap.put("foodList", foodList);
        resultMap.put("queryFoodName", queryFoodName);
        resultMap.put("totalPageCount", totalPageCount);
        resultMap.put("currentPageNo", currentPageNo);
        return resultMap;
    }


    @RequestMapping("del/{id}")
    public String delfood(@PathVariable("id") Integer id) {
        foodService.deleteById(id);
        return "redirect:/food/query1";
    }


    @RequestMapping("modify")
    @ResponseBody
    public Food modify(String id, HttpServletRequest request) {

        return foodService.getById(id);

    }

    @RequestMapping("modifyexe")
    public String modifyexe(HttpServletRequest request, Food food) {
        foodService.modify(food);
        return "redirect:/food/query1";


    }

    @RequestMapping("view")
    public String view(String id, HttpSession session) {
        Food food = foodService.getById(id);
        session.setAttribute("food", food);
        return "redirect:/foodabout.jsp";

    }

}