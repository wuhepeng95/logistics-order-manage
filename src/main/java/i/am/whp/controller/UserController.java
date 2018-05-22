package i.am.whp.controller;

import i.am.whp.model.enums.Role;
import i.am.whp.model.po.User;
import i.am.whp.service.UserService;
import i.am.whp.util.EmailUtil;
import i.am.whp.util.Md5Util;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.sql.Timestamp;


@Controller
public class UserController {
    @Autowired
    UserService userService;

    //退出登录
    @RequestMapping("/clearLogin")
    public String clearLogin(HttpSession session) {
        session.removeAttribute("loginsuccess");
        session.removeAttribute("username");
        session.removeAttribute("backstage");
        return "redirect:/";
    }

    //登录时验证用户
    @RequestMapping("/checkUserAndPassword")
    @ResponseBody
    public String checkUserAndPassword(String username, String password, HttpSession session) {
        //先检查用户是否存在
        if (userService.queryUser(username) == null || userService.queryUser(username).getRole() != Role.user.getRole()) {
            return "yhbcz";
        }
        User user = new User();
        user.setUsername(username);
        user.setPassword(Md5Util.MD5(password));
        if (userService.checkPassword(user)) {
            //更新登录时间
            user.setPassword(null);
            user.setLogintime(new Timestamp(System.currentTimeMillis()));
            userService.updateUserInfo(user);
            //登录成功 存储session
            session.setAttribute("loginsuccess", "true");
            session.setAttribute("username", username);
            return "dlcg";
        } else {
            return "mmcw";
        }
    }

    //查询是否有重复的用户
    @RequestMapping("/checkName")
    @ResponseBody
    public String checkName(String username) {
        return userService.queryUser(username) != null ? "true" : "false";
    }

    //注册新用户
    @RequestMapping("/registerNewUser")
    public String registerNewUser(String username, String secondpassword, HttpSession session) throws InterruptedException {
        User user = new User();
        user.setUsername(username);
        user.setRole(Role.user.getRole());
        user.setPassword(Md5Util.MD5(secondpassword));
        user.setRegtime(new Timestamp(System.currentTimeMillis()));
        user.setLogintime(new Timestamp(System.currentTimeMillis()));
        if (userService.addUser(user)) {
            // 注册成功直接登录
            session.setAttribute("loginsuccess", "true");
            session.setAttribute("username", username);
            Thread.sleep(2000);
            return "usercenter/editprofile";
        }
        return "register";
    }

    @RequestMapping("/personal")
    public String personal(HttpSession session) {
        String loginsuccess = (String) session.getAttribute("loginsuccess");
        if (loginsuccess != null && loginsuccess.equals("true")) {
            // 查询个人资料
            String username = (String) session.getAttribute("username");
            User userdata = userService.queryUser(username);
            session.setAttribute("userdata", userdata);
            return "usercenter/personal";
        } else {
            return "error/notlogin";
        }
    }

    @RequestMapping("/editprofile")
    public String editprofile(HttpSession session) {
        String loginsuccess = (String) session.getAttribute("loginsuccess");
        if (loginsuccess != null && loginsuccess.equals("true")) {
            // 查询个人资料
            String username = (String) session.getAttribute("username");
            User userData = userService.queryUser(username);
            session.setAttribute("userdata", userData);
            return "usercenter/editprofile";
        } else {
            return "error/notlogin";
        }
    }

    // 修改密码
    @RequestMapping("/dochangepwd")
    public String dochangepwd(String oldpassword, String newpassword2, HttpSession session) {
        String username = (String) session.getAttribute("username");
        User user = new User();
        user.setUsername(username);
        user.setPassword(Md5Util.MD5(oldpassword));
        if (userService.checkPassword(user)) {
            user.setPassword(Md5Util.MD5(newpassword2));
            //更改密码
            if (userService.updateUserInfo(user)) {
                session.removeAttribute("username");
                return "/login";
            }
        }
        return "/changepwd";
    }

    // 确认重置密码
    @RequestMapping("/checkresetpwd")
    @ResponseBody
    public String checkresetpwd(String username, String email, HttpSession session) {
        //检查用户是否存在
        User user = userService.queryUser(username);
        if (user != null) {
            //检查邮箱绑定是否正确
            if (email.equals(user.getEmail())) {
                String verificationCode = EmailUtil.sendResetPasswordEmail(user);
                session.setAttribute("verificationCode", verificationCode);
                session.setMaxInactiveInterval(60 * 5);
                return "fscg";
            } else {
                return "yxwbd";
            }
        } else {
            return "yhbcz";
        }
    }

    // 重置密码
    @RequestMapping("/doresetpwd")
    @ResponseBody
    public String doresetpwd(String username, String newpwd, String yanzm, HttpSession session) throws InterruptedException {
        Thread.sleep(1000);
        if (yanzm == null || !yanzm.equals(session.getAttribute("verificationCode"))) {
            return "yzmcw";
        }
        session.setMaxInactiveInterval(60 * 15);
        User user = new User();
        user.setUsername(username);
        user.setPassword(Md5Util.MD5(newpwd));
        userService.updateUserInfo(user);
        return "xgcg";
    }

    @RequestMapping("/saveUserData")
    public String saveUserData(String email, String mobile, String address, HttpSession session) {
        String username = (String) session.getAttribute("username");
        User user = new User();
        if (email == null || email.equals("")) {
            email = "未填写";
        }
        if (mobile == null || mobile.equals("")) {
            mobile = "未填写";
        }
        if (address == null || address.equals("")) {
            address = "未填写";
        }
        user.setUsername(username);
        user.setMobile(mobile);
        user.setEmail(email);
        user.setAddress(address);
        if (userService.updateUserInfo(user)) {
            session.setAttribute("userData", user);
        }
        return "redirect:/personal";
    }
}
