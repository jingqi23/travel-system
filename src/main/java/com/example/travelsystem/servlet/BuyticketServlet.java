package com.example.travelsystem.servlet;

import com.example.travelsystem.entity.Buyticket;
import com.example.travelsystem.entity.Scenicspot;
import com.example.travelsystem.entity.User;
import com.example.travelsystem.service.BuyTicketService;
import com.example.travelsystem.service.ScenicspotService;
import com.example.travelsystem.tools.Constants;
import com.example.travelsystem.tools.PageSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


@Controller
@RequestMapping("/buyticket")
public class BuyticketServlet {
    @Autowired
    @Qualifier("buyTicketServiceImpl")
    BuyTicketService buyticketService;
    @Autowired
    @Qualifier("scenicspotServiceImpl")
    ScenicspotService scenicspotService;


    @RequestMapping("add")
    public String add(HttpSession session, Buyticket buyticket, BindingResult result) {
        System.out.println("add()================");
        buyticket.setUid(((User) session.getAttribute("userSession")).getId());
        buyticket.setSdate(new Date());
        buyticketService.add(buyticket);
        return "redirect:/scenicspot.jsp";
    }

    @RequestMapping("query")
    @ResponseBody
    public HashMap<String, Object> query(HttpSession session) {
        //查询用户列表
        List<Buyticket> buyticketList;

        HashMap<String, Object> resultMap = new HashMap<>();
        buyticketList = buyticketService.getList("", ((User) session.getAttribute("userSession")).getId(), -1, 0, 1);
        resultMap.put("buyticketList", buyticketList);
        return resultMap;
    }

    @RequestMapping("query1")
    public String query1(String qqsid, Integer pageIndex, HttpServletRequest request) {
        //查询用户列表
        List<Buyticket> buyticketList = null;
        /*	List<Scenicspot> scenicspotList=null;*/
        //设置页面容量
        int pageSize = Constants.pageSize;
        //当前页码
        int currentPageNo = 1;
        if (pageIndex != null && pageIndex != 0) {
            currentPageNo = pageIndex;
        }

        System.out.println("qqsid servlet--------" + qqsid);
        System.out.println("query pageIndex--------- > " + pageIndex);

        //总数量（表）
        int totalCount = buyticketService.getCount(qqsid, 0);
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

        /*scenicspotList = scenicspotService.getList("",0, 1);*/
        buyticketList = buyticketService.getList(qqsid, -1, 0, currentPageNo, pageSize);
        request.setAttribute("buyticketList", buyticketList);
        request.setAttribute("qqsid", qqsid);
        request.setAttribute("totalPageCount", totalPageCount);
        request.setAttribute("currentPageNo", currentPageNo);
        return "manager/buyticketlist";
    }


    @RequestMapping("del/{id}")
    public String delBuyticket(@PathVariable("id") Integer id) {
        buyticketService.deleteById(id);
        return "redirect:/index.jsp";
    }


    @RequestMapping("modify")
    public String modify(Integer id, Integer check, HttpServletRequest request) {
        Buyticket buyticket = buyticketService.getById(id);
        buyticket.setCheck(check);
        if (check == 1 && "景点".equals(buyticket.getFenlei())) {
            List<Scenicspot> ss = scenicspotService.getList(buyticket.getSid(), 1, 10);
            if (ss != null && ss.size() > 0) {
                Scenicspot s = ss.get(0);
                s.setTnum(s.getTnum() - buyticket.getNum());
                scenicspotService.modify(s);
            }
        }
        buyticketService.modify(buyticket);
        return "redirect:/buyticket/query1";
    }

    @RequestMapping("query_a")
    @ResponseBody
    public Integer query_a() {
        //查询景点今天总卖出门票
        Integer num = buyticketService.getTodayTicket();
        if (num == null) {
            num = 1;
        }
        return num;
    }


    @RequestMapping("query_b")
    @ResponseBody
    public List<Map<String, Object>> query_b(String starttime, String endtime) {
        //查询景点卖出门票
        Map<String, Object> params = new HashMap<String, Object>();
        params.put("starttime", starttime);
        params.put("endtime", endtime);
        return buyticketService.getTickets(params);
    }


}