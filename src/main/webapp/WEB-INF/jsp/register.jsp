<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>欢迎注册</title>
    <link rel="stylesheet" type="text/css" href="/css/reset.css"/>
    <link rel="stylesheet" type="text/css" href="/css/common.css"/>
   <link rel="shortcut icon" href="/images/logo.png">
    <link rel="stylesheet" type="text/css" href="/css/theme.css"/>
    <link rel="stylesheet" type="text/css" href="/css/alert.css"/>
    <script type="text/javascript" src="/js/alert.min.js" language="javascript"></script>
    <style type="text/css">
        #nameexam, #firstexam, #secondexam {
            color: red;
        }

        #submitbutton {
            cursor: pointer;
        }
    </style>
    <script type="text/javascript" src="/js/jquery-3.1.0.min.js" language="javascript"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            //用户名是否已存在
            var a = 0;
            //检查密码
            var b = 0;
            var c = 0;
            $("#username").blur(function () {
                var username = $("#username").val();
                var reg = /^[0-9a-zA-Z]{1,12}$/;
                if (!reg.test(username)) {
                    $("#nameexam").html("格式错误");
                    a = 0;
                } else {
                    $.get(
                        "checkName",
                        "username=" + username,
                        function (result) {
                            if ("true" === result) {
                                $("#nameexam").html("已存在");
                                a = 0;
                            }
                            else {
                                $("#nameexam").html("");
                                a = 1;
                            }
                        }
                    );
                }
            });
            $("#firstpassword").focus(function () {
                var username = $("#username").val();
                var reg = /^[0-9a-zA-Z]{1,12}$/;
                if (!reg.test(username)) {
                    $("#nameexam").html("格式错误");
                    a = 0;
                } else {
                    $.get(
                        "checkName",
                        "username=" + username,
                        function (result) {
                            if (result == "true") {
                                $("#nameexam").html("已存在");
                                a = 0;
                            }
                            else {
                                $("#nameexam").html("");
                                a = 1;
                            }
                        }
                    );
                }
            });
            //检查密码
            $("#firstpassword").blur(function () {
                var firstpassword = $("#firstpassword").val();
                var reg = /^[\w]{6,12}$/;
                if (!reg.test(firstpassword)) {
                    $("#firstexam").html("格式错误");
                    b = 0;
                } else {
                    $("#firstexam").html("");
                    b = 1;
                }
            });
            $("#secondpassword").focus(function () {
                var firstpassword = $("#firstpassword").val();
                var reg = /^[\w]{6,12}$/;
                if (!reg.test(firstpassword)) {
                    $("#firstexam").html("格式错误");
                    b = 0;
                } else {
                    $("#firstexam").html("");
                    b = 1;
                }
                var username = $("#username").val();
                var reg = /^[0-9a-zA-Z]{1,12}$/;
                if (!reg.test(username)) {
                    $("#nameexam").html("格式错误");
                    a = 0;
                } else {
                    $.get(
                        "checkName",
                        "username=" + username,
                        function (result) {
                            if (result == "true") {
                                $("#nameexam").html("已存在");
                                a = 0;
                            }
                            else {
                                $("#nameexam").html("");
                                a = 1;
                            }
                        }
                    );
                }
            });
            $("#secondpassword").blur(function () {
                var firstpassword = $("#firstpassword").val();
                var secondpassword = $("#secondpassword").val();
                if (!(firstpassword == secondpassword)) {
                    $("#secondexam").html("密码不一致");
                    c = 0;
                } else {
                    $("#secondexam").html("");
                    c = 1;
                }
            });
            $("#zhuce").submit(function () {
                if (a == 0) {
                    jqueryAlert({
                        'icon'    : 'images/warning.png',
                        'content' : '请检查用户名...',
                        'closeTime' : 2000
                    }).show();
                    return false;
                } else {
                    if (b == 0) {
                        jqueryAlert({
                            'icon'    : 'images/warning.png',
                            'content' : '请检查密码格式...',
                            'closeTime' : 2000
                        }).show();
                        return false;
                    } else {
                        if (c == 0) {
                            jqueryAlert({
                                'icon'    : 'images/warning.png',
                                'content' : '两次密码不一致...',
                                'closeTime' : 2000
                            }).show();
                            return false;
                        } else {
                            jqueryAlert({
                                'icon': '/images/right.png',
                                'content': '注册成功,请先修改资料...',
                                'closeTime': 2000
                            }).show();
                            return true;
                        }
                    }
                }
            });

        });
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
                    <a href="personal">${sessionScope.username}</a>你好！
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
        <!--注册-->
        <div class="login_reg clearfix">
            <!--注册-->
            <div class="reg">
                <div class="lore_top">
            	<span>
                	<em>账号注册</em>
                </span>
                </div>
                <form id="zhuce" action="/registerNewUser" method="post">
                    <ul>
                        <li>
                            <span>用户名:</span>
                            <input name="username" id="username" type="text" placeholder="12位以内字母与数字组合"><span
                                id="nameexam"> </span>
                        </li>
                        <li>
                            <span>密码:</span>
                            <input name="firstpassword" id="firstpassword" type="password" placeholder="6-16个字符"><span
                                id="firstexam"> </span>
                        </li>
                        <li>
                            <span>确认密码:</span>
                            <input name="secondpassword" id="secondpassword" type="password" placeholder="和密码一致"><span
                                id="secondexam"> </span>
                        </li>
                        <li class="tijiao">
                            <input type="submit" id="submitbutton" value="注册" class="submit">
                        </li>
                        <li style="margin-left: 75px">已有账号，点此<a href="login">登录</a>！</li>
                    </ul>
                </form>
            </div>
            <!--注册-->
        </div>
        <div class="space_hx">&nbsp;</div>
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
