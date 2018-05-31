<%@ page import="i.am.whp.model.enums.Role" %>
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
            <a href="#">用户管理</a>
            <span class="divider">/</span>
            <a href="#">添加用户</a>
        </ul>
        <br>
        <form action="/doEditUser" method="post" class="form-horizontal">
            <div class="control-group">
                <label class="control-label">用户名</label>
                <div class="controls" style="margin-top: 4px;">
                    <input type="hidden" placeholder="2-12个字符" name="username" value="${edituser.username}">
                    ${edituser.username}
                </div>
            </div>
            <div class="control-group">
                <label class="control-label">角色</label>
                <div class="controls" style="margin-top: 4px;">
                    ${Role.valueOf(edituser.role).detail}
                </div>
            </div>
            <div class="control-group">
                <label class="control-label">手机号</label>
                <div class="controls">
                    <input type="text" class="form-control" placeholder="手机号" name="mobile" value="${edituser.mobile}"/><br>
                </div>
            </div>
            <div class="control-group">
                <label class="control-label">邮箱</label>
                <div class="controls">
                    <input type="text" class="form-control" placeholder="邮箱" name="email"
                           value="${edituser.email}"/><br>
                </div>
            </div>
            <div class="control-group">
                <label class="control-label">地址</label>
                <div class="controls">
                    <input type="text" class="form-control" placeholder="地址" name="address"
                           value="${edituser.address}"/><br>
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
