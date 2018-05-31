<%--suppress CheckValidXmlInScriptTagBody --%>
<%@ page import="i.am.whp.model.enums.VehicleState" %>
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
    <link rel="stylesheet" type="text/css" href="/css/alert.css"/>
    <script type="text/javascript" src="/js/alert.min.js" language="javascript"></script>
    <script type="text/javascript" src="/js/jquery-3.1.0.min.js"></script>
    <script type="text/javascript" src="/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="/js/sdmenu.js"></script>
</head>

<body>
<div class="header">
    <div class="logo"><img src="/images/admintitle.png" align="middle"/></div>
    <div class="header-right">
        <i class="icon-user icon-white"></i>
        <a href="#" state="button" data-toggle="modal">运输员${sessionScope.backstage}</a>
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
                <span>物流管理</span>
                <a href="/changelogistics">更改物流信息</a>
            </div>
            <div class="collapsed">
                <span>车辆管理</span>
                <a href="/myvehicle">我的车辆</a>
            </div>
        </div>
    </div>

    <div class="right" id="mainFrame">
        <div class="right_cont">
            <ul class="breadcrumb">当前位置：
                <a href="#">车辆管理</a>
                <span class="divider">/</span>
                <a href="#">我的车辆</a>
            </ul>
            <div class="title_right"><strong>我的车辆</strong></div>
            <table class="table table-striped table-bordered table-hover">
                <tr>
                    <td>车牌号</td>
                    <td>现在位置</td>
                    <td>状态</td>
                    <td>操作</td>
                </tr>
                <c:forEach items="${myvehicle}" var="vehicle">
                    <tr>
                        <td>${vehicle.vehicleid}</td>
                        <td>${vehicle.nowplace}</td>
                        <td>${VehicleState.valueOf(vehicle.state).detail}</td>
                        <td>
                            <a href="changplace?vehicleid=${vehicle.vehicleid}">
                                <input type="button" value="变更位置信息" class="btn btn-default"/>
                            </a>
                            <c:if test="${vehicle.state == 1 }">
                                <a href="baoxiu?vehicleid=${vehicle.vehicleid}">
                                    <input type="button" value="停运报修" class="btn btn-danger"/>
                                </a>
                            </c:if>
                            <c:if test="${vehicle.state == 2 }">
                                <a href="huifu?vehicleid=${vehicle.vehicleid}">
                                    <input type="button" value="恢复运行" class="btn btn-success"/>
                                </a>
                            </c:if>

                        </td>
                    </tr>
                </c:forEach>
            </table>
        </div>
    </div>
    <c:if test="${not empty prevehicle}">
        <script>
            if (changNowPlace) {
                changNowPlace.show();
            }
            var changNowPlace = jqueryAlert({
                'title': '修改车辆所在地信息',
                'content': '<input id="changenowplace" type="text" value="${prevehicle.nowplace}"/><br>',
                'modal': true,
                'animateType': '',
                'buttons': {
                    '取消': function () {
                        changNowPlace.close();
                    },
                    '确定': function () {
                        $.post("doChangNowPlace", {
                            "vehicleid": '${prevehicle.vehicleid}',
                            "nowplace": $("#changenowplace").val()
                        }, function (result) {
                            if ("xgcg" === result) {
                                alert("修改成功");
                                location.href = "/myvehicle";
                            }
                        }, "text");
                    }
                }
            });
        </script>
    </c:if>
</div>

<!-- 底部 -->
<div id="footer">Copyright&copy;&nbsp;2017-2018&nbsp; 舞鹤物流有限责任公司.&nbsp;&nbsp;All&nbsp;&nbsp;rights&nbsp;&nbsp;reserved.
    &nbsp;&nbsp;新ICP备10005645
</div>
</body>
</html>
