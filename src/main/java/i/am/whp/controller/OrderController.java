package i.am.whp.controller;

import i.am.whp.model.OrderDetailVo;
import i.am.whp.model.enums.Category;
import i.am.whp.model.enums.OrderState;
import i.am.whp.model.po.ConsigneeInfo;
import i.am.whp.model.po.ConsignorInfo;
import i.am.whp.model.po.OrderInfo;
import i.am.whp.service.InfoService;
import i.am.whp.service.OrderService;
import i.am.whp.util.GenerateOrderID;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.sql.Timestamp;
import java.util.Date;
import java.util.List;
import java.util.Objects;


@Controller
public class OrderController {
    @Autowired
    OrderService orderService;
    @Autowired
    InfoService infoService;

    @RequestMapping("/book")
    public String book(HttpSession session, Model model) {
        String username = (String) session.getAttribute("username");
        if (username != null) {
            //只显示5条
            List<ConsigneeInfo> consigneeInfos = orderService.queryConsigneeInfo(username);
            model.addAttribute("consigneeInfos", consigneeInfos.subList(0, consigneeInfos.size() > 5 ? 5 : consigneeInfos.size()));
            List<ConsignorInfo> consignorInfos = orderService.queryConsignorInfo(username);
            model.addAttribute("consignorInfos", consignorInfos.subList(0, consignorInfos.size() > 5 ? 5 : consignorInfos.size()));
        }
        return "book";
    }

    @RequestMapping("/addNewOrder")
    public String addNewOrder(String consignorName, String consignorPhone, String sendAddress, String sendZip,
                              String consigneeName, String consigneePhone, String reachAddress, String reachZip,
                              String totalweight, String totalprice, String category,
                              HttpSession session) {
        String username = (String) session.getAttribute("username");

        //如果未登陆添加不成功
        if (username == null || "".equals(username)) {
            return "error/notlogin";
        }

        //发货人
        ConsignorInfo consignorInfo = new ConsignorInfo();
        consignorInfo.setUsername(username);
        consignorInfo.setConsignorname(consignorName);
        consignorInfo.setConsignorphone(consignorPhone);
        consignorInfo.setSendaddress(sendAddress);
        consignorInfo.setZipcode(Integer.parseInt(sendZip));

        //查看是否存在 对应的收货信息 是就返回这个id
        Integer consignorId = orderService.isExistConsignorInfo(consignorInfo);
        if (consignorId == null) {
//            //如果已经存在5条 删除最老的
//            List<ConsignorInfo> consignorInfos = orderService.queryConsignorInfo(username);
//            if (consignorInfos.size() >= 5) {
//                orderService.delConsigneeInfo(consignorInfos.stream().map(ConsignorInfo::getConsignorid).collect(toList()).stream().min(Integer::compareTo).get());
//            }
            consignorId = orderService.addConsignorInfo(consignorInfo);
        }

        //收货人
        ConsigneeInfo consigneeInfo = new ConsigneeInfo();
        consigneeInfo.setUsername(username);
        consigneeInfo.setConsigneename(consigneeName);
        consigneeInfo.setConsigneephone(consigneePhone);
        consigneeInfo.setReachaddress(reachAddress);
        consigneeInfo.setZipcode(Integer.parseInt(reachZip));

        Integer consigneeId = orderService.isExistConsigneeInfo(consigneeInfo);
        if (consigneeId == null) {
//            //如果已经存在5条 删除最老的
//            List<ConsigneeInfo> consigneeInfos = orderService.queryConsigneeInfo(username);
//            if (consigneeInfos.size() >= 5) {
//                orderService.delConsigneeInfo(consigneeInfos.stream().map(ConsigneeInfo::getConsigneeid).collect(toList()).stream().min(Integer::compareTo).get());
//            }
            consigneeId = orderService.addConsigneeInfo(consigneeInfo);
        }
        //订单信息
        long generateOrderID = GenerateOrderID.generateOrderID();

        OrderInfo orderInfo = new OrderInfo();

        orderInfo.setOrderid(generateOrderID);
        orderInfo.setUsername(username);
        orderInfo.setGoodswt(Float.parseFloat(totalweight));
        orderInfo.setPostage(Float.parseFloat(totalprice));

        orderInfo.setCategory(Category.valueOfDetatl(category).getState());
        orderInfo.setConsignorid(consignorId);
        orderInfo.setConsigneeid(consigneeId);
        orderInfo.setOrdertime((new Timestamp(new Date().getTime())));
        orderInfo.setOrderstate(OrderState.daizhifu.getState());

        orderService.addNewOrder(orderInfo);

        return "redirect:booksuccess?orderid=" + generateOrderID;
    }

    //查询订单
    @RequestMapping("/order")
    public String order(String pageNum, HttpSession session, Model model) {
        String loginsuccess = (String) session.getAttribute("loginsuccess");
        if (loginsuccess != null && loginsuccess.equals("true")) {
            //当前页 pagenum
            int pagenum;
            if (pageNum == null || pageNum.equals("")) {
                pagenum = 1;
            } else {
                pagenum = Integer.parseInt(pageNum);
            }
            model.addAttribute("pagenum", pagenum);
            String username = (String) session.getAttribute("username");
            List<OrderInfo> orderInfos = orderService.queryOrder(username);
            //页面大小 pageSize
            int pageSize = 5;
            //总页数 pageTotal
            int pageTotal = orderInfos.size() / pageSize == 0 ? orderInfos.size() / pageSize : orderInfos.size() / pageSize + 1;
            model.addAttribute("pageTotal", pageTotal);
            //当前页 pageNum
            List<OrderInfo> orderInfos1 = orderInfos.subList(pageSize * (pagenum - 1), pagenum * 5 < orderInfos.size() ? pagenum * 5 : orderInfos.size());
            model.addAttribute("orderInfos", orderInfos1);
            return "ordercenter/order";
        } else {
            return "error/notlogin";
        }
    }

    //删除订单
    @RequestMapping("/deleteorder")
    public String deleteorder(String delid) {
        orderService.deleteOrder(Long.parseLong(delid));
        return "redirect:/order";
    }

    @RequestMapping("/orderdetail")
    public String orderdetail(String orderid, HttpSession session, Model model) {
        String loginsuccess = (String) session.getAttribute("loginsuccess");
        if (loginsuccess != null && loginsuccess.equals("true")) {
            if (orderid != null && !orderid.equals("")) {
                OrderDetailVo orderDetailVo = orderService.queryOderDetail(Long.parseLong(orderid));
                String username = (String) session.getAttribute("username");
                if (orderDetailVo != null && username.equals(orderDetailVo.getUsername())) {
                    orderDetailVo.setCategory(Objects.requireNonNull(Category.valueOf(Integer.parseInt(orderDetailVo.getCategory()))).getDetail());
                    orderDetailVo.setOrderstate(Objects.requireNonNull(OrderState.valueOf(Integer.parseInt(orderDetailVo.getOrderstate()))).getDetail());
                    model.addAttribute("orderDetail", orderDetailVo);
                }
            }
            return "ordercenter/orderdetail";
        } else {
            return "error/notlogin";
        }
    }

    @RequestMapping("/consigninfo")
    public String consigninfo(HttpSession session, Model model) {
        String loginsuccess = (String) session.getAttribute("loginsuccess");
        if (loginsuccess != null && loginsuccess.equals("true")) {
            String username = (String) session.getAttribute("username");
            List<ConsigneeInfo> consigneeInfos = orderService.queryConsigneeInfo(username);
            //只显示5条
            model.addAttribute("consigneeInfos", consigneeInfos.subList(0, consigneeInfos.size() > 5 ? 5 : consigneeInfos.size()));
            List<ConsignorInfo> consignorInfos = orderService.queryConsignorInfo(username);
            model.addAttribute("consignorInfos", consignorInfos.subList(0, consignorInfos.size() > 5 ? 5 : consignorInfos.size()));
            return "ordercenter/consign";
        } else {
            return "error/notlogin";
        }
    }

    @RequestMapping("/delConsigneeInfo")
    public String delConsigneeInfo(String consigneeid) {
        orderService.delConsigneeInfo(Integer.parseInt(consigneeid));
        return "redirect:/consigninfo";
    }

    @RequestMapping("/delConsignorInfo")
    public String delConsignorInfo(String consignorid) {
        orderService.delConsignorInfo(Integer.parseInt(consignorid));
        return "redirect:/consigninfo";
    }

    @RequestMapping("/queryConsigneeInfoById")
    public String queryConsigneeInfoById(String consigneeid, Model model, HttpSession session) {
        ConsigneeInfo consigneeInfo = orderService.queryConsigneeInfoById(Integer.parseInt(consigneeid));
        model.addAttribute("consigneeInfo", consigneeInfo);
        String username = (String) session.getAttribute("username");
        List<ConsigneeInfo> consigneeInfos = orderService.queryConsigneeInfo(username);
        model.addAttribute("consigneeInfos", consigneeInfos);
        List<ConsignorInfo> consignorInfos = orderService.queryConsignorInfo(username);
        model.addAttribute("consignorInfos", consignorInfos);
        return "ordercenter/consign";
    }

    @RequestMapping("/queryConsignorInfoById")
    public String queryConsignorInfoById(String consignorid, Model model, HttpSession session) {
        ConsignorInfo consignorInfo = orderService.queryConsignorInfoById(Integer.parseInt(consignorid));
        model.addAttribute("consignorInfo", consignorInfo);
        String username = (String) session.getAttribute("username");
        List<ConsigneeInfo> consigneeInfos = orderService.queryConsigneeInfo(username);
        model.addAttribute("consigneeInfos", consigneeInfos);
        List<ConsignorInfo> consignorInfos = orderService.queryConsignorInfo(username);
        model.addAttribute("consignorInfos", consignorInfos);
        return "ordercenter/consign";
    }

    @RequestMapping("/editConsigneeInfo")
    @ResponseBody
    public String editConsigneeInfo(String editconsigneeid, String editconsigneename, String editconsigneephone, String editreachaddress, String editzipcodeee) {
        ConsigneeInfo consigneeInfo = new ConsigneeInfo();
        consigneeInfo.setConsigneeid(Integer.parseInt(editconsigneeid));
        consigneeInfo.setConsigneename(editconsigneename);
        consigneeInfo.setConsigneephone(editconsigneephone);
        consigneeInfo.setReachaddress(editreachaddress);
        consigneeInfo.setZipcode(Integer.parseInt(editzipcodeee));
        orderService.updateConsigneeInfo(consigneeInfo);
        return "xgcg";
    }

    @RequestMapping("/editConsignorInfo")
    @ResponseBody
    public String editConsignorInfo(String editconsignorid, String editconsignorname, String editconsignorphone, String editsendaddress, String editzipcodeor) {
        ConsignorInfo consignorInfo = new ConsignorInfo();
        consignorInfo.setConsignorid(Integer.parseInt(editconsignorid));
        consignorInfo.setConsignorname(editconsignorname);
        consignorInfo.setConsignorphone(editconsignorphone);
        consignorInfo.setSendaddress(editsendaddress);
        consignorInfo.setZipcode(Integer.parseInt(editzipcodeor));
        orderService.updateConsignorInfo(consignorInfo);
        return "xgcg";
    }

}
