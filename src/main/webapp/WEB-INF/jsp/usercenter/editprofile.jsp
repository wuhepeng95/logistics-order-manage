<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>个人中心-修改资料</title>
    <link rel="stylesheet" type="text/css" href="/css/reset.css"/>
    <link rel="stylesheet" type="text/css" href="/css/common.css"/>
    <link rel="shortcut icon" href="/images/logo.ico">
    <link rel="stylesheet" type="text/css" href="/css/theme.css"/>
    <link rel="stylesheet" type="text/css" href="/css/alert.css"/>
    <script type="text/javascript" src="/js/alert.min.js" language="javascript"></script>
    <script type="text/javascript" src="/js/jquery-3.1.0.min.js"></script>

    <style type="text/css">
        #submitbutton {
            cursor: pointer;
        }
    </style>
    <script type="text/javascript">
        $(function () {
            $("#left_menu li ul").css("display", "block");
            $("#left_menu li .yiji").click(function () {
                $(this).parents("li").find(".erji").toggle();
            });
            $("#clearLogin").click(function () {
                if (logoutdialog) {
                    return logoutdialog.show();
                }
                var logoutdialog = jqueryAlert({
                    'title': '注销系统',
                    'content': '确认退出本系统?你仍可查看订单价格和物流信息。',
                    'modal': true,
                    'buttons': {
                        '暂不': function () {
                            logoutdialog.close();
                        },
                        '注销': function () {
                            location.href = "/clearLogin";
                        }
                    }
                });
            })

            $("#saveUserData").submit(function () {
                var mobilereg = /^[1][3,4,5,7,8][0-9]{9}$/;
                var emailreg = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;

                var mobile = $("#mobile").val();
                var email = $("#email").val();

                if (!mobilereg.test(mobile)) {
                    $("#mobileexam").html("号码格式错误");
                } else {
                    $("#mobileexam").html("");
                }
                if (!emailreg.test(email)) {
                    $("#emailexam").html("邮箱格式错误");
                } else {
                    $("#emailexam").html("");
                }
                if (mobilereg.test(mobile) && emailreg.test(email)) {
                    alert("修改成功");
                    return true;
                }
                alert("请检查格式");
                return false;
            })
        });
    </script>

</head>

<body>
<!--头部-->
<div class="head_bg">
    <div class="head clearfix">
        <div class="logo"><a href="/"><img src="/images/pagelogo.png" alt="舞鹤物流"/></a></div>
        <div class="menu">
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
<div class="main">
    <!--订单中心-->
    <div class="person clearfix">
        <div class="order_l person_l">
            <ul id="left_menu" class="left_menu">
                <li>
                    <a class="yiji"><span>个人中心</span><em>&nbsp;</em></a>
                    <ul class="erji">
                        <li>
                            <i>&nbsp;</i>
                            <strong><a href="personal">个人资料</a></strong>
                        </li>
                    </ul>
                    <ul class="erji">
                        <li>
                            <i>&nbsp;</i>
                            <strong><a href="editprofile">修改资料</a></strong>
                        </li>
                    </ul>
                    <ul class="erji">
                        <li>
                            <i>&nbsp;</i>
                            <strong><a href="changepwd">修改密码</a></strong>
                        </li>
                    </ul>
                </li>

                <li>
                    <a class="yiji"><span>订单中心</span><em>&nbsp;</em></a>
                    <ul class="erji">
                        <li>
                            <i>&nbsp;</i>
                            <strong><a href="order">个人订单</a></strong>
                        </li>
                    </ul>
                    <ul class="erji">
                        <li>
                            <i>&nbsp;</i>
                            <strong><a href="orderdetail">订单详情</a></strong>
                        </li>
                    </ul>
                    <ul class="erji">
                        <li>
                            <i>&nbsp;</i>
                            <strong><a href="consigninfo">收发人信息</a></strong>
                        </li>
                    </ul>
                </li>
            </ul>
        </div>
        <div class="person_r">
            <div class="person_h">
                <span>修改资料</span>
            </div>
            <div class="person_rmain">
                <strong>基本信息</strong>
                <%session.setAttribute("saveDataFlag", "false"); %>
                <form id="saveUserData" action="saveUserData" method="post">
                    <ul>
                        <li>
                            <span>手机号码：</span>
                            <input name="mobile" id="mobile" type="text" value="${sessionScope.userdata.mobile}">
                            <span id="mobileexam" style="color:red;"></span>
                        </li>
                        <li>
                            <span>个人邮箱：</span>
                            <input name="email" id="email" type="text" value="${sessionScope.userdata.email}">
                            <span id="emailexam" style="color:red;"></span>
                        </li>
                        <li>
                            <span>个人地址：</span>
                            <input name="address" id="address" type="text" value="${sessionScope.userdata.address}">
                        </li>
                        <li>
                            <input type="submit" class="submit" value="保存" id="submitbutton"/>
                        </li>
                    </ul>
                </form>
            </div>
        </div>
    </div>
    <!--订单中心-->
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
            <a href="/adminlogin" target="_blank">管理后台</a>
            Copyright&copy;&nbsp;2017-2018&nbsp; 舞鹤物流有限责任公司.&nbsp;&nbsp;All&nbsp;&nbsp;rights&nbsp;&nbsp;reserved.
            &nbsp;&nbsp;新ICP备10005645
        </div>
    </div>
</div>
<!--底部-->
</body>
</html>
