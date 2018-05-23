package i.am.whp.controller;

import i.am.whp.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;


@Controller
public class PageController {

    @Autowired
    UserService userService;

    @RequestMapping("/")
    public String index() {
        return "index";
    }

    @RequestMapping("/login")
    public String login() {
        return "login";
    }

    @RequestMapping("/notlogin")
    public String notlogin() {
        return "error/notlogin";
    }

    @RequestMapping("/notadmin")
    public String notadmin() {
        return "error/notadmin";
    }

    @RequestMapping("/register")
    public String register() {
        return "register";
    }

    @RequestMapping("/changepwd")
    public String changepwd(HttpSession session) {
        String loginsuccess = (String) session.getAttribute("loginsuccess");
        if (loginsuccess != null && loginsuccess.equals("true")) {
            return "usercenter/changepwd";

        } else {
            return "error/notlogin";
        }
    }

    @RequestMapping("/resetpwd")
    public String resetpwd(HttpSession session) {
        return "resetpwd";
    }

    @RequestMapping("/help")
    public String help() {
        return "help";
    }

    @RequestMapping("/adminlogin")
    public String adminlogin() {
        return "backstage";
    }

    @RequestMapping("/adminindex")
    public String adminindex(HttpSession session) {
//        String backstage = (String) session.getAttribute("backstage");
//        if (backstage == null || backstage.equals("admin"))
        // TODO: 2018/5/23 页面控制
        return "admin/adminindex";
    }

    @RequestMapping("/transporterindex")
    public String transporterindex() {
        return "transporter/transporterindex";
    }

    @RequestMapping("/booksuccess")
    public String booksuccess(String orderid, Model model) {
        model.addAttribute("orderid", orderid);
        return "booksuccess";
    }

}
