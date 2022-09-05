package com.example.travelsystem.servlet;


import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.example.travelsystem.entity.Pricture;
import com.example.travelsystem.entity.Scenicspot;
import com.example.travelsystem.entity.User;
import com.example.travelsystem.service.PrictureService;
import com.example.travelsystem.service.ScenicspotService;
import com.example.travelsystem.tools.Constants;
import com.example.travelsystem.tools.PageSupport;


@Controller
@RequestMapping("/pricture")
public class PrictureServlet {
    @Autowired
    @Qualifier("prictureServiceImpl")
    PrictureService prictureService;
    @Autowired
    @Qualifier("scenicspotServiceImpl")
    ScenicspotService scenicspotService;


    @RequestMapping("add")
    public String add(HttpSession session, MultipartFile pricturefiles, Pricture pricture, BindingResult result) {
        System.out.println("add()================");
        pricture.setUser((User) session.getAttribute("userSession"));
        //开始进行文件上传
        if (!pricturefiles.isEmpty()) {
            //得到服务器的真实路径
            String realPath = session.getServletContext().getRealPath("/images");
            //得到上传的文件名称
            String oname = pricturefiles.getOriginalFilename();
            //判断文件的类型（控制上传文件的类型）
            String type = oname.substring(oname.lastIndexOf("."));
            if (type.equalsIgnoreCase(".jpg") || type.equalsIgnoreCase(".gif") || type.equalsIgnoreCase(".png")) {
                String newName = "pri" + Constants.getFileName() + type;
                //将文件保存
                try {
                    pricturefiles.transferTo(new File(realPath + "/" + newName));
                } catch (IllegalStateException | IOException e) {
                    e.printStackTrace();
                }
                //将新的文件名存入数据库
                pricture.setImg(newName);
            }
        }
        prictureService.add(pricture);
        return "redirect:/pricture.jsp";
    }


    @RequestMapping("query")
    @ResponseBody
    public HashMap<String, Object> query(Integer pageIndex, HttpServletRequest request) {
        //查询用户列表
        List<Pricture> prictureList = null;
        List<Scenicspot> scenicspotList = null;
        //设置页面容量
        int pageSize = 12;
        //当前页码
        int currentPageNo = 1;
        if (pageIndex != null && pageIndex != 0) {
            currentPageNo = pageIndex;
        }
        User user = (User) request.getSession().getAttribute("userSession");
        System.out.println("query pageIndex--------- > " + pageIndex);

        //总数量（表）
        int totalCount = prictureService.getCount();
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
        prictureList = prictureService.getList(currentPageNo, pageSize);
        scenicspotList = scenicspotService.getList("", 0, 1);
        resultMap.put("scenicspotList", scenicspotList);
        resultMap.put("prictureList", prictureList);
        resultMap.put("totalPageCount", totalPageCount);
        resultMap.put("currentPageNo", currentPageNo);
        resultMap.put("user", user);
        return resultMap;
    }

    @RequestMapping("del/{id}")
    public String delpricture(@PathVariable("id") Integer id) {
        prictureService.deleteById(id);
        return "redirect:/pricture.jsp";
    }

    @RequestMapping("view")
    public String view(String id, HttpSession session) {
        Pricture pricture = prictureService.getById(id);
        session.setAttribute("pricture", pricture);
        return "redirect:/about.jsp";

    }

}