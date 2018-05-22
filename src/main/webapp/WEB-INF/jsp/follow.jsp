<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>货物追踪</title>
    <link rel="stylesheet" type="text/css" href="/css/reset.css"/>
    <link rel="stylesheet" type="text/css" href="/css/common.css"/>
    <link rel="shortcut icon" href="/images/logo.ico">
    <link rel="stylesheet" type="text/css" href="/css/theme.css"/>
    <link rel="stylesheet" type="text/css" href="/css/alert.css"/>
    <script type="text/javascript" src="/js/alert.min.js" language="javascript"></script>
    <script type="text/javascript" src="/js/jquery-3.1.0.min.js" language="javascript"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $("#chaxun").click(function () {
                var reg = /^[0-9]{12}$/;
                var orderid = $("#orderid").val();
                if (!reg.test(orderid)) {
                    $("table").append("<tr><td colspan='3'>" + "[提示消息]请输入正确的订单号！" + "</td></tr>");
                    $("#orderid").css("border", "2px solid red");
                    return;
                }
                $("#orderid").css("border", "2px solid green");
                $.post("queryLogisticsInfo",
                    {"orderid": orderid},
                    function (result) {
                        if (result.length !== 0) {
                            $("table").append("<tr><td colspan='3'>" + "[提示消息]查询成功！订单号:" + orderid +"<a href=orderdetail?orderid="+orderid+">查看该订单详情</a>"+ " 物流信息如下" + "</td></tr>");
                            $("table").append("<tr><th>物流信息</th><th>物流状态</th><th>表更时间</th></tr>");
                            $.each(result, function (i, one) {
                                $("table").append("<tr><td>" + one['info'] + "</td><td>" + one['state'] + "</td><td>" + one['updatetime'] + "</td></tr>");
                            })
                        } else {
                            $("table").append("<tr><td colspan='3'>" + "[提示消息]未查出相关信息，请核对您的订单号！" + "</td></tr>")
                        }
                    }, "json");
            });
            $("#clear").click(function () {
                $("table tr").html("");
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
        });
    </script>
    <style type="text/css">
        /* Table Head */
        #table-7 thead th {
            background-color: rgb(81, 130, 187);
        }

        /* Column Style */
        #table-7 td {
            color: #000;
        }

        /* Heading and Column Style */
        #table-7 tr, #table-7 th {
            border: 1px solid rgb(81, 130, 187);
        }

        /* Padding and font style */
        #table-7 td, #table-7 th {
            padding: 5px 10px;
        }
    </style>
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
<div class="main">
    <div class="book">
        <div class="tabBox_t">
            <div class="tabBox">
                <ul class="tabNav">
                    <li><a href="book">网上下单</a></li>
                    <li class="now"><em>货物追踪</em><span>&nbsp;</span></li>
                </ul>
                <div class="tabCont" style="display:block;">
                    <div class="follow_m">
                        <div class="space_hx">&nbsp;</div>
                        <div class="follow_mtop">
                            <form>
                                <input name="orderid" id="orderid" type="text" placeholder="请输入订单编号(12位数字)">
                                <input type="button" id="chaxun" value="查询">
                                <input type="button" id="clear" value="清除" oncli>
                            </form>
                        </div>
                        <div class="space_hx">&nbsp;</div>
                        查询信息展示窗口：
                        <div class="space_hx">&nbsp;</div>
                        <table id="table-7">
                            <tr>
                                <td colspan='3'>[提示消息]请输入订单号查询最新物流信息！</td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <c:if test="${followId != null}">
        <script type="text/javascript">
            $(function () {
                $("#orderid").val(${followId});
                $("#chaxun").trigger("click");
            })
        </script>
    </c:if>
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
