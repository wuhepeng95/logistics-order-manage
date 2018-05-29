<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>订单中心-订单详情</title>
    <link rel="stylesheet" type="text/css" href="/css/reset.css"/>
    <link rel="stylesheet" type="text/css" href="/css/common.css"/>
   <link rel="shortcut icon" href="/images/logo.png">
    <link rel="stylesheet" type="text/css" href="/css/theme.css"/>
    <link rel="stylesheet" type="text/css" href="/css/alert.css"/>
    <script type="text/javascript" src="/js/alert.min.js" language="javascript"></script>
    <script type="text/javascript" src="/js/jquery-3.1.0.min.js"></script>
    <script type="text/javascript">
        $(function () {
            $("tr:odd").css("background", "#CFCFCF");
            $("#queryButton").click(function () {
                var queryId = $("#queryId").val();
                location.href = "orderdetail?orderid=" + queryId;
            })
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
                <%
                    response.sendRedirect("notlogin");
                %>
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
    <!--订单中心-->
    <div class="order clearfix">
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
        <div class="order_r">
            <div class="order_h">
                <span>订单详情</span>
            </div>
            <c:if test="${empty orderDetail}">
                <div id="queryOrderDetail">订单号：<input id="queryId" type="text" placeholder="请输入12位订单号"> <input
                        id="queryButton" type="button" value="查询订单详情"></div>
            </c:if>

            <c:if test="${not empty orderDetail}">
                <div id="orderDetail">
                    <ul>
                        <li>
                            <span>订单号：</span>
                            <em>${orderDetail.orderid}</em>
                        </li>
                        <li>
                            <span>拥有者：</span>
                            <em>${orderDetail.username}</em>
                        </li>
                        <li>
                            <span>货物重量(KG)：</span>
                            <em>${orderDetail.goodswt}</em>
                        </li>
                        <li>
                            <span>总邮费(元)：</span>
                            <em>${orderDetail.postage}</em>
                        </li>
                        <li>
                            <span>货物类型：</span>
                            <em>${orderDetail.category}</em>
                        </li>
                        <div class="space_hx">&nbsp;</div>
                        <li>
                            <span>收货人姓名：</span>
                            <em>${orderDetail.consigneename}</em>
                        </li>
                        <li>
                            <span>收货人电话：</span>
                            <em>${orderDetail.consigneephone}</em>
                        </li>
                        <li>
                            <span>收货人地址：</span>
                            <em>${orderDetail.reachaddress}</em>
                        </li>
                        <li>
                            <span>发货人姓名：</span>
                            <em>${orderDetail.consignorname}</em>
                        </li>
                        <li>
                            <span>发货人电话：</span>
                            <em>${orderDetail.consignorphone}</em>
                        </li>
                        <li>
                            <span>发货人地址：</span>
                            <em>${orderDetail.sendaddress}</em>
                        </li>
                        <div class="space_hx">&nbsp;</div>
                        <li>
                            <span>下单时间：</span>
                            <em>${orderDetail.ordertime}</em>
                        </li>
                        <li>
                            <span>订单状态：</span>
                            <em>${orderDetail.orderstate}</em>
                        </li>
                        <li>
                            <span>货物跟踪：</span>
                            <em><a href="follow?orderid=${orderDetail.orderid}">点击查询</a></em>
                        </li>
                    </ul>
                </div>
            </c:if>
            <br/>
            <div class="order_news">
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
                        Copyright&copy;&nbsp;2017-2018&nbsp; 舞鹤物流有限责任公司.&nbsp;&nbsp;All&nbsp;&nbsp;rights&nbsp;&nbsp;reserved.
            &nbsp;&nbsp;新ICP备10005645
        </div>
    </div>
</div>
<!--底部-->
</body>
</html>
