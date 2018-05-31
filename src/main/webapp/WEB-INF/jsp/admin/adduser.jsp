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
            var username = $("input[name='username']").val();
            var reg = /^[\w]{2,12}$/;
            if (username === "") {
                alert("用户名不能为空");
                return false;
            } else if (!reg.test(username)) {
                alert("用户名格式不正确");
                return false;
            } else {
                var result;
                $.ajax({
                    type: 'post',
                    url: "checkName",
                    data: {"username": username},
                    async: false,
                    success: function (res) {
                        if (res === "true") {
                            alert("用户已存在!");
                            result = false;
                        }
                    }
                });
                if (result == false) {
                    return result;
                }
                if ($("select[name='role']").val() === "") {
                    alert("请选择角色");
                    return false;
                } else {
                    alert("添加成功");
                    return true;
                }
            }
        }

        function resetForm() {
            $("input[name='username']").val("");
            $("select[name='role']").val("");
            $("input[name='mobile']").val("");
            $("input[name='email']").val("");
            $("input[name='address']").val("");
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
        <form action="/doAddUser" method="post" class="form-horizontal">
            <div class="control-group">
                <label class="control-label">用户名</label>
                <div class="controls">
                    <input type="text" placeholder="2-12个字符" name="username">
                </div>
            </div>
            <div class="control-group">
                <label class="control-label">角色</label>
                <div class="controls">
                    <select name="role">
                        <option value="">请选择角色</option>
                        <option value="1">管理员</option>
                        <option value="2">运输员</option>
                        <option value="3">用户</option>
                    </select>
                </div>
            </div>
            <div class="control-group">
                <label class="control-label">手机号</label>
                <div class="controls">
                    <input type="text" class="form-control" placeholder="手机号" name="mobile"/><br>
                </div>
            </div>
            <div class="control-group">
                <label class="control-label">邮箱</label>
                <div class="controls">
                    <input type="text" class="form-control" placeholder="邮箱" name="email"/><br>
                </div>
            </div>
            <div class="control-group">
                <label class="control-label">地址</label>
                <div class="controls">
                    <input type="text" class="form-control" placeholder="地址" name="address"/><br>
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
