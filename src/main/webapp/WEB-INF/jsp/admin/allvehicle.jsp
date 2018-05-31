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
    <script type="text/javascript" src="/js/jquery-3.1.0.min.js"></script>
    <script type="text/javascript" src="/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="/js/sdmenu.js"></script>
    <script type="text/javascript" src="/laydate/laydate.js"></script>
</head>

<body>
<div class="right" id="mainFrame">
    <div class="right_cont">
        <ul class="breadcrumb">当前位置：
            <a href="#">车辆管理</a>
            <span class="divider">/</span>
            <a href="/getAllVehicle">全部车辆</a>
        </ul>
        <div class="title_right"><strong>全部车辆</strong></div>
        <table class="table table-striped table-bordered table-hover">
            <tr>
                <td>车牌号</td>
                <td>现在位置</td>
                <td>拥有者</td>
                <td>状态</td>
                <td>司机</td>
                <td>操作</td>
            </tr>
            <c:forEach items="${allVehicle}" var="vehicle">
                <tr>
                    <td>${vehicle.vehicleid}</td>
                    <td>${vehicle.nowplace}</td>
                    <td>${vehicle.owner}</td>
                    <td>${VehicleState.valueOf(vehicle.state).detail}</td>
                    <td>${vehicle.driver}</td>
                    <td>
                        <a href="/editVehicle?vehicleid=${vehicle.vehicleid}">
                            <input type="button" value="编辑" class="btn btn-default"/>
                        </a>
                        <a href="/delvehicle?vehicleid=${vehicle.vehicleid}">
                            <input type="button" value="报废" class="btn btn-danger" onclick="javascript:alert('删除成功')"/>
                        </a>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </div>
</div>
</body>
</html>
