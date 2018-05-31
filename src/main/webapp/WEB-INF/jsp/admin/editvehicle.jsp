<%@ page import="i.am.whp.model.enums.VehicleState" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>舞鹤物流管理后台</title>
    <link rel="stylesheet" href="/css/bootstrap.css"/>
    <link rel="stylesheet" href="/css/admin.css"/>
    <script type="text/javascript" src="/js/jquery-3.1.0.min.js"></script>
    <script type="text/javascript" src="/js/bootstrap.min.js"></script>
    <script type="text/javascript">
        function cancelEdit() {
            location.href = "/getAllUser";
        }
    </script>
</head>

<body>
<div class="right" id="mainFrame">
    <div class="right_cont">
        <ul class="breadcrumb">当前位置：
            <a href="/adminindex" target="_parent">首页</a>
            <span class="divider">/</span>
            <a href="#">车辆管理</a>
            <span class="divider">/</span>
            <a href="#">修改车辆信息</a>
        </ul>
        <br>
        <form action="/doEditVehicle" method="post" class="form-horizontal">
            <div class="control-group">
                <label class="control-label">车牌号</label>
                <div class="controls" style="margin-top: 4px;">
                    <input type="hidden" name="vehicleid" value="${editvehicle.vehicleid}">
                    ${editvehicle.vehicleid}
                </div>
            </div>
            <div class="control-group">
                <label class="control-label">状态</label>
                <div class="controls" style="margin-top: 4px;">
                    ${VehicleState.valueOf(editvehicle.state).detail}
                </div>
            </div>
            <div class="control-group">
                <label class="control-label">现处位置</label>
                <div class="controls">
                    <input type="text" class="form-control" placeholder="现处位置" name="nowplace"
                           value="${editvehicle.nowplace}"/><br>
                </div>
            </div>
            <div class="control-group">
                <label class="control-label">拥有者</label>
                <div class="controls">
                    <input type="text" class="form-control" placeholder="拥有者" name="owner"
                           value="${editvehicle.owner}"/><br>
                </div>
            </div>
            <div class="control-group">
                <label class="control-label">驾驶员</label>
                <div class="controls">
                    <input type="text" class="form-control" placeholder="驾驶员" name="driver"
                           value="${editvehicle.driver}"/><br>
                </div>
            </div>
            <div class="operation">
                <input type="submit" value="修改" class="btn btn-default" onclick="javascript:alert('修改完成')"/>&nbsp;
                <input type="button" value="取消" class="btn btn-default" onclick="cancelEdit()"/>
            </div>
        </form>
    </div>
</div>
</body>
</html>
