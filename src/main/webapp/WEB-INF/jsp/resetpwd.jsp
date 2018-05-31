<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>重置密码</title>
   <link rel="shortcut icon" href="/images/logo.png">
    <link rel="stylesheet" type="text/css" href="/css/reset.css"/>
    <link rel="stylesheet" type="text/css" href="/css/common.css"/>
    <link rel="stylesheet" type="text/css" href="/css/theme.css"/>
    <link rel="stylesheet" type="text/css" href="/css/alert.css"/>

    <script type="text/javascript" src="/js/jquery-3.1.0.min.js" language="javascript"></script>
    <script type="text/javascript" src="/js/alert.min.js" language="javascript"></script>
    <script type="text/javascript">
        $(function () {

            var username;

            $("#submitbutton1").click(function () {
                var a = 0;
                var b = 0;

                username = $("#username").val();
                var email = $("#email").val();

                var namereg = /^[0-9a-zA-Z]{1,12}$/;
                var emailreg = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;

                if (!namereg.test(username)) {
                    $("#nameexam").css("color", "red").html("格式错误");
                } else {
                    $("#nameexam").html("");
                    a = 1;
                }
                if (!emailreg.test(email)) {
                    $("#emailexam").css("color", "red").html("邮箱非法");
                } else {
                    $("#emailexam").html("");
                    b = 1;
                }

                if ((a === 1) && (b === 1)) {
                    $.post("checkresetpwd", {
                        "username": username, "email": email
                    }, function (result) {
                        if (result === "fscg") {
                            jqueryAlert({
                                'icon': '/images/right.png',
                                'content': '发送成功，请查看邮件...',
                                'closeTime': 3000
                            }).show();
                            $("#doreset").show();
                        } else if (result === "yxwbd") {
                            jqueryAlert({
                                'icon': '/images/error.png',
                                'content': '邮箱绑定错误,未绑定请联系客服...',
                                'closeTime': 3000
                            }).show();
                        } else if (result === "yhbcz") {
                            jqueryAlert({
                                'icon': '/images/warning.png',
                                'content': '用户不存在,请检查用户名...',
                                'closeTime': 3000
                            }).show();
                        }
                    })
                }
            })
            $("#submitbutton2").click(function () {
                var yanzm = $("#yanzm").val();
                var newpwd1 = $("#newpwd1").val();
                var newpwd2 = $("#newpwd2").val();
                var reg = /[\w]{6,12}/;
                if (newpwd1 === newpwd2) {
                    if (reg.test(newpwd2)) {
                        $.post("doresetpwd", {
                            "username": username, "newpwd": newpwd2, "yanzm": yanzm
                        }, function (result) {
                            if (result === "xgcg") {
                                jqueryAlert({
                                    'icon': '/images/right.png',
                                    'content': '重置密码成功,请重新登录...',
                                    'closeTime': 2000
                                }).show();
                                setTimeout(function () {
                                    location.href = "/login";
                                }, 2000);
                            } else if (result === "yzmcw") {
                                jqueryAlert({
                                    'icon': '/images/error.png',
                                    'content': '验证码不正确...',
                                    'closeTime': 2000
                                }).show();
                            } else {
                                jqueryAlert({
                                    'icon': '/images/error.png',
                                    'content': '重置密码失败,请联系客服...',
                                    'closeTime': 2000
                                }).show();
                            }
                        })
                    } else {
                        jqueryAlert({
                            'icon': '/images/warning.png',
                            'content': '密码格式错误...',
                            'closeTime': 2000
                        }).show();
                    }
                } else {
                    jqueryAlert({
                        'icon': '/images/warning.png',
                        'content': '两次密码不一致...',
                        'closeTime': 2000
                    }).show();
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
                    <a href="login" class="submit">登录</a>
                    <a href="register" class="submit">注册</a>
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
                	<em>重置密码</em>
                </span>
            </div>
            <table>
                <ul id="resetcheck">
                    <li>
                        <span>用户名：</span>
                        <input name="username" id="username" type="text" placeholder="请输入你要重置密码的账户"><span
                            id="nameexam"> </span>
                    </li>
                    <li>
                        <span>邮箱：</span>
                        <input name="email" id="email" type="text" placeholder="请输入该账户绑定的邮箱"><span
                            id="emailexam"> </span>
                    </li>
                    <li class="tijiao">
                        <input type="button" id="submitbutton1" value="邮箱验证" class="submit">
                    </li>
                </ul>
                <ul id="doreset">
                    <li>
                        <span>验证码：</span>
                        <input type="text" id="yanzm" placeholder="请输入邮箱中的验证码">五分钟内有效
                    </li>
                    <li>
                        <span>新密码：</span>
                        <input type="password" id="newpwd1" placeholder="请输入新密码">
                    </li>
                    <li>
                        <span>确认：</span>
                        <input type="password" id="newpwd2" placeholder="请确认新密码">
                    </li>
                    <li class="tijiao">
                        <input type="button" id="submitbutton2" value="重置密码" class="submit">
                    </li>
                </ul>
            </table>
        </div>
    </div>
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
