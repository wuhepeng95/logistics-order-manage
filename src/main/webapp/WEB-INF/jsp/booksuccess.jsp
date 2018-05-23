<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>下单成功</title>
    <link rel="shortcut icon" href="/images/logo.ico">
    <link rel="stylesheet" type="text/css" href="/css/reset.css"/>
    <link rel="stylesheet" type="text/css" href="/css/common.css"/>
    <link rel="stylesheet" type="text/css" href="/css/theme.css"/>
    <link rel="stylesheet" type="text/css" href="/css/alert.css"/>
    <script type="text/javascript" src="/js/alert.min.js" language="javascript"></script>
    <script type="text/javascript" src="/js/jquery-3.1.0.min.js"></script>

    <script type="text/javascript" src="/js/sdmenu.js"></script>
    <script type="text/javascript" src="/js/clipboard.min.js"></script>
    <script type="text/javascript" src="/laydate/laydate.js"></script>
    <script type="text/javascript">
        $(function () {
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
            });
            $("#Calendar").click(function () {
                laydate.skin('molv');
                laydate({elem: '#Calendar'});
            });
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
<div class="space_hx">&nbsp;</div>
<!--中间部分-->
<div class="main">
    <div class="space_hx">&nbsp;</div>
    <div class="space_hx">&nbsp;</div>
    <div class="space_hx">&nbsp;</div>
    恭喜你下单成功!<br>
    <div class="space_hx">&nbsp;</div>
    <span style="color:red;font-size:25px;">${orderid}</span>
    <div class="space_hx">&nbsp;</div>
    <button class="btn">复制订单号</button>
    <script>
        var clipboard = new ClipboardJS('.btn', {
            target: function () {
                return document.querySelector('span');
            }
        });
        clipboard.on('success', function (e) {
            alert("订单号复制成功,可直接粘贴使用！");
        });
    </script>
    <div class="space_hx">&nbsp;</div>
    <div class="space_hx">&nbsp;</div>
    <div class="space_hx">&nbsp;</div>
    请选择支付方式:
    <input type="radio" checked="checked" name="activity">立刻支付
    <input type="radio" name="activity">上门再付
    <input type="radio" name="activity">货到付款
    <div class="space_hx">&nbsp;</div>
    <div class="space_hx">&nbsp;</div>
    <div class="space_hx">&nbsp;</div>
    请选择上门时间:
    <input type="text" id="Calendar" class="laydate-icon span1-1"  value="">
    <input type="button" value="确认">
</div>
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
