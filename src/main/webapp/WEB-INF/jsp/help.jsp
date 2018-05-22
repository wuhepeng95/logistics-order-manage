<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>帮助支持</title>
    <link rel="stylesheet" type="text/css" href="/css/reset.css"/>
    <link rel="stylesheet" type="text/css" href="/css/common.css"/>
    <link rel="shortcut icon" href="/images/logo.ico">
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
<div class="main">
    <!--新闻列表-->
    <div class="person clearfix">
        <div class="order_l person_l">
            <ul id="left_menu" class="left_menu">
                <li>
                    <a class="yiji"><span>关于我们</span></a>
                </li>
                <li>
                    <a class="yiji"><span>新手指南</span><em>&nbsp;</em></a>
                    <ul class="erji">
                        <li>
                            <i>&nbsp;</i>
                            <strong><a href="">如何注册</a></strong>
                        </li>
                        <li>
                            <i>&nbsp;</i>
                            <strong><a href="">如何追踪货物</a></strong>
                        </li>
                        <li>
                            <i>&nbsp;</i>
                            <strong><a href="">如何在线支付</a></strong>
                        </li>
                        <li>
                            <i>&nbsp;</i>
                            <strong><a href="">如何网上下单</a></strong>
                        </li>
                    </ul>
                </li>
                <li>
                    <a class="yiji"><span>常见问题</span><em>&nbsp;</em></a>
                    <ul class="erji">
                        <li>
                            <i>&nbsp;</i>
                            <strong><a href="">寄送货物</a></strong>
                        </li>
                        <li>
                            <i>&nbsp;</i>
                            <strong><a href="">追踪货物</a></strong>
                        </li>
                        <li>
                            <i>&nbsp;</i>
                            <strong><a href="">接收货物</a></strong>
                        </li>
                        <li>
                            <i>&nbsp;</i>
                            <strong><a href="">结算支付</a></strong>
                        </li>
                        <li>
                            <i>&nbsp;</i>
                            <strong><a href="">账户管理</a></strong>
                        </li>
                    </ul>
                </li>
                <li>
                    <a class="yiji"><span>下载中心</span></a>
                </li>
                <li>
                    <a class="yiji"><span>咨询/建议/投诉</span></a>
                </li>
            </ul>
        </div>
        <div class="person_r">
            <div class="person_h">
                <span>新手指南</span>
            </div>
            <div class="person_rmain">
                <div class="news_d">
                    零担（精准卡航、精准城运、精准汽运、精准空运）重货与轻货的区分为：货物的总重量（KG）和总体积（m3）的比值大于或等于210为重货，按重量计费；若比值低于210为轻货，按体积计费。如有疑问请联系当地营业部咨询。

                    快递（德邦快递）重货与轻货的区分为：A=货物实际重量， B=货物的体积重量（=长CM*宽CM*高CM/6000）
                    若A≥B，为重货，按实际重量计费；若A＜B，为轻货，按体积重量计费。如有疑问请联系当地营业部咨询。

                </div>
                <div class="content">
                    <img src="/upload/banner2.jpg" id="tupian" alt=""/>
                    <p>
                        &nbsp;&nbsp;舞鹤物流，主营国运输业务。截止2014年2月末，公司已开设直营网点4,300内公路多家，服务网络遍及全国，
                        自有营运车辆8,700余台，全国转运中心总面积超过92万平方米公司始终以客户为中心随时候命、持续创新，始终坚持自建营
                        业网点、自购进口车辆、搭建最优线路，优化运力成本，为客户提供快速高效、便捷及时、安全可靠的服务体验，助力客户创造最大的价值。
                    </p>
                    <div class="space_hx">&nbsp;</div>
                    <br>联系我们：<a href="">400-87654321</a>

                    <div class="space_hx">&nbsp;</div>
                    <br>招聘邮箱：<a href="">hr@wuhe.com</a>
                    公司名称:武汉中南信息物流有限公司
                    公司地址:武汉市洪山区烽火村乔木湾特1号(武昌武泰闸方向107国道旁)
                    总部电话:027-88110263(总机) 13517221678
                    传真电话:027-88128379
                    招商电话:027-88124640 88127640
                    免费信息发布:8008800268
                    信息查询专线:027-88128379
                    公司网址:www.zn56.com
                    公司邮箱:zn56@zn56.com ceo@zn56.com
                    信息发布联系:武汉中南信息物流有限公司信息中心
                </div>
            </div>
        </div>
    </div>
    <!--新闻列表-->
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
