package i.am.whp.controller;

import i.am.whp.model.OrderDetailVo;
import i.am.whp.model.enums.Category;
import i.am.whp.model.enums.OrderState;
import i.am.whp.model.enums.Role;
import i.am.whp.model.enums.VehicleState;
import i.am.whp.model.po.*;
import i.am.whp.service.LogisticsService;
import i.am.whp.service.OrderService;
import i.am.whp.service.UserService;
import i.am.whp.service.VehicleService;
import i.am.whp.util.Md5Util;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;
import java.util.stream.Collectors;


@Controller
public class BackstageController {
    @Autowired
    UserService userService;
    @Autowired
    OrderService orderService;
    @Autowired
    VehicleService vehicleService;
    @Autowired
    LogisticsService logisticsService;

    //--------------------登录--------------------
    @RequestMapping("/checkadmin")
    @ResponseBody
    public String checkadmin(String adminname, String adminpwd, HttpSession session) {
        User user = userService.queryUser(adminname);
        if (user == null || user.getRole() == Role.user.getRole()) {
            return "notadmin";
        }
        //管理员登录
        if (user.getPassword().equals(Md5Util.MD5(adminpwd))) {
            //更新登录时间
            user.setLogintime(new Timestamp(System.currentTimeMillis()));
            userService.updateUserInfo(user);
            //登录成功 判断角色 存储session
            session.setAttribute("backstage", adminname);
            //如果是管理员
            if (user.getRole() == Role.admin.getRole()) {
                return "admindlcg";
            } else {
                //如果是运输员
                return "transporterdlcg";
            }
        } else {
            return "mmcw";
        }
    }

    //------------------用户管理--------------------
    @RequestMapping("/getAllUser")
    public String getAllUser(Model model) {
        List<User> allUser = userService.getAllUser();
        model.addAttribute("allUser", allUser);
        return "admin/alluser";
    }

    @RequestMapping("/doAddUser")
    public String doAddUser(String username, String role, String mobile, String email, String address) {
        User newUser = new User();
        newUser.setUsername(username);
        newUser.setPassword(Md5Util.MD5(username));
        newUser.setMobile(mobile);
        newUser.setEmail(email);
        newUser.setRole(Integer.parseInt(role));
        newUser.setAddress(address);
        newUser.setRegtime(new Timestamp(System.currentTimeMillis()));
        userService.addUser(newUser);
        return "redirect:/getAllUser";
    }

    @RequestMapping("/editPre")
    public String editPre(String username, Model model) {
        User edituser = userService.queryUser(username);
        model.addAttribute("edituser", edituser);
        return "admin/edituser";
    }

    @RequestMapping("/doEditUser")
    public String doEditUser(String username, String mobile, String email, String address) {
        User doedituser = userService.queryUser(username);
        doedituser.setMobile(mobile);
        doedituser.setEmail(email);
        doedituser.setAddress(address);
        userService.updateUserInfo(doedituser);
        return "redirect:/getAllUser";
    }

    //-------------------订单管理----------------------
    @RequestMapping("/getAllOrder")
    public String getAllOrder(String pageNum, String pageSize, Model model) {
        int pagenum;
        if (pageNum == null || pageNum.equals("")) {
            pagenum = 1;
        } else {
            pagenum = Integer.parseInt(pageNum);
        }
        int pagesize;
        if (pageSize == null || pageSize.equals("")) {
            pagesize = 5;
        } else {
            pagesize = Integer.parseInt(pageSize);
        }
        List<OrderInfo> allOrder = orderService.getAllOrder();
        int pageTotal = allOrder.size() % pagesize == 0 ? allOrder.size() / pagesize : allOrder.size() / pagesize + 1;
        model.addAttribute("pageTotal", pageTotal);
        model.addAttribute("pagenum", pagenum);
        model.addAttribute("pagesize", pagesize);
        List<OrderDetailVo> orderDetailVos = new ArrayList<>();
        for (OrderInfo orderInfo : allOrder) {
            OrderDetailVo orderDetailVo = new OrderDetailVo();
            orderDetailVo.setOrderid(orderInfo.getOrderid());
            orderDetailVo.setUsername(orderInfo.getUsername());
            orderDetailVo.setGoodswt(orderInfo.getGoodswt());
            orderDetailVo.setPostage(orderInfo.getPostage());
            orderDetailVo.setCategory(Objects.requireNonNull(Category.valueOf(orderInfo.getCategory())).getDetail());
            orderDetailVo.setOrderstate(Objects.requireNonNull(OrderState.valueOf(orderInfo.getOrderstate())).getDetail());
            orderDetailVo.setOrdertime(orderInfo.getOrdertime());
            orderDetailVos.add(orderDetailVo);
        }
        model.addAttribute("allOrder", orderDetailVos.subList((pagenum - 1) * pagesize,
                pagenum * pagesize < orderDetailVos.size() ? pagenum * pagesize : orderDetailVos.size()));
        return "admin/allorder";
    }

    @RequestMapping("/daiLanjian")
    public String daiLanjian(String pageNum, String pageSize, Model model) {
        int pagenum;
        if (pageNum == null || pageNum.equals("")) {
            pagenum = 1;
        } else {
            pagenum = Integer.parseInt(pageNum);
        }
        int pagesize;
        if (pageSize == null || pageSize.equals("")) {
            pagesize = 5;
        } else {
            pagesize = Integer.parseInt(pageSize);
        }
        List<OrderInfo> allOrder = orderService.getAllOrderByState(OrderState.dailanjian.getState());
        int pageTotal = allOrder.size() % pagesize == 0 ? allOrder.size() / pagesize : allOrder.size() / pagesize + 1;
        model.addAttribute("pageTotal", pageTotal);
        model.addAttribute("pagenum", pagenum);
        model.addAttribute("pagesize", pagesize);
        List<OrderDetailVo> orderDetailVos = new ArrayList<>();
        for (OrderInfo orderInfo : allOrder) {
            OrderDetailVo orderDetailVo = new OrderDetailVo();
            orderDetailVo.setOrderid(orderInfo.getOrderid());
            orderDetailVo.setUsername(orderInfo.getUsername());
            orderDetailVo.setGoodswt(orderInfo.getGoodswt());
            orderDetailVo.setPostage(orderInfo.getPostage());
            orderDetailVo.setCategory(Objects.requireNonNull(Category.valueOf(orderInfo.getCategory())).getDetail());
            orderDetailVo.setOrderstate("待揽件");
            orderDetailVo.setOrdertime(orderInfo.getOrdertime());
            orderDetailVos.add(orderDetailVo);
        }
        model.addAttribute("allOrder", orderDetailVos.subList((pagenum - 1) * pagesize,
                pagenum * pagesize < orderDetailVos.size() ? pagenum * pagesize : orderDetailVos.size()));
        return "admin/daiorder";
    }

    @RequestMapping("/yiWancheng")
    public String yiWancheng(String pageNum, String pageSize, Model model) {
        int pagenum;
        if (pageNum == null || pageNum.equals("")) {
            pagenum = 1;
        } else {
            pagenum = Integer.parseInt(pageNum);
        }
        int pagesize;
        if (pageSize == null || pageSize.equals("")) {
            pagesize = 5;
        } else {
            pagesize = Integer.parseInt(pageSize);
        }
        List<OrderInfo> allOrder = orderService.getAllOrderByState(OrderState.yiwancheng.getState());
        int pageTotal = allOrder.size() % pagesize == 0 ? allOrder.size() / pagesize : allOrder.size() / pagesize + 1;
        model.addAttribute("pageTotal", pageTotal);
        model.addAttribute("pagenum", pagenum);
        model.addAttribute("pagesize", pagesize);
        List<OrderDetailVo> orderDetailVos = new ArrayList<>();
        for (OrderInfo orderInfo : allOrder) {
            OrderDetailVo orderDetailVo = new OrderDetailVo();
            orderDetailVo.setOrderid(orderInfo.getOrderid());
            orderDetailVo.setUsername(orderInfo.getUsername());
            orderDetailVo.setGoodswt(orderInfo.getGoodswt());
            orderDetailVo.setPostage(orderInfo.getPostage());
            orderDetailVo.setCategory(Objects.requireNonNull(Category.valueOf(orderInfo.getCategory())).getDetail());
            orderDetailVo.setOrderstate("已完成");
            orderDetailVo.setOrdertime(orderInfo.getOrdertime());
            orderDetailVos.add(orderDetailVo);
        }
        model.addAttribute("allOrder", orderDetailVos.subList((pagenum - 1) * pagesize,
                pagenum * pagesize < orderDetailVos.size() ? pagenum * pagesize : orderDetailVos.size()));
        return "admin/yiorder";
    }

    @RequestMapping("/delorde")
    public String deleteorder(String delid) {
        orderService.deleteOrder(Long.parseLong(delid));
        return "redirect:/yiWancheng";
    }

    @RequestMapping("/adminOrderdetail")
    public String adminOrderdetail(String orderid, Model model) {
        if (orderid != null && !orderid.equals("")) {
            OrderDetailVo orderDetailVo = orderService.queryOderDetail(Long.parseLong(orderid));
            if (orderDetailVo != null) {
                orderDetailVo.setCategory(Objects.requireNonNull(Category.valueOf(Integer.parseInt(orderDetailVo.getCategory()))).getDetail());
                orderDetailVo.setOrderstate(Objects.requireNonNull(OrderState.valueOf(Integer.parseInt(orderDetailVo.getOrderstate()))).getDetail());
            }
            model.addAttribute("orderDetail", orderDetailVo);
        }
        return "admin/orderdetail";
    }

    //---------------------车辆管理-----------------------
    @RequestMapping("/getAllVehicle")
    public String getAllVehicle(Model model) {
        List<Vehicle> allVehicles = vehicleService.getAllVehicles();
        model.addAttribute("allVehicle", allVehicles);
        return "admin/allvehicle";
    }

    @RequestMapping("/editVehicle")
    public String editVehicle(String vehicleid, Model model) {
        Vehicle editvehicle = vehicleService.getVehicleById(vehicleid);
        model.addAttribute("editvehicle", editvehicle);
        return "admin/editvehicle";
    }

    @RequestMapping("/doEditVehicle")
    public String doEditVehicle(String vehicleid, String nowplace, String owner, String driver) {
        Vehicle vehicle = new Vehicle();
        vehicle.setVehicleid(vehicleid);
        vehicle.setNowplace(nowplace);
        vehicle.setOwner(owner);
        vehicle.setDriver(driver);
        vehicleService.updateVehicle(vehicle);
        return "redirect:/getAllVehicle";
    }

    @RequestMapping("/delvehicle")
    public String delvehicle(String vehicleid, Model model) {
        vehicleService.deleteVehicle(vehicleid);
        return "redirect:/getAllVehicle";
    }

    @RequestMapping("/doAddVehicle")
    public String doAddVehicle(String vehicleid, String nowplace, String state, String owner, String driver) {
        Vehicle newvehicle = new Vehicle();
        newvehicle.setVehicleid(vehicleid);
        newvehicle.setNowplace(nowplace);
        newvehicle.setState(Integer.parseInt(state));
        newvehicle.setOwner(owner);
        newvehicle.setDriver(driver);
        vehicleService.addVehicle(newvehicle);
        return "redirect:/getAllVehicle";
    }

    @RequestMapping("/myvehicle")
    public String myvehicle(Model model, HttpSession session) {
        String backstage = (String) session.getAttribute("backstage");
        List<Vehicle> myvehicle = vehicleService.getAllVehicleByDriver(backstage);
        model.addAttribute("myvehicle", myvehicle);
        return "transporter/myvehicle";
    }

    @RequestMapping("/baoxiu")
    public String baoxiu(String vehicleid, HttpSession session, Model model) {
        Vehicle vehicle = new Vehicle();
        vehicle.setVehicleid(vehicleid);
        vehicle.setState(VehicleState.offtheline.getState());
        vehicleService.updateVehicle(vehicle);
        return "redirect:/myvehicle";
    }

    @RequestMapping("/huifu")
    public String huifu(String vehicleid, HttpSession session, Model model) {
        Vehicle vehicle = new Vehicle();
        vehicle.setVehicleid(vehicleid);
        vehicle.setState(VehicleState.normal.getState());
        vehicleService.updateVehicle(vehicle);
        return "redirect:/myvehicle";
    }

    @RequestMapping("/doChangNowPlace")
    @ResponseBody
    public String changNowPlace(String vehicleid, String nowplace, Model model) {
        Vehicle vehicle = new Vehicle();
        vehicle.setVehicleid(vehicleid);
        vehicle.setNowplace(nowplace);
        vehicleService.updateVehicle(vehicle);
        return "xgcg";
    }

    @RequestMapping("/changplace")
    public String changplace(String vehicleid, HttpSession session, Model model) {
        Vehicle prevehicle = vehicleService.getVehicleById(vehicleid);
        model.addAttribute("prevehicle", prevehicle);
        String backstage = (String) session.getAttribute("backstage");
        List<Vehicle> myvehicle = vehicleService.getAllVehicleByDriver(backstage);
        model.addAttribute("myvehicle", myvehicle);
        return "transporter/myvehicle";
    }

    //------------------物流管理-----------------
    @RequestMapping("/changelogistics")
    public String changelogistics(Model model, HttpSession session) {
        String backstage = (String) session.getAttribute("backstage");
        List<Vehicle> myvehicle = vehicleService.getAllVehicleByDriver(backstage);
        List<Vehicle> filtervehicel = myvehicle.stream().filter(vehicle -> vehicle.getState() == VehicleState.normal.getState()).collect(Collectors.toList());
        model.addAttribute("myvehicle", filtervehicel);
        return "transporter/changelogistics";
    }

    @RequestMapping("/addLogisticsInfo")
    public String addLogisticsInfo(String orderid, String info, String state, Model model) {
        LogisticsInfo logisticsInfo = new LogisticsInfo();
        logisticsInfo.setOrderid(Long.parseLong(orderid));
        logisticsInfo.setLogisticsstate(Integer.parseInt(state));
        logisticsInfo.setInfo(info);
        logisticsInfo.setUpdatetime(new Timestamp(System.currentTimeMillis()));
        logisticsService.addLogisticsInfo(logisticsInfo);
        OrderDetailVo orderDetailVo = orderService.queryOderDetail(Long.parseLong(orderid));
        orderDetailVo.setOrderstate(Objects.requireNonNull(OrderState.valueOf(Integer.parseInt(orderDetailVo.getOrderstate()))).getDetail());
        model.addAttribute("orderDetailVo", orderDetailVo);
        return "transporter/changeOrderState";
    }

    @RequestMapping("/doChangeOrderState")
    public String doChangeOrderState(String orderid, String state) {
        OrderInfo orderInfo = new OrderInfo();
        orderInfo.setOrderid(Long.parseLong(orderid));
        orderInfo.setOrderstate(Integer.parseInt(state));
        orderService.updateOrder(orderInfo);
        return "redirect:/changelogistics";
    }

    //----------------价格控制------------------
    @RequestMapping("/getAllPrice")
    public String getAllPrice(Model model) {
        List<LogisticsPrice> logisticsPrices = logisticsService.queryAllPrice();
        model.addAttribute("allPrice", logisticsPrices);
        return "admin/allprice";
    }

    @RequestMapping("/doAddPrice")
    public String addNewPrice(String fahuoprovince, String fahuocity, String shouhuoprovince, String shouhuocity, String startprice, String perkgprice, String discount) {
        LogisticsPrice logisticsPrice = new LogisticsPrice();
        logisticsPrice.setSendcity(fahuoprovince.concat(fahuocity));
        logisticsPrice.setReachcity(shouhuoprovince.concat(shouhuocity));
        logisticsPrice.setStartprice(Integer.parseInt(startprice));
        logisticsPrice.setPerkgprice(Integer.parseInt(perkgprice));
        logisticsPrice.setDiscount(Float.parseFloat(discount));
        logisticsService.addNewPrice(logisticsPrice);
        return "redirect:/getAllPrice";
    }

    @RequestMapping("/doEditPrice")
    public String doEditPrice(String priceid, String startprice, String perkgprice, String discount) {
        LogisticsPrice logisticsPrice = new LogisticsPrice();
        logisticsPrice.setPriceid(Integer.parseInt(priceid));
        logisticsPrice.setStartprice(Integer.parseInt(startprice));
        logisticsPrice.setPerkgprice(Integer.parseInt(perkgprice));
        logisticsPrice.setDiscount(Float.parseFloat(discount));
        logisticsService.updatePrice(logisticsPrice);
        return "redirect:/getAllPrice";
    }

    @RequestMapping("/cancelDiscount")
    public String cancelDiscount(String priceid) {
        LogisticsPrice logisticsPrice = new LogisticsPrice();
        logisticsPrice.setPriceid(Integer.parseInt(priceid));
        logisticsPrice.setDiscount(1.0f);
        logisticsService.updatePrice(logisticsPrice);
        return "redirect:/getAllPrice";
    }

    @RequestMapping("/editPrice")
    public String editPrice(String priceid, Model model) {
        LogisticsPrice logisticsPrice = logisticsService.queryPriceById(Integer.parseInt(priceid));
        model.addAttribute("editPrice", logisticsPrice);
        return "admin/editprice";
    }
}