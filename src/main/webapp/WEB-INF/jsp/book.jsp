<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>网上下订单</title>

    <link rel="shortcut icon" href="/images/logo.ico">
    <link rel="stylesheet" type="text/css" href="/css/reset.css"/>
    <link rel="stylesheet" type="text/css" href="/css/common.css"/>
    <link rel="stylesheet" type="text/css" href="/css/theme.css"/>
    <link rel="stylesheet" type="text/css" href="/css/alert.css"/>

    <script type="text/javascript" src="/js/alert.min.js" language="javascript"></script>
    <script language="javascript" src="/js/jquery-3.1.0.min.js"></script>
    <script language="javascript" src="/js/bootstrap.min.js"></script>
    <script language="javascript" src="/js/ckcity.js"></script>
</head>
<script type="text/javascript">
    $(function () {
        loadcity();
        $(".queryprice").click(function () {
            $.get(
                "queryPrice",
                {
                    "fahuoprovince": $("#fahuoprovince").val(),
                    "fahuocity": $("#fahuocity").val(),
                    "shouhuoprovince": $("#shouhuoprovince").val(),
                    "shouhuocity": $("#shouhuocity").val()
                },
                function (result) {
                    if (result != null) {
                        jqueryAlert({
                            'icon': '/images/right.png',
                            'content': '查询到相关信息!',
                            'closeTime': 500
                        }).show();
                        $("#startprice").html(result.startprice);
                        $("#perkgprice").html(result.perkgprice);
                        $("#sendcity").val(result.sendcity);
                        $("#reachcity").val(result.reachcity);
                    } else {
                        jqueryAlert({
                            'icon': '/images/warning.png',
                            'content': '未查询到相关信息!',
                            'closeTime': 500
                        }).show();
                        $("#startprice").html(0);
                        $("#perkgprice").html(0);
                        $("#sendcity").val();
                        $("#reachcity").val();
                    }
                }, "json"
            );
        });
        $("#totalweight").keyup(function () {
            var weight = parseFloat($(this).prop("value"));
            if (weight === 0 | isNaN(weight)) {
                $("#totalprice").html(0);
                $("#totalprice2").val(0);
            } else {
                var start = parseFloat($("#startprice").text());
                var perkg = parseFloat($("#perkgprice").text());
                var discount = parseFloat($("#discount").text());
                var total = (start + Math.ceil(weight - 1) * perkg) * discount;
                $("#totalprice").html(total.toFixed(2));
                $("#totalprice2").val(total.toFixed(2));
            }
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
        });
        $("#xiadan").submit(function () {
            if ($("#totalweight").val() == "") {
                alert("请输入预期重量");
                return false;
            }

            var fahuoprovince = $("#fahuoprovince").val();
            var fahuocity = $("#fahuocity").val();
            var shouhuoprovince = $("#shouhuoprovince").val();
            var shouhuocity = $("#shouhuocity").val();

            if ($("#sendcity").val() !== fahuoprovince.concat(fahuocity)) {
                alert("发货城市信息不匹配");
                return false;
            }
            if ($("#reachcity").val() !== shouhuoprovince.concat(shouhuocity)) {
                alert("收货城市信息不匹配");
                return false;
            }
            alert("添加成功");
            return true;
        });
        $("#consignorhistory").change(function () {
            var history = $(this).val();
            var strings = history.split(",");
            $("#consignorName").val(strings[0]);
            $("#consignorPhone").val(strings[1]);
            $("#sendcity").val(strings[2]);
            $("#sendAddress").val(strings[3]);
            $("#sendZip").val(strings[4]);
        });
        $("#consigneehistory").change(function () {
            var history = $(this).val();
            var strings = history.split(",");
            $("#consigneeName").val(strings[0]);
            $("#consigneePhone").val(strings[1]);
            $("#reachcity").val(strings[2]);
            $("#reachAddress").val(strings[3]);
            $("#reachZip").val(strings[4]);
        });
    })
</script>

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
                <script type="text/javascript">
                    $(function () {
                        if (notloginAlert) {
                            return notloginAlert.show();
                        }
                        var notloginAlert = jqueryAlert({
                            'title': '注意',
                            'content': '你还未登录,你只可以查看价格,需要下单请登录!',
                            'modal': true,
                            'animateType': '',
                            'buttons': {
                                '看看就好': function () {
                                    notloginAlert.close();
                                },
                                '登陆下单': function () {
                                    location.href = "/login";
                                }
                            }
                        });
                    })
                </script>
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
                    <li class="now"><em>网上下单</em><span>&nbsp;</span></li>
                    <li><a href="follow">货物追踪</a></li>
                </ul>
                <div class="tabCont" style="display:block;">
                    <div class="book_m">
                        <div class="space_hx">&nbsp;</div>
                        <div class="space_hx">&nbsp;</div>
                        <form id="xiadan" action="addNewOrder" method="post">
                            1.请选择发货城市和收货城市
                            <div class="space_hx">&nbsp;</div>
                            <div class="fahuo">
                                发货城市
                                <select name="fahuoprovince" id="fahuoprovince"
                                        onchange="cityName1(this.selectedIndex)">
                                    <option value="">请选择省名</option>
                                </select>
                                <select name="fahuocity" id="fahuocity">
                                    <option value="">请选择城名</option>
                                </select>
                                到达城市
                                <select name="shouhuoprovince" id="shouhuoprovince"
                                        onchange="cityName2(this.selectedIndex)">
                                    <option value="">请选择省名</option>
                                </select>
                                <select name="shouhuocity" id="shouhuocity">
                                    <option value="">请选择城名</option>
                                </select>
                                <a class="queryprice" href="#">查询价格</a>
                            </div>
                            <div class="space_hx">&nbsp;</div>
                            <table>
                                <tr>
                                    <td>起步价(￥)</td>
                                    <td>递增价(￥/kg)</td>
                                </tr>
                                <tr>
                                    <td id="startprice">0</td>
                                    <td id="perkgprice">0</td>
                                </tr>
                            </table>
                            <div class="space_hx">&nbsp;</div>
                            2.请输入货物类型和重量(不满1kg都按1kg计算)
                            <div class="space_hx">&nbsp;</div>

                            <span style="margin-left: 55px">请选择你的货物类型：</span>
                            <select name="category">
                                <option value="普通" selected="selected">普通</option>
                                <option value="贵重">贵重</option>
                                <option value="特殊">特殊</option>
                                <option value="其他">其他</option>
                            </select>
                            <table>
                                <tr>
                                    <td>总重量(kg)</td>
                                    <td>折扣率</td>
                                    <td>总价格(￥)</td>
                                </tr>
                                <tr>
                                    <td><input id="totalweight" name="totalweight" type="text" class="wenben"
                                               placeholder="在这里输入"></td>
                                    <td id="discount">0.92</td>
                                    <td><i id="totalprice">0</i></td>
                                    <input type="hidden" name="totalprice" id="totalprice2"/>
                                </tr>
                            </table>
                            <div class="space_hx">&nbsp;</div>
                            3.请填写收发货必要信息(带*为必填)
                            <div class="txxx clearfix">
                                <!--发货人信息-->
                                <div class="txxx_l">
                                    <div class="txxx_h">
                                        <span>发货人信息</span>
                                    </div>
                                    <select id="consignorhistory">
                                        <option>选取历史发货人信息</option>
                                        <c:forEach items="${consignorInfos}" var="consignorinfo">
                                            <option>${consignorinfo.consignorname},${consignorinfo.consignorphone},${consignorinfo.sendaddress},${consignorinfo.zipcode}</option>
                                        </c:forEach>
                                    </select>
                                    <ul>
                                        <li>
                                	<span>
                                    	<i>&nbsp;</i>
                                        发货人
                                    </span>
                                            <input name="consignorName" id="consignorName" type="text">
                                        </li>
                                        <li>
                                	<span>
                                        <i>&nbsp;</i>
                                        手机
                                    </span>
                                            <input name="consignorPhone" id="consignorPhone" type="text">
                                        </li>

                                        <li>
                                	<span>
                                    	<i>&nbsp;</i>
                                        发货城市
                                    </span>
                                            <input name="sendAddress" id="sendcity" type="text"
                                                   placeholder="请选择/输入城市名称"></li>
                                        <li>
                                    <span>
                                    	<i>&nbsp;</i>
                                        详细地址
                                    </span>
                                            <input name="sendAddress" type="text" id="sendAddress"
                                                   placeholder="请输入街道地址">
                                        </li>
                                        <li>
                                    <span>
                                    	<i>&nbsp;</i>
                                        邮编
                                    </span>
                                            <input name="sendZip" type="text" id="sendZip"
                                                   placeholder="请输入发货地邮编">
                                        </li>
                                    </ul>
                                </div>

                                <!--发货人信息-->

                                <!--收货人信息-->
                                <div class="txxx_r">
                                    <div class="txxx_h">
                                        <span>收货人信息</span>
                                    </div>
                                    <select id="consigneehistory">
                                        <option>选取历史收货人信息</option>
                                        <c:forEach items="${consigneeInfos}" var="consigneeinfo">
                                            <option>${consigneeinfo.consigneename},${consigneeinfo.consigneephone},${consigneeinfo.reachaddress},${consigneeinfo.zipcode}</option>
                                        </c:forEach>
                                    </select>
                                    <ul>
                                        <li>
                                	<span>
                                    	<i>&nbsp;</i>
                                        收货人
                                    </span>
                                            <input name="consigneeName" id="consigneeName" type="text">
                                        </li>
                                        <li>
                                	<span>
                                       <i>&nbsp;</i>
                                        手机
                                    </span>
                                            <input name="consigneePhone" id="consigneePhone" type="text">
                                        </li>

                                        <li>
                                	<span>
                                    	<i>&nbsp;</i>
                                        收货城市
                                    </span>
                                            <input name="reachAddress" id="reachcity" type="text"
                                                   placeholder="请选择/输入城市名称"></li>
                                        <li>
                                    <span>
                                    	<i>&nbsp;</i>
                                        详细地址
                                    </span>
                                            <input name="reachAddress" id="reachAddress" type="text"
                                                   placeholder="请输入街道地址">
                                        </li>
                                        <li>
                                    <span>
                                    	<i>&nbsp;</i>
                                        邮编
                                    </span>
                                            <input name="reachZip" id="reachZip" type="text"
                                                   placeholder="请输入收货地邮编">
                                        </li>
                                    </ul>
                                </div>
                                <!--收货人信息-->
                            </div>
                            <div class="space_hx">&nbsp;</div>
                            <div class="xiadan_btn">
                                <input type="submit" class="sub" value="立刻下单">
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
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
