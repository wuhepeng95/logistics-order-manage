<%--suppress CheckValidXmlInScriptTagBody --%>
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
    <script language="javascript" src="/js/ckcity.js"></script>
    <script type="text/javascript">
        $(function () {
            $("#pagesize").blur(function () {
                var pageSize = $(this).val();
                location.href = "getAllOrder?pageNum=1&pageSize=" + pageSize;
            })
        })
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
            <a href="#">所有价单</a>
        </ul>
        <table class="table table-striped table-bordered table-hover">
            <tr>
                <td>出发城市</td>
                <td>到达城市</td>
                <td>起步价</td>
                <td>递增价</td>
                <td>折扣率</td>
                <td>操作</td>
            </tr>
            <c:forEach items="${allPrice}" var="price">
                <tr>
                    <td>${price.sendcity}</td>
                    <td>${price.reachcity}</td>
                    <td>${price.startprice}</td>
                    <td>${price.perkgprice}</td>
                    <td>${price.discount}</td>
                    <td>
                        <a href="editPrice?priceid=${price.priceid}">
                            <input type="button" value="修改" class="btn btn-default"/>
                        </a>
                        <a href="cancelDiscount?priceid=${price.priceid}">
                            <input type="button" value="取消折扣" class="btn btn-danger" onclick="javascript:alert('取消成功')"/>
                        </a>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </div>
</div>
</body>
</html>
