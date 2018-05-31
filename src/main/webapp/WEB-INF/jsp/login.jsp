<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>请登录</title>
    <link rel="shortcut icon" href="/images/logo.png">
    <link rel="stylesheet" type="text/css" href="/css/reset.css"/>
    <link rel="stylesheet" type="text/css" href="/css/common.css"/>
    <link rel="stylesheet" type="text/css" href="/css/theme.css"/>
    <link rel="stylesheet" type="text/css" href="/css/alert.css"/>

    <script type="text/javascript" src="/js/jquery-3.1.0.min.js" language="javascript"></script>
    <script type="text/javascript" src="/js/alert.min.js" language="javascript"></script>
    <script type="text/javascript">
        $(function () {
            $("#submitbutton").click(function () {
                var a = 0;
                var b = 0;

                var username = $("#username").val();
                var password = $("#password").val();

                var namereg = /^[0-9a-zA-Z]{1,12}$/;
                var pwdreg = /^[\w]{6,12}$/;

                if (!namereg.test(username)) {
                    $("#nameexam").css("color", "red").html("格式错误");
                } else {
                    $("#nameexam").html("");
                    a = 1;
                }
                if (!pwdreg.test(password)) {
                    $("#pwdexam").css("color", "red").html("格式错误");
                } else {
                    $("#pwdexam").html("");
                    b = 1;
                }

                if ((a === 1) && (b === 1)) {
                    $.post("checkUserAndPassword", {
                        "username": username, "password": password
                    }, function (result) {
                        if (result == "dlcg") {
                            jqueryAlert({
                                'icon': '/images/right.png',
                                'content': '登录成功,跳转到主页...',
                                'closeTime': 1000
                            }).show();
                            setTimeout(function () {
                                location.href = "/"
                            }, 1000)
                        } else if (result == "mmcw") {
                            jqueryAlert({
                                'icon': '/images/error.png',
                                'content': '密码错误,请检查密码...',
                                'closeTime': 3000
                            }).show();
                        } else if (result == "yhbcz") {
                            jqueryAlert({
                                'icon': '/images/warning.png',
                                'content': '用户不存在,请检查用户名...',
                                'closeTime': 3000
                            }).show();
                        }
                    })
                }
            })
        })
    </script>
</head>

<body>
<!--头部-->
<div class="head_bg">
    <div class="head clearfix">
        <div class="logo"><a href="/"><img src="/images/pagelogo.png" alt="舞鹤物流"/></a></div>
        <div class="menu">

            <c:if test="${sessionScope.loginsuccess!=true}">
                <div class="head_top">
                    <a href="login">登录</a>
                    <a href="register">注册</a>
                </div>
            </c:if>
            <c:if test="${sessionScope.loginsuccess==true}">
                <div class="head_top">
                    <a href="personal" style="color: red">${sessionScope.username}</a>&nbsp;已登录
                    <a href="#" id="clearLogin">注销</a>
                </div>
            </c:if>
            <ul class="clearfix">
                <li class="now"><a href="/">首页</a></li>
                <li><a href="personal">个人中心</a></li>
                <li><a href="order">订单中心</a></li>
                <li><a href="book">网上下单</a></li>
                <li><a href="follow">货物追踪</a></li>
                <li><a href="help">帮助支持</a></li>

            </ul>
        </div>
    </div>
</div>
<!--头部-->
<!--中间部分-->
<div class="main clearfix">
    <div class="login_reg clearfix">
        <!--登录-->
        <div class="login">
            <div class="lore_top">
            	<span>
                	<em>账号登录</em>
                </span>
            </div>
            <table>
                <ul>
                    <li>
                        <span>用户名：</span>
                        <input name="username" id="username" type="text" placeholder="1-16个字母数字组成"><span
                            id="nameexam"> </span>
                    </li>
                    <li>
                        <span>密码：</span>
                        <input name="password" id="password" type="password" placeholder="6-16个字符"><span
                            id="pwdexam"> </span>
                    </li>
                    <li class="tijiao">
                        <input type="button" id="submitbutton" value="登录" class="submit">
                    </li>
                    <li style="margin-left: 75px">还没账号，点此<a href="register">注册</a>！</li>
                    <li style="margin-left: 75px">忘记密码，点此<a href="resetpwd">重置</a>！</li>
                </ul>
            </table>
        </div>
        <!--登录-->
    </div>
    <div class="space_hx">&nbsp;</div>

</div>
<!--中间部分-->
<div class="space_hx">&nbsp;</div>
<!--底部-->
<div class="foot_bg">
    <div class="foot">
        <div class="foot_t">

        </div>
        <div class="copy">
            Copyright&copy;&nbsp;2017-2018&nbsp; 舞鹤物流有限责任公司.&nbsp;&nbsp;All&nbsp;&nbsp;rights&nbsp;&nbsp;reserved.
            &nbsp;&nbsp;新ICP备10005645
        </div>
    </div>
</div>
<!--底部-->
</body>
</html>
