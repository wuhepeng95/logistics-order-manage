<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>管理员</title>
    <link rel="stylesheet" type="text/css" href="/css/reset.css"/>
    <link rel="stylesheet" type="text/css" href="/css/common.css"/>
   <link rel="shortcut icon" href="/images/logo.png">
    <link rel="stylesheet" type="text/css" href="/css/theme.css"/>
    <link rel="stylesheet" type="text/css" href="/css/alert.css"/>
    <script type="text/javascript" src="/js/alert.min.js" language="javascript"></script>
    <script type="text/javascript" src="/js/jquery-3.1.0.min.js" language="javascript"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            if ("${sessionScope.addinfoflag}" == "true") {
                alert("保存成功！！");
            }

            $("#addinfo").submit(function () {
                if ($("#orderid").val() == "") {
                    alert("请输入订单号");
                    return false;
                } else if ($("#info").val() == "") {
                    alert("请输入订单信息");
                    return false;
                } else {
                    return true;
                }

            });
        });
    </script>
    <style type="text/css">
        #ti1 {
            font-size: 30px;
            color: #BD0707;
            font-weight: bold;
        }

        .adddate {
            font-size: 18px;
            border: 2px solid #333;
            width: 20%;
            background: white;
            left: 40%;
            position: relative;
        }

        .adddate h3, #addbutton {
            margin: 10px 0px 10px 0px;
        }

        .addbutton {
            cursor: pointer;
        }
    </style>
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
                    <a href="clearogin" class="submit">退出</a>
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
<span id="ti1">管理员</span>
<br/>
<br/>
<div class="adddate">
    <%session.setAttribute("addinfoflag", "false"); %>
    <h3>物流信息添加</h3>
    <form action="addLogisticsInfo" id="addinfo">
        订单编号<input type="text" id="orderid" value="" name="orderid"/><br/>
        物流信息<input type="text" id="info" value="" name="info"/><br/>
        订单状态<select name="status" style="margin-left: 62px">
        <option name="status" value="已发货">已发货</option>
        <option name="status" value="路途中">路途中</option>
        <option name="status" value="待收货">待收货</option>
        <option name="status" value="已收货">已收货</option>
    </select>
        <br/>
        <input type="submit" id="addbutton" value="添加"/>
    </form>
</div>
<br/>


<!--中间部分-->
<div class="space_hx">&nbsp;</div>
<!--底部-->
<div class="foot_bg">
    <div class="foot">
        <div class="foot_t">
            <a href=""></a>
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