<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>服务器出错</title>
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
                <h2>呀,服务出错了!500</h2>
                <p>
                    <span>
                        <b id="wait">3</b>秒后,
                        <a href="#" onclick="javascript:history.back(-1);">返回上页</a>
                        <br>
                        点击,<a href="/">&nbsp;转到主页</a>
                    </span>
                </p>
                <script type="text/javascript">
                    (function () {
                        var wait = document.getElementById('wait');
                        var interval = setInterval(function () {
                            var time = --wait.innerHTML;
                            if (time <= 0) {
                                clearInterval(interval);
                                location.href = history.back(-1);
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
