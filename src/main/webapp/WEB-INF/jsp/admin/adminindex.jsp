<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>舞鹤物流管理后台</title>
   <link rel="shortcut icon" href="/images/logo.png">
    <link rel="stylesheet" href="/css/bootstrap.css"/>
    <link rel="stylesheet" href="/css/admin.css"/>
    <script type="text/javascript" src="/js/jquery-3.1.0.min.js"></script>
    <script type="text/javascript" src="/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="/js/sdmenu.js"></script>
    <script type="text/javascript" src="/laydate/laydate.js"></script>
</head>

<body>
<div class="header">
    <div class="logo"><img src="/images/admintitle.png" align="middle"/></div>
    <div class="header-right">
        <i class="icon-user icon-white"></i>
        <a href="#" state="button" data-toggle="modal">管理员${sessionScope.backstage}</a>
        <i class="icon-off icon-white"></i>
        <a id="modal-973558" href="#modal-container-973558" state="button" data-toggle="modal">退出</a>
        <div id="modal-container-973558" class="modal hide fade" state="dialog" aria-labelledby="myModalLabel"
             aria-hidden="true" style="width:300px; margin-left:-150px; top:30%">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h3 id="myModalLabel">
                    注销系统
                </h3>
            </div>
            <div class="modal-body">
                <p>
                    您确定要注销退出系统吗？
                </p>
            </div>
            <div class="modal-footer">
                <button class="btn" data-dismiss="modal" aria-hidden="true">关闭</button>
                <a class="btn btn-primary" style="line-height:20px;" href="/clearLogin">确定退出</a>
            </div>
        </div>
    </div>
</div>
<!-- 顶部 -->

<div id="middle">
    <div class="left">
        <script type="text/javascript">
            var myMenu;
            window.onload = function () {
                myMenu = new SDMenu("my_menu");
                myMenu.init();
            };
        </script>

        <div id="my_menu" class="sdmenu">
            <div class="collapsed">
                <span>用户管理</span>
                <a href="/getAllUser" target="content">用户列表</a>
                <a href="/addUser" target="content">添加用户</a>
            </div>

            <div class="collapsed">
                <span>订单管理</span>
                <a href="/getAllOrder" target="content">全部订单</a>
                <a href="/daiLanjian"  target="content">待揽件订单</a>
                <a href="/yiWancheng"  target="content">已完成订单</a>
            </div>
            <div class="collapsed">
                <span>车辆管理</span>
                <a href="/getAllVehicle" target="content">全部车辆</a>
                <a href="/addVehicle" target="content">添加车辆</a>
            </div>
            <div class="collapsed">
                <span>价格控制</span>
                <a href="/getAllPrice" target="content">全部价单</a>
                <a href="/addprice" target="content">添加记录</a>
            </div>
        </div>
    </div>
    <div class="Switch"></div>
    <script type="text/javascript">
        $(document).ready(function (e) {
            $(".Switch").click(function () {
                $(".left").toggle();
            });
        });
    </script>

    <div class="right" id="mainFrame">
        <div class="right_cont">
            <div class="title_right"><strong>欢迎来到管理后台</strong></div>
            <iframe name="content" width="1000px" height="500px" frameborder="0" scrolling="no" src="/images/banner/banner3.jpg">
            </iframe>
        </div>
    </div>
</div>

<!-- 底部 -->
<div id="footer">Copyright&copy;&nbsp;2017-2018&nbsp; 舞鹤物流有限责任公司.&nbsp;&nbsp;All&nbsp;&nbsp;rights&nbsp;&nbsp;reserved.
    &nbsp;&nbsp;新ICP备10005645
</div>
</body>
</html>
