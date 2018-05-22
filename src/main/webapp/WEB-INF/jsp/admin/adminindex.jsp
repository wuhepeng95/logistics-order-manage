<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>舞鹤物流管理后台</title>
    <link rel="shortcut icon" href="/images/logo.ico">
    <link rel="stylesheet" href="/css/bootstrap.css"/>
    <link rel="stylesheet" href="/css/admin.css"/>
    <script type="text/javascript" src="/js/jquery-3.1.0.min.js"></script>
    <script type="text/javascript" src="/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="/laydate/sdmenu.js"></script>
    <script type="text/javascript" src="/laydate/laydate.js"></script>
</head>

<body>
<div class="header">
    <div class="logo"><img src="/images/admintitle.png" align="middle"/></div>
    <div class="header-right">
        <i class="icon-user icon-white"></i>
        <a href="#" role="button" data-toggle="modal">管理员${sessionScope.backstage}</a>
        <i class="icon-off icon-white"></i>
        <a id="modal-973558" href="#modal-container-973558" role="button" data-toggle="modal">退出</a>
        <div id="modal-container-973558" class="modal hide fade" role="dialog" aria-labelledby="myModalLabel"
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
                <a href="#">查看用户</a>
                <a href="#">修改用户</a>
                <a href="#">添加用户</a>
            </div>
            <div class="collapsed">
                <span>物流管理</span>
                <a href="#">更改信息</a>
                <a href="#">已发货订单</a>
                <a href="#">在途中订单</a>
                <a href="#">已收货订单</a>
            </div>
            <div class="collapsed">
                <span>车辆管理</span>
                <a href="#">车辆信息</a>
                <a href="#">车载信息</a>
                <a href="#">车辆配运</a>
            </div>
            <div class="collapsed">
                <span>系统管理</span>
                <a href="#">线路管理</a>
                <a href="#">手续费设置</a>
                <a href="#">更改密码</a>
                <a href="#">系统日志</a>
                <a href="#">帐号管理</a>
                <a href="#">复核设置</a>
                <a href="#">部门管理</a>
                <a href="#">角色管理</a>
                <a href="#">用户管理</a>
                <a href="#">短信设置</a>
                <a href="#">短信发送</a>
                <a href="#">分理处分成设置</a>
                <a href="#">省价格设置</a>
                <a href="#">市价格设置</a>
                <a href="#">县价格设置</a>
            </div>
            <div class="collapsed">
                <span>财务管理</span>
                <a href="#">分公司日报</a>
                <a href="#">科目管理</a>
                <a href="#">费用录入</a>
                <a href="#">费用统计</a>
                <a href="#">当日对账</a>
                <a href="#">往日对账</a>
                <a href="#">利润分成</a>
            </div>
            <div class="collapsed">
                <span>客户管理</span>
                <a href="#">客户投诉</a>
                <a href="#">投诉处理</a>
                <a href="#">投诉查询</a>
                <a href="#">客户关怀</a>
                <a href="#">积分查询</a>
                <a href="#">分理处排行</a>
                <a href="#">客户管理</a>
                <a href="#">理赔申请</a>
                <a href="#">理赔审核</a>
                <a href="#">理赔结算</a>
                <a href="#">理赔查询</a>
            </div>
            <div class="collapsed">
                <span>行政办公</span>
                <a href="#">文件管理</a>
                <a href="#">在线留言</a>
                <a href="#">人事管理</a>
                <a href="#">公告管理</a>
                <a href="#">罚款登记</a>
                <a href="#">滚动字幕</a>

            </div>
            <div class="collapsed">
                <span>工资及包车费管理</span>
                <a href="#">工资管理</a>
                <a href="#">包车费管理</a>
                <a href="#">房租管理</a>
                <a href="#">货场费管理</a>
            </div>
            <div class="collapsed">
                <span>领导决策</span>
                <a href="#">新增客户分析</a>
                <a href="#">长期未发货分析</a>
                <a href="#">同比业务分析</a>
                <a href="#">环比业务分析</a>
                <a href="#">超期预警</a>
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
            <ul class="breadcrumb">当前位置：
                <a href="#">首页</a> <span class="divider">/</span>
            </ul>
            <div class="title_right"><strong>欢迎来到管理后台</strong></div>
        </div>
    </div>
</div>

<!-- 底部 -->
<div id="footer">Copyright&copy;&nbsp;2017-2018&nbsp; 舞鹤物流有限责任公司.&nbsp;&nbsp;All&nbsp;&nbsp;rights&nbsp;&nbsp;reserved.
    &nbsp;&nbsp;新ICP备10005645
</div>
<script>
    !function () {
        laydate.skin('molv');
        laydate({elem: '#Calendar'});
    }();
</script>
</body>
</html>
