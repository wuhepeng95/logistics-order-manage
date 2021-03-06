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
            <a href="#">车载信息</a>
        </ul>
        <table class="table table-striped table-bordered table-hover">
            <tr>
                <td>车牌号</td>
                <td>所载单号</td>
            </tr>
            <c:forEach items="${allVehicle}" var="vehicle">
                <tr>
                    <td>${vehicle.vehicleid}</td>
                    <td>${vehicle.nowplace}</td>
                    <td>${vehicle.owner}</td>
                    <td>${vehicle.state}</td>
                    <td>${vehicle.driver}</td>
                    <td>
                        <input type="button" value="编辑" class="btn btn-default"/>
                        <input type="button" value="报废" class="btn btn-danger"/>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </div>
</div>
</body>
</html>
