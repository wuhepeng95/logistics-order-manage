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
</head>

<body>
    <div class="right" id="mainFrame">
        <div class="right_cont">
            <ul class="breadcrumb">当前位置：
                <a href="/adminindex" target="_parent">首页</a>
                <span class="divider">/</span>
                <a href="#">用户管理</a>
                <span class="divider">/</span>
                <a href="/getAllUser">用户列表</a>
            </ul>
            <div class="title_right"><strong>用户列表</strong></div>
            <table class="table table-striped table-bordered table-hover">
                <tr>
                    <td>用户id</td>
                    <td>用户名</td>
                    <td>角色</td>
                    <td>手机号</td>
                    <td>邮箱</td>
                    <td>地址</td>
                    <td>操作</td>
                </tr>
                <c:forEach items="${allUser}" var="user">
                    <tr>
                        <td>${user.userid}</td>
                        <td>${user.username}</td>
                        <td>${user.role}</td>
                        <td>${user.mobile}</td>
                        <td>${user.email}</td>
                        <td>${user.address}</td>
                        <td>
                            <input type="button" value="编辑" class="btn btn-default"/>
                            <input type="button" value="停用" class="btn btn-danger"/>
                        </td>
                    </tr>
                </c:forEach>
            </table>
        </div>
    </div>
</body>
</html>
