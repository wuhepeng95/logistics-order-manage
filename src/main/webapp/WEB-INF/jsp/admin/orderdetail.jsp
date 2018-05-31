<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>订单中心-订单详情</title>
    <link rel="stylesheet" type="text/css" href="/css/reset.css"/>
    <link rel="stylesheet" type="text/css" href="/css/common.css"/>
    <link rel="shortcut icon" href="/images/logo.png">
    <link rel="stylesheet" type="text/css" href="/css/theme.css"/>
    <link rel="stylesheet" type="text/css" href="/css/alert.css"/>
    <script type="text/javascript" src="/js/alert.min.js" language="javascript"></script>
    <script type="text/javascript" src="/js/jquery-3.1.0.min.js"></script>
</head>

<body>
<div class="order_r">
    <div class="order_h">
        <span>订单详情</span>
    </div>
    <div id="orderDetail">
        <ul>
            <li>
                <span>订单号：</span>
                <em>${orderDetail.orderid}</em>
            </li>
            <li>
                <span>拥有者：</span>
                <em>${orderDetail.username}</em>
            </li>
            <li>
                <span>货物重量(KG)：</span>
                <em>${orderDetail.goodswt}</em>
            </li>
            <li>
                <span>总邮费(元)：</span>
                <em>${orderDetail.postage}</em>
            </li>
            <li>
                <span>货物类型：</span>
                <em>${orderDetail.category}</em>
            </li>
            <div class="space_hx">&nbsp;</div>
            <li>
                <span>收货人姓名：</span>
                <em>${orderDetail.consigneename}</em>
            </li>
            <li>
                <span>收货人电话：</span>
                <em>${orderDetail.consigneephone}</em>
            </li>
            <li>
                <span>收货人地址：</span>
                <em>${orderDetail.reachaddress}</em>
            </li>
            <li>
                <span>发货人姓名：</span>
                <em>${orderDetail.consignorname}</em>
            </li>
            <li>
                <span>发货人电话：</span>
                <em>${orderDetail.consignorphone}</em>
            </li>
            <li>
                <span>发货人地址：</span>
                <em>${orderDetail.sendaddress}</em>
            </li>
            <div class="space_hx">&nbsp;</div>
            <li>
                <span>下单时间：</span>
                <em>${orderDetail.ordertime}</em>
            </li>
            <li>
                <span>订单状态：</span>
                <em>${orderDetail.orderstate}</em>
            </li>
        </ul>
    </div>
</div>
</body>
</html>
