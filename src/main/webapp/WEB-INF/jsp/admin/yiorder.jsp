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
    <script type="text/javascript">
        $(function () {
            $("#pagesize").blur(function () {
                var pageSize = $(this).val();
                location.href = "yiWancheng?pageNum=1&pageSize=" + pageSize;
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
            <a href="#">订单管理</a>
            <span class="divider">/</span>
            <a href="#">已完成订单</a>
        </ul>
        <table class="table table-striped table-bordered table-hover">
            <tr>
                <td>序号</td>
                <td>订单号</td>
                <td>拥有人</td>
                <td>重量</td>
                <td>总价</td>
                <td>类型</td>
                <td>下单时间</td>
                <td>操作</td>
            </tr>
            <% int index = 1;%>
            <c:forEach items="${allOrder}" var="order">
                <tr>
                    <td><%=index++%>
                    </td>
                    <td>${order.orderid}</td>
                    <td>${order.username}</td>
                    <td>${order.goodswt}</td>
                    <td>${order.postage}</td>
                    <td>${order.category}</td>
                    <td>${order.ordertime}</td>
                    <td>
                        <a href="adminOrderdetail?orderid=${order.orderid}">
                            <input type="button" value="详情" class="btn btn-default"/>
                        </a>
                        <a href="delorde?delid="+${order.orderid}> <input type="button" value="删除" class="btn btn-danger"/></a>
                    </td>
                </tr>
            </c:forEach>
        </table>
        <a href="/yiWancheng?pageNum=1&pageSize=${pagesize}">首页 </a>
        <a href="/yiWancheng?pageNum=${pagenum-1 le 1 ? 1 : pagenum-1}&pageSize=${pagesize}">上一页 </a>
        第${pagenum}/${pageTotal}页
        <a href="/yiWancheng?pageNum=${pagenum+1 ge pageTotal ? pageTotal : pagenum+1}&pageSize=${pagesize}">下一页 </a>
        <a href="/yiWancheng?pageNum=${pageTotal}&pageSize=${pagesize}">尾页</a>
        页面大小<input id="pagesize" type="text" value="${pagesize}" style="width: 20px;text-align: center"/>
        <br/>
    </div>
</div>
</body>
</html>
