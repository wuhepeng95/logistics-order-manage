package i.am.whp.controller;

import i.am.whp.model.enums.Role;
import i.am.whp.model.po.User;
import i.am.whp.service.UserService;
import i.am.whp.util.Md5Util;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.sql.Timestamp;
import java.util.List;


@Controller
public class BackstageController {
    @Autowired
    UserService userService;

    // TODO: 2018/5/15 车辆管理和价格管理、用户管理

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

    @RequestMapping("/getAllUser")
    public String getAllUser(Model model) {
        List<User> allUser = userService.getAllUser();
        model.addAttribute("allUser", allUser);
        return "";
    }

}