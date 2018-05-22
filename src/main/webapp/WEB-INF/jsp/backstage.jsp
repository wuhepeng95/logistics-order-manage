<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>请登录</title>
    <link rel="shortcut icon" href="/images/logo.ico">
    <link rel="stylesheet" href="/css/bootstrap.css"/>
    <link rel="stylesheet" href="/css/adminlogin.css"/>
    <link rel="stylesheet" type="text/css" href="/css/alert.css"/>

    <script type="text/javascript" src="/js/alert.min.js" language="javascript"></script>
    <script type="text/javascript" src="/js/jquery-3.1.0.min.js" language="javascript"></script>
    <script type="text/javascript">
        $(function () {
            $("#adminlogin").click(function () {
                var adminname = $("#adminname").val();
                var adminpwd = $("#adminpwd").val();
                $.post("checkadmin", {
                    "adminname": adminname,
                    "adminpwd": adminpwd
                }, function (result) {
                    if (result == "admindlcg") {
                        jqueryAlert({
                            'icon': '/images/right.png',
                            'content': '管理员登录成功...',
                            'closeTime': 1000
                        }).show();
                        setTimeout(function () {
                            location.href = "/adminindex"
                        }, 2000)
                    } else if (result == "transporterdlcg") {
                        jqueryAlert({
                            'icon': '/images/right.png',
                            'content': '运输员登录成功...',
                            'closeTime': 1000
                        }).show();
                        setTimeout(function () {
                            location.href = "/transporterindex"
                        }, 2000)
                    } else if (result == "mmcw") {
                        jqueryAlert({
                            'icon': '/images/error.png',
                            'content': '密码错误,请检查密码...',
                            'closeTime': 3000
                        }).show();
                    } else if (result == "notadmin") {
                        jqueryAlert({
                            'icon': '/images/warning.png',
                            'content': '抱歉你不是管理员...',
                            'closeTime': 3000
                        }).show();
                    }
                })
            })
        })
    </script>
</head>
<body>
<div class="tit"><img src="/images/admintitle.png" alt=""/></div>
<div class="login-wrap">
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
            <td height="25" valign="bottom">用户名：</td>
        </tr>
        <tr>
            <td><input id="adminname" type="text" class="login_input login_user" placeholder="管理员/运输员名称"></td>
        </tr>
        <tr>
            <td height="35" valign="bottom">密 码：</td>
        </tr>
        <tr>
            <td><input id="adminpwd" type="password" class="login_input login_password" value="" placeholder="管理员/运输员密码">
            </td>
        </tr>
        <tr>
            <td height="60" valign="bottom">
                <input id="adminlogin" type="button" value="登录" class="btn btn-block btn-login">
            </td>
        </tr>

    </table>
</div>
<div class="copyright">建议使用IE8以上版本或谷歌浏览器</div>
</body>
</html>
