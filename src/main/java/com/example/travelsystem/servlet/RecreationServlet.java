package com.example.travelsystem.servlet;

import com.example.travelsystem.entity.Recreation;
import com.example.travelsystem.service.RecreationService;
import com.example.travelsystem.tools.Constants;
import com.example.travelsystem.tools.PageSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;


@Controller
@RequestMapping("/recreation")
public class RecreationServlet {
    @Autowired
    @Qualifier("recreationServiceImpl")
    RecreationService recreationService;


    @RequestMapping("add")
    public String add(HttpSession session, @RequestParam("img") MultipartFile[] img, Recreation recreation, BindingResult result) {
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
                    String newName = "recreation" + Constants.getFileName() + type;
                    //将文件保存
                    try {
                        img[i].transferTo(new File(realPath + "/" + newName));
                    } catch (IllegalStateException | IOException e) {
                        e.printStackTrace();
                    }
                    //将新的文件名存入数据库
                    if (i == 0) {
                        recreation.setImg1(newName);
                    } else if (i == 1) {
                        recreation.setImg2(newName);
                    } else {
                        recreation.setImg3(newName);
                    }
                }
            }
        }
        recreationService.add(recreation);
        return "redirect:/recreation/query1";


    }

    @RequestMapping("query1")
    public String query1(String queryrecreationName, Integer pageIndex, HttpServletRequest request) {
        //查询用户列表
        List<Recreation> recreationList = null;
        //设置页面容量
        int pageSize = Constants.pageSize;
        //当前页码
        int currentPageNo = 1;
        if (pageIndex != null && pageIndex != 0) {
            currentPageNo = pageIndex;
        }

        System.out.println("queryrecreationName servlet--------" + queryrecreationName);
        System.out.println("query pageIndex--------- > " + pageIndex);

        //总数量（表）
        int totalCount = recreationService.getCount(queryrecreationName);
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


        recreationList = recreationService.getList(queryrecreationName, currentPageNo, pageSize);
        request.setAttribute("recreationList", recreationList);
        request.setAttribute("queryrecreationName", queryrecreationName);
        request.setAttribute("totalPageCount", totalPageCount);
        request.setAttribute("currentPageNo", currentPageNo);
        return "manager/recreationlist";
    }

    @RequestMapping("query")
    @ResponseBody
    public HashMap<String, Object> query(String queryrecreationName, Integer pageIndex, HttpServletRequest request) {
        //查询用户列表
        List<Recreation> recreationList = null;
        //设置页面容量
        int pageSize = Constants.pageSize;
        //当前页码
        int currentPageNo = 1;
        if (pageIndex != null && pageIndex != 0) {
            currentPageNo = pageIndex;
        }

        System.out.println("queryrecreationName servlet--------" + queryrecreationName);
        System.out.println("query pageIndex--------- > " + pageIndex);

        //总数量（表）
        int totalCount = recreationService.getCount(queryrecreationName);
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
        recreationList = recreationService.getList(queryrecreationName, currentPageNo, pageSize);
        resultMap.put("recreationList", recreationList);
        resultMap.put("queryrecreationName", queryrecreationName);
        resultMap.put("totalPageCount", totalPageCount);
        resultMap.put("currentPageNo", currentPageNo);
        return resultMap;
    }

    @RequestMapping("del/{id}")
    public String delrecreation(@PathVariable("id") Integer id) {
        HashMap<String, String> resultMap = new HashMap<>();
        if (id <= 0) {
            resultMap.put("delResult", "notexist");
        } else {
            if (recreationService.deleteById(id)) {
                resultMap.put("delResult", "true");
            } else {
                resultMap.put("delResult", "false");
            }
        }
        return "redirect:/recreation/query1";
    }


    @RequestMapping("modify")
    @ResponseBody
    public Recreation modify(String id, HttpServletRequest request) {
        return recreationService.getById(id);
    }


    @RequestMapping("modifyexe")
    public String modifyexe(HttpServletRequest request, Recreation recreation) {
        recreationService.modify(recreation);
        return "redirect:/recreation/query1";
    }

    @RequestMapping("view")
    public String view(String id, HttpSession session) {
        Recreation recreation = recreationService.getById(id);
        session.setAttribute("recreation", recreation);
        return "redirect:/recreationabout.jsp";
    }

}