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
    <script language="javascript" src="/js/ckcity.js"></script>
    <script type="text/javascript">
        $(function () {
            loadcity();
        })

        function add() {
            alert("添加成功");
            return true;
        }

        function resetForm() {
            $("select[name='fahuoprovince']").val("");
            $("select[name='fahuocity']").val("");
            $("select[name='shouhuoprovince']").val("");
            $("select[name='shouhuocity']").val("");
            $("input[name='startprice']").val("");
            $("input[name='perkgprice']").val("");
            $("input[name='discount']").val("");
        }
    </script>
</head>

<body>
<div class="right" id="mainFrame">
    <div class="right_cont">
        <ul class="breadcrumb">当前位置：
            <a href="/adminindex" target="_parent">首页</a>
            <span class="divider">/</span>
            <a href="#">价格控制</a>
            <span class="divider">/</span>
            <a href="#">添加记录</a>
        </ul>
        <br>
        <form action="/doAddPrice" method="post" class="form-horizontal">
            <div class="control-group">
                <label class="control-label">发货城市</label>
                <div class="controls">
                    <select name="fahuoprovince" id="fahuoprovince"
                            onchange="cityName1(this.selectedIndex)">
                        <option value="">请选择省名</option>
                    </select>
                    <select name="fahuocity" id="fahuocity">
                        <option value="">请选择城名</option>
                    </select>
                </div>
            </div>
            <div class="control-group">
                <label class="control-label">收货城市</label>
                <div class="controls">
                    <select name="shouhuoprovince" id="shouhuoprovince"
                            onchange="cityName2(this.selectedIndex)">
                        <option value="">请选择省名</option>
                    </select>
                    <select name="shouhuocity" id="shouhuocity">
                        <option value="">请选择城名</option>
                    </select>
                </div>
            </div>

            <div class="control-group">
                <label class="control-label">起步价</label>
                <div class="controls">
                    <input type="text" class="form-control" placeholder="起步价" name="startprice"/><br>
                </div>
            </div>
            <div class="control-group">
                <label class="control-label">递增价</label>
                <div class="controls">
                    <input type="text" class="form-control" placeholder="递增价" name="perkgprice"/><br>
                </div>
            </div>
            <div class="control-group">
                <label class="control-label">折扣率</label>
                <div class="controls">
                    <input type="text" class="form-control" placeholder="折扣率" name="discount"/><br>
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
