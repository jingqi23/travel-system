package com.example.travelsystem.servlet;

import com.example.travelsystem.entity.Tuan;
import com.example.travelsystem.entity.Tuanxi;
import com.example.travelsystem.service.TuanService;
import com.example.travelsystem.service.TuanxiService;
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
import java.util.Map;


@Controller
@RequestMapping("/tuan")
public class TuanServlet {
    @Autowired
    @Qualifier("tuanServiceImpl")
    TuanService tuanService;

    @Autowired
    @Qualifier("tuanxiServiceImpl")
    TuanxiService tuanxiService;

    @RequestMapping("tuanxiadd")
    public String tuanxiadd(Tuanxi tuanxi) {
        Map<String, Object> params = new HashMap<>();
        params.put("tid", tuanxi.getTid());
        params.put("uid", tuanxi.getUid());

        if (tuanxiService.getCount(params) > 0) {
        } else {
            tuanxiService.add(tuanxi);
        }
        return "redirect:/tuan/view?id=" + tuanxi.getTid();

    }

    @RequestMapping("add")
    public String add(HttpSession session, @RequestParam("pic") MultipartFile[] img, Tuan tuan, BindingResult result) {
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
                    String newName = "tuan" + Constants.getFileName() + type;
                    //将文件保存
                    try {
                        img[i].transferTo(new File(realPath + "/" + newName));
                    } catch (IllegalStateException | IOException e) {
                        e.printStackTrace();
                    }
                    //将新的文件名存入数据库
                    if (i == 0) {
                        tuan.setPic(newName);
                    }
                }
            }
        }
        tuanService.add(tuan);
        return "redirect:/tuan/query1";
    }

    @RequestMapping("query1")
    public String query1(String queryTuanName, Integer pageIndex, HttpServletRequest request) {
        //查询用户列表
        List<Tuan> tuanList;
        //设置页面容量
        int pageSize = Constants.pageSize;
        //当前页码
        int currentPageNo = 1;
        if (pageIndex != null && pageIndex != 0) {
            currentPageNo = pageIndex;
        }

        System.out.println("queryTuanName servlet--------" + queryTuanName);
        System.out.println("query pageIndex--------- > " + pageIndex);

        //总数量（表）
        int totalCount = tuanService.getCount(queryTuanName);
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


        tuanList = tuanService.getList(queryTuanName, currentPageNo, pageSize);
        request.setAttribute("tuanList", tuanList);
        request.setAttribute("queryTuanName", queryTuanName);
        request.setAttribute("totalPageCount", totalPageCount);
        request.setAttribute("totalCount", totalCount);
        request.setAttribute("currentPageNo", currentPageNo);
        return "manager/tuanlist";
    }

    @RequestMapping("query")
    @ResponseBody
    public HashMap<String, Object> query(String queryTuanName, Integer pageIndex, HttpServletRequest request) {
        //查询用户列表
        List<Tuan> tuanList = null;
        //设置页面容量
        int pageSize = Constants.pageSize;
        //当前页码
        int currentPageNo = 1;
        if (pageIndex != null && pageIndex != 0) {
            currentPageNo = pageIndex;
        }

        System.out.println("queryTuanName servlet--------" + queryTuanName);
        System.out.println("query pageIndex--------- > " + pageIndex);

        //总数量（表）
        int totalCount = tuanService.getCount(queryTuanName);
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
        tuanList = tuanService.getList(queryTuanName, currentPageNo, pageSize);
        resultMap.put("tuanList", tuanList);
        resultMap.put("queryTuanName", queryTuanName);
        resultMap.put("totalPageCount", totalPageCount);
        resultMap.put("currentPageNo", currentPageNo);
        return resultMap;
    }


    @RequestMapping("del/{id}")
    public String deltuan(@PathVariable("id") Integer id) {
        tuanService.deleteById(id);
        return "redirect:/tuan/query1";
    }

    @RequestMapping("modify")
    @ResponseBody
    public Tuan modify(String id, HttpServletRequest request) {
        return tuanService.getById(id);
    }

    @RequestMapping("modifyexe")
    public String modifyexe(HttpServletRequest request, Tuan tuan) {
        tuanService.modify(tuan);
        return "redirect:/tuan/query1";
    }

    @RequestMapping("view")
    public String view(String id, HttpSession session) {
        Tuan tuan = tuanService.getById(id);
        session.setAttribute("tuan", tuan);
        return "redirect:/tuanabout.jsp";
    }

}