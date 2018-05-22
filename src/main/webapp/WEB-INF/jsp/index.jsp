<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>舞鹤物流</title>
    <link rel="stylesheet" type="text/css" href="/css/reset.css"/>
    <link rel="stylesheet" type="text/css" href="/css/common.css"/>
    <link rel="shortcut icon" href="/images/logo.ico">
    <link rel="stylesheet" type="text/css" href="/css/alert.css"/>
    <script type="text/javascript" src="/js/alert.min.js" language="javascript"></script>
    <script type="text/javascript" src="/js/jquery-3.1.0.min.js"></script>
    <link rel="stylesheet" type="text/css" href="/css/index.css"/>
    <!--滑动门-->
    <script type="text/javascript">
        var i = 0;
        var timer;
        var imgs = new Array("/images/banner/banner1.jpg", "/images/banner/banner2.jpg", "/images/banner/banner3.jpg");

        /*图片轮播效果的实现*/
        function changeImg() {
            $('.banner img').attr('src', imgs[i]);
            timer = setTimeout('changeImg()', 2000);
            i++;
            if (i === 3)
                i = 0;
        }

        $(function () {
            changeImg();
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
    <!--滑动门-->
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
    <!--盒子1-->
    <div class="box_1 clearfix">
        <div class="box_1_l">
            <a href="book">网上下单<img src="/images/icon2.png"/></a>
            <a href="follow">货物追踪<img src="/images/icon2.png"/></a>
            <a href="personal">个人信息<img src="/images/icon2.png"/></a>
        </div>
        <div class="banner">
            <img width="705px" height="245px"/>
        </div>
    </div>
    <!--盒子1-->
    <div class="space_hx">&nbsp;</div>

    <div class="space_hx">&nbsp;</div>
    <!--盒子3-->
    <div class="box_3 clearfix">
        <div class="box_3_l">
            <div class="box_head">
                <span>合作单位</span>
            </div>
            <ul>
                <li>
                    <a href="http://www.yto.net.cn/gw/index/index.html">
                        圆通速递公司
                    </a>
                </li>
                <li>
                    <a href="http://www.sto.cn/">
                        申通快递有限公司
                    </a>
                </li>
                <li>
                    <a href="http://www.ems.com.cn/">
                        中国邮政速递物流
                    </a>
                </li>
                <li>
                    <a href="http://www.htky365.com/">
                        百世汇通快递
                    </a>
                </li>

                <li>
                    <a href="http://www.yundaex.com/cn/index.php">
                        上海韵达速递（物流）有限公司
                    </a>
                </li>
                <li>
                    <a href="http://www.ttkdex.com/">
                        天天快递
                    </a>
                </li>


            </ul>
        </div>
        <div class="box_3_r">
            <div class="box_head">
                <span>新闻</span>
            </div>
            <!--开始-->
            <div class="box16 clearfix">
                <ul>
                    <li>
                        <span><a
                                href="http://interest.mix.sina.com.cn/topic/cnl/?pid=2&channel=4531974">新浪网.物流</a></span>
                        <em>2018-05-15</em>
                    </li>
                    <li>
                        <span><a href="http://news.chinawutong.com/">中国物流资讯</a></span>
                        <em>2018-05-14</em>
                    </li>
                    <li>
                        <span><a href="http://www.clpn.com.cn/">中国物流新闻网</a></span>
                        <em>2018-05-15</em>
                    </li>
                    <li>
                        <span><a href="http://www.xd56b.com/zhuzhan/wlzx/">中国物流产业网</a></span>
                        <em>2018-05-17</em>
                    </li>
                    <li>
                        <span><a href="http://www.56888.net/News.aspx">全国物流信息网</a></span>
                        <em>2018-05-19</em>
                    </li>
                </ul>
            </div>
            <!--结束-->
        </div>
    </div>
    <!--盒子3-->
    <div class="space_hx">&nbsp;</div>
</div>
<!--中间部分-->

<!--底部-->
<div class="foot_bg">
    <div class="foot">
        <div class="copy">
            <a href="/adminlogin" target="_blank">管理后台</a>
            Copyright&copy;&nbsp;2017-2018&nbsp;舞鹤物流有限责任公司.&nbsp;&nbsp;All&nbsp;&nbsp;rights&nbsp;&nbsp;reserved.&nbsp;&nbsp;新ICP备10005645
        </div>
    </div>
</div>
<!--底部-->
</body>
</html>
