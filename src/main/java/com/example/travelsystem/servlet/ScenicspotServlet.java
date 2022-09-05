package com.example.travelsystem.servlet;

import com.example.travelsystem.entity.Scenicspot;
import com.example.travelsystem.service.ScenicspotService;
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
@RequestMapping("/scenicspot")
public class ScenicspotServlet {
    @Autowired
    @Qualifier("scenicspotServiceImpl")
    ScenicspotService scenicspotService;


    @RequestMapping("add")
    public String add(HttpSession session, @RequestParam("img") MultipartFile[] img, Scenicspot scenicspot, BindingResult result) {
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
                    String newName = "pri" + Constants.getFileName() + type;
                    //将文件保存
                    try {
                        img[i].transferTo(new File(realPath + "/" + newName));
                    } catch (IllegalStateException | IOException e) {
                        e.printStackTrace();
                    }
                    //将新的文件名存入数据库
                    if (i == 0) {
                        scenicspot.setImg1(newName);
                    } else if (i == 1) {
                        scenicspot.setImg2(newName);
                    } else {
                        scenicspot.setImg3(newName);
                    }
                }
            }
        }
        scenicspotService.add(scenicspot);
        return "redirect:/scenicspot/query1";


    }

    @RequestMapping("query1")
    public String query1(String queryScenicspotName, Integer pageIndex, HttpServletRequest request) {
        //查询用户列表
        List<Scenicspot> scenicspotList;
        //设置页面容量
        int pageSize = Constants.pageSize;
        //当前页码
        int currentPageNo = 1;
        if (pageIndex != null && pageIndex != 0) {
            currentPageNo = pageIndex;
        }

        System.out.println("queryScenicspotName servlet--------" + queryScenicspotName);
        System.out.println("query pageIndex--------- > " + pageIndex);

        //总数量（表）
        int totalCount = scenicspotService.getCount(queryScenicspotName);
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

        scenicspotList = scenicspotService.getList(queryScenicspotName, currentPageNo, pageSize);
        request.setAttribute("scenicspotList", scenicspotList);
        request.setAttribute("queryScenicspotName", queryScenicspotName);
        request.setAttribute("totalPageCount", totalPageCount);
        request.setAttribute("totalCount", totalCount);
        request.setAttribute("currentPageNo", currentPageNo);
        return "manager/scenicspotlist";
    }

    @RequestMapping("query")
    @ResponseBody
    public HashMap<String, Object> query(String queryScenicspotName, Integer pageIndex, HttpServletRequest request) {
        //查询用户列表
        List<Scenicspot> scenicspotList;
        //设置页面容量
        int pageSize = Constants.pageSize;
        //当前页码
        int currentPageNo = 1;
        if (pageIndex != null && pageIndex != 0) {
            currentPageNo = pageIndex;
        }

        System.out.println("queryScenicspotName servlet--------" + queryScenicspotName);
        System.out.println("query pageIndex--------- > " + pageIndex);

        //总数量（表）
        int totalCount = scenicspotService.getCount(queryScenicspotName);
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
        scenicspotList = scenicspotService.getList(queryScenicspotName, currentPageNo, pageSize);
        resultMap.put("scenicspotList", scenicspotList);
        resultMap.put("queryScenicspotName", queryScenicspotName);
        resultMap.put("totalPageCount", totalPageCount);
        resultMap.put("currentPageNo", currentPageNo);
        return resultMap;
    }


    @RequestMapping("del/{id}")
    public String delscenicspot(@PathVariable("id") Integer id) {
        HashMap<String, String> resultMap = new HashMap<>();

        scenicspotService.deleteById(id);
        return "redirect:/scenicspot/query1";
    }


    @RequestMapping("modify")
    @ResponseBody
    public Scenicspot modify(String id, HttpServletRequest request) {

        Scenicspot scenicspot = scenicspotService.getById(id);
        return scenicspot;


    }

    @RequestMapping("modifyexe")
    public String modifyexe(HttpServletRequest request, Scenicspot scenicspot) {
        scenicspotService.modify(scenicspot);
        return "redirect:/scenicspot/query1";

    }

    @RequestMapping("view")
    public String view(String id, HttpSession session) {
        Scenicspot scenicspot = scenicspotService.getById(id);
        //点击加1
        scenicspot.setDianji(scenicspot.getDianji() + 1);
        scenicspotService.modify(scenicspot);
        session.setAttribute("scenicspot", scenicspot);
        return "redirect:/scenicspotabout.jsp";

    }

}