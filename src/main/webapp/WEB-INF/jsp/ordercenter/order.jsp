<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>订单中心-个人订单</title>
    <link rel="stylesheet" type="text/css" href="/css/reset.css"/>
    <link rel="stylesheet" type="text/css" href="/css/common.css"/>

   <link rel="shortcut icon" href="/images/logo.png">
    <link rel="stylesheet" type="text/css" href="/css/theme.css"/>
    <link rel="stylesheet" type="text/css" href="/css/alert.css"/>
    <script type="text/javascript" src="/js/alert.min.js" language="javascript"></script>
    <script type="text/javascript" src="/js/jquery-3.1.0.min.js"></script>
    <script type="text/javascript">
        $(function () {
            $("#left_menu li ul").css("display", "block");
            $("#left_menu li .yiji").click(function () {
                $(this).parents("li").find(".erji").toggle();
            });
            $("tr:odd").css("background", "#CFCFCF");
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
        table {
            border-top: 1px solid #CFCFCF;
            border-left: 1px solid #CFCFCF;
        }

        th, td {
            border-bottom: 1px solid #CFCFCF;
            border-right: 1px solid #CFCFCF;
        }

        th, td {
            padding-left: 10px;
            padding-right: 10px;
            height: 30px;
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
                <span>我的所有订单</span>
            </div>
            <table border="0" width=100% cellpadding=0% id="ta">
                <tr>
                    <th>订单编号</th>
                    <th>货物重量（kg）</th>
                    <th>邮费（元）</th>
                    <th>下单时间</th>
                    <th>操作</th>
                </tr>
                <c:forEach items="${orderInfos}" var="orderinfo">
                    <tr>
                        <th>${orderinfo.orderid}</th>
                        <th>${orderinfo.goodswt}</th>
                        <th>${orderinfo.postage}</th>
                        <th>${orderinfo.ordertime}</th>
                        <th>
                            <a href="deleteorder?delid=${orderinfo.orderid}" onclick="javascript:alert('删除成功');">删除</a>&nbsp;
                            <a href="orderdetail?orderid=${orderinfo.orderid}">详情</a>&nbsp;
                            <a href="follow?orderid=${orderinfo.orderid}">追踪</a>
                        </th>
                    </tr>
                </c:forEach>
            </table>
            <c:if test="${empty orderInfos}">
                <tr>抱歉，你暂时没有订单，赶紧<a href="/book">下单</a>吧!</tr>
            </c:if>
            <br/>
            <a href="/order?pageNum=1">首页 </a>
            <a href="/order?pageNum=${pagenum-1 le 1 ? 1 : pagenum-1}">上一页 </a>
            第${pagenum}/${pageTotal}页
            <a href="/order?pageNum=${pagenum+1 ge pageTotal ? pageTotal : pagenum+1}">下一页 </a>
            <a href="/order?pageNum=${pageTotal}">尾页 </a>
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
