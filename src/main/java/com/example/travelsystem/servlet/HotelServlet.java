package com.example.travelsystem.servlet;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.example.travelsystem.entity.Hotel;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.example.travelsystem.service.HotelService;
import com.example.travelsystem.tools.Constants;
import com.example.travelsystem.tools.PageSupport;


@Controller
@RequestMapping("/grogshop")
public class HotelServlet {
    @Autowired
    @Qualifier("hotelServiceImpl")
    HotelService hotelService;


    @RequestMapping("add")
    public String add(HttpSession session, @RequestParam("img") MultipartFile[] img, Hotel hotel, BindingResult result) {
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
                    String newName = "grogshop" + Constants.getFileName() + type;
                    //将文件保存
                    try {
                        img[i].transferTo(new File(realPath + "/" + newName));
                    } catch (IllegalStateException | IOException e) {
                        e.printStackTrace();
                    }
                    //将新的文件名存入数据库
                    if (i == 0) {
                        hotel.setImg1(newName);
                    } else if (i == 1) {
                        hotel.setImg2(newName);
                    } else {
                        hotel.setImg3(newName);
                    }
                }
            }
        }
        hotelService.add(hotel);
        return "redirect:/grogshop/query1";


    }

    @RequestMapping("query1")
    public String query1(String queryHotelName, Integer pageIndex, HttpServletRequest request) {
        //查询用户列表
        List<Hotel> hotelList;
        //设置页面容量
        int pageSize = Constants.pageSize;
        //当前页码
        int currentPageNo = 1;
        if (pageIndex != null && pageIndex != 0) {
            currentPageNo = pageIndex;
        }

        System.out.println("queryHotelName servlet--------" + queryHotelName);
        System.out.println("query pageIndex--------- > " + pageIndex);

        //总数量（表）
        int totalCount = hotelService.getCount(queryHotelName);
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


        hotelList = hotelService.getList(queryHotelName, currentPageNo, pageSize);
        request.setAttribute("grogshopList", hotelList);
        request.setAttribute("queryHotelName", queryHotelName);
        request.setAttribute("totalPageCount", totalPageCount);
        request.setAttribute("currentPageNo", currentPageNo);
        return "manager/grogshoplist";
    }

    @RequestMapping("query")
    @ResponseBody
    public HashMap<String, Object> query(String queryHotelName, Integer pageIndex, HttpServletRequest request) {
        //查询用户列表
        List<Hotel> hotelList = null;
        //设置页面容量
        int pageSize = Constants.pageSize;
        //当前页码
        int currentPageNo = 1;
        if (pageIndex != null && pageIndex != 0) {
            currentPageNo = pageIndex;
        }

        System.out.println("queryHotelName servlet--------" + queryHotelName);
        System.out.println("query pageIndex--------- > " + pageIndex);

        //总数量（表）
        int totalCount = hotelService.getCount(queryHotelName);
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
        HashMap<String, Object> resultMap = new HashMap<String, Object>();
        hotelList = hotelService.getList(queryHotelName, currentPageNo, pageSize);
        resultMap.put("grogshopList", hotelList);
        resultMap.put("queryHotelName", queryHotelName);
        resultMap.put("totalPageCount", totalPageCount);
        resultMap.put("currentPageNo", currentPageNo);
        return resultMap;
    }


    @RequestMapping("del/{id}")
    public String delHotel(@PathVariable("id") Integer id) {
        HashMap<String, String> resultMap = new HashMap<>();
        if (id <= 0) {
            resultMap.put("delResult", "notexist");
        } else {
            if (hotelService.deleteById(id)) {
                resultMap.put("delResult", "true");
            } else {
                resultMap.put("delResult", "false");
            }
        }
        return "redirect:/grogshop/query1";
    }


    @RequestMapping("modify")
    @ResponseBody
    public Hotel modify(String id, HttpServletRequest request) {
        Hotel hotel = hotelService.getById(id);
        return hotel;

    }


    @RequestMapping("modifyexe")
    public String modifyexe(HttpServletRequest request, Hotel hotel) {
        hotelService.modify(hotel);
        return "redirect:/grogshop/query1";

    }


    @RequestMapping("view")
    public String view(String id, HttpSession session) {
        Hotel hotel = hotelService.getById(id);
        session.setAttribute("grogshop", hotel);
        return "redirect:/indexabout.jsp";
    }

}