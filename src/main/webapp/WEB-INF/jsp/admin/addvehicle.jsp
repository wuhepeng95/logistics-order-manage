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
        function add() {
            if ($("input[name='vehicleid']").val() === "") {
                alert("车牌号不能为空");
                return false;
            }
            if ($("select[name='state']").val() === 0) {
                alert("请选择车辆状态");
                return false;
            }
            alert("添加成功");
            return true;
        }
        function resetForm() {
            $("input[name='vehicleid']").val("");
            $("input[name='nowplace']").val("");
            $("select[name='state']").val(0);
            $("input[name='owner']").val("");
            $("input[name='driver']").val("");
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
            <a href="#">添加车辆</a>
        </ul>
        <br>
        <form action="/doAddVehicle" method="post" class="form-horizontal">
            <div class="control-group">
                <label class="control-label">车牌号</label>
                <div class="controls">
                    <input type="text" placeholder="请输入车牌号" name="vehicleid">
                </div>
            </div>
            <div class="control-group">
                <label class="control-label">现处位置</label>
                <div class="controls">
                    <input type="text" class="form-control" placeholder="位置" name="nowplace"/><br>
                </div>
            </div>
            <div class="control-group">
                <label class="control-label">状态</label>
                <div class="controls">
                    <select name="state">
                        <option value="0">请选择车辆状态</option>
                        <option value="1">正常运行</option>
                        <option value="2">报修停运</option>
                    </select>
                </div>
            </div>
            <div class="control-group">
                <label class="control-label">拥有者</label>
                <div class="controls">
                    <input type="text" class="form-control" placeholder="拥有者" name="owner"/><br>
                </div>
            </div>
            <div class="control-group">
                <label class="control-label">驾驶员</label>
                <div class="controls">
                    <input type="text" class="form-control" placeholder="驾驶员" name="driver"/><br>
                </div>
            </div>
            <div class="operation">
                <input type="submit" value="添加" class="btn btn-default" onclick="return add()"/>&nbsp;
                <input type="button" value="重置" class="btn btn-default" onclick="resetForm()"/>
            </div>
        </form>
    </div>
</div>
</body>
</html>
