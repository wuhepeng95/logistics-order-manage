<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>订单中心-发货信息</title>
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
            $("#clearLogin").click(function () {
                if (logouthialog) {
                    return logouthialog.show();
                }
                var logouthialog = jqueryAlert({
                    'title': '注销系统',
                    'content': '确认退出本系统?你仍可查看订单价格和物流信息。',
                    'modal': true,
                    'buttons': {
                        '暂不': function () {
                            logouthialog.close();
                        },
                        '注销': function () {
                            location.href = "/clearLogin";
                        }
                    }
                });
            })
            $("#")
        });
    </script>
    <style type="text/css">
        #ta {
            margin: 5px;
        }
    </style>
    <style type="text/css">
        table {
            border-top: 1px solid #CFCFCF;
            border-left: 1px solid #CFCFCF;
        }

        th, th {
            border-bottom: 1px solid #CFCFCF;
            border-right: 1px solid #CFCFCF;
        }

        th, th {
            padding-left: 10px;
            padding-right: 10px;
        }

        th {
            color: black;
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
            <c:if test="${empty consignorInfos}">
                暂无发货人信息!
            </c:if>
            <c:if test="${not empty consignorInfos}">
                <div class="order_h">
                    <span>我的发货人信息</span>
                </div>
                <table border="0" width=100% cellpadding=0% id="ta">
                    <tr>
                        <th>发货人</th>
                        <th>发货人电话</th>
                        <th>发货人地址</th>
                        <th>邮编</th>
                        <th>操作</th>
                    </tr>
                    <c:forEach items="${consignorInfos}" var="consignorinfo">
                        <tr>
                            <th>${consignorinfo.consignorname}</th>
                            <th>${consignorinfo.consignorphone}</th>
                            <th>${consignorinfo.sendaddress}</th>
                            <th>${consignorinfo.zipcode}</th>
                            <th><a href="queryConsignorInfoById?consignorid=${consignorinfo.consignorid}">修改</a>&nbsp;
                                <a href="delConsignorInfo?consignorid=${consignorinfo.consignorid}">删除</a></th>
                        </tr>
                    </c:forEach>
                </table>
            </c:if>

            <div class="space_hx">&nbsp;</div>

            <c:if test="${empty consigneeInfos}">
                暂无收货人信息!
            </c:if>
            <c:if test="${not empty consigneeInfos}">
                <div class="order_h">
                    <span>我的收货人信息</span>
                </div>
                <table border="0" width=100% cellpadding=0% id="ta">
                    <tr>
                        <th>收货人</th>
                        <th>收货人电话</th>
                        <th>收货人地址</th>
                        <th>邮编</th>
                        <th>操作</th>
                    </tr>
                    <c:forEach items="${consigneeInfos}" var="consigneeinfo">
                        <tr>
                            <th>${consigneeinfo.consigneename}</th>
                            <th>${consigneeinfo.consigneephone}</th>
                            <th>${consigneeinfo.reachaddress}</th>
                            <th>${consigneeinfo.zipcode}</th>
                            <th><a href="queryConsigneeInfoById?consigneeid=${consigneeinfo.consigneeid}">修改</a>&nbsp;
                                <a href="delConsigneeInfo?consigneeid=${consigneeinfo.consigneeid}">删除</a></th>
                        </tr>
                    </c:forEach>
                </table>
            </c:if>
        </div>
    </div>
    <!--订单中心-->
    <div class="space_hx">&nbsp;</div>

    <c:if test="${not empty consignorInfo}">
        <script>
            if (editconsignorInfo) {
                editconsignorInfo.show();
            }
            var editconsignorInfo = jqueryAlert({
                'title': '修改收货人信息',
                'content': '收货人姓名<input id="editconsignorname" type="text" value="${consignorInfo.consignorname}"/><br>收货人电话<input id="editconsignorphone" type="text" value="${consignorInfo.consignorphone}"/><br>收货人地址<input id="editsendaddress" type="text" value="${consignorInfo.sendaddress}"/><br>收货人邮编<input id="editzipcodeor" type="text" value="${consignorInfo.zipcode}"/><br>',
                'modal': true,
                'animateType': '',
                'buttons': {
                    '取消': function () {
                        editconsignorInfo.close();
                    },
                    '确定': function () {
                        $.post("editConsignorInfo", {
                            "editconsignorid":${consignorInfo.consignorid},
                            "editconsignorname": $("#editconsignorname").val(),
                            "editconsignorphone": $("#editconsignorphone").val(),
                            "editsendaddress": $("#editsendaddress").val(),
                            "editzipcodeor": $("#editzipcodeor").val()
                        }, function (result) {
                            if ("xgcg" === result) {
                                alert("修改成功");
                                location.href = "consigninfo";
                            }
                        }, "text");
                    }
                }
            });
        </script>
    </c:if>
    <c:if test="${not empty consigneeInfo}">
        <script>
            if (editconsigneeInfo) {
                editconsigneeInfo.show();
            }
            var editconsigneeInfo = jqueryAlert({
                'title': '修改收货人信息',
                'content': '收货人姓名<input id="editconsigneename" type="text" value="${consigneeInfo.consigneename}"/><br>收货人电话<input id="editconsigneephone" type="text" value="${consigneeInfo.consigneephone}"/><br>收货人地址<input id="editreachaddress" type="text" value="${consigneeInfo.reachaddress}"/><br>收货人邮编<input id="editzipcodeee" type="text" value="${consigneeInfo.zipcode}"/><br>',
                'modal': true,
                'animateType': '',
                'buttons': {
                    '取消': function () {
                        editconsigneeInfo.close();
                    },
                    '确定': function () {
                        $.post("editConsigneeInfo", {
                            "editconsigneeid":${consigneeInfo.consigneeid},
                            "editconsigneename": $("#editconsigneename").val(),
                            "editconsigneephone": $("#editconsigneephone").val(),
                            "editreachaddress": $("#editreachaddress").val(),
                            "editzipcodeee": $("#editzipcodeee").val()
                        }, function (result) {
                            if ("xgcg" === result) {
                                alert("修改成功");
                                location.href = "consigninfo";
                            }
                        }, "text");
                    }
                }
            });
        </script>
    </c:if>


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
