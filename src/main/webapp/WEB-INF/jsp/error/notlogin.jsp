<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>你还未登录</title>
    <link href="/css/error.css" rel="stylesheet" type="text/css"/>
    <script type="text/javascript" src="/js/jquery-3.1.0.min.js"></script>
    <script type="text/javascript">
        $(function () {
            var h = $(window).height();
            $('body').height(h);
            $('.mianBox').height(h);
            centerWindow(".tipInfo");
        });

        //2.将盒子方法放入这个方，方便法统一调用
        function centerWindow(a) {
            center(a);
            //自适应窗口
            $(window).bind('scroll resize',
                function () {
                    center(a);
                });
        }

        //1.居中方法，传入需要剧中的标签
        function center(a) {
            var wWidth = $(window).width();
            var wHeight = $(window).height();
            var boxWidth = $(a).width();
            var boxHeight = $(a).height();
            var scrollTop = $(window).scrollTop();
            var scrollLeft = $(window).scrollLeft();
            var top = scrollTop + (wHeight - boxHeight) / 2;
            var left = scrollLeft + (wWidth - boxWidth) / 2;
            $(a).css({
                "top": top,
                "left": left
            });
        }
    </script>
</head>
<body>
<div class="mianBox">
    <img src="/images/yun0.png" alt="" class="yun yun0"/>
    <img src="/images/yun1.png" alt="" class="yun yun1"/>
    <img src="/images/yun2.png" alt="" class="yun yun2"/>
    <img src="/images/bird.png" alt="" class="bird"/>
    <img src="/images/san.png" alt="" class="san"/>
    <div class="tipInfo">
        <div class="in">
            <div class="textThis">
                <h2>哎呦，你还未登录!</h2>
                <p><span>
                     等待&nbsp;<b id="wait">3</b>秒,</span><span>跳转<a id="href" href="/login">登录</a><br><br>
                     页面跳转,返回<a href="/">主页</a><br>
                </span></p>
                <script type="text/javascript">
                    (function () {
                        var wait = document.getElementById('wait'), href = document.getElementById('href').href;
                        var interval = setInterval(function () {
                            var time = --wait.innerHTML;
                            if (time <= 0) {
                                clearInterval(interval);
                                location.href = href;
                            }
                        }, 1000);
                    })();
                </script>
            </div>
        </div>
    </div>
</div>

</body>
</html>
