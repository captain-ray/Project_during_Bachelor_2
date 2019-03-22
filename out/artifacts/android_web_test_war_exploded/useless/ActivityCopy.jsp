<%@ page import="DAO.ActivityDAO" %>
<%@ page import="javabean.Activity" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: ray
  Date: 2017/5/29
  Time: 下午6:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Let's Go!</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"/>

    <link rel="stylesheet" href="../css/font-awesome.min.css"/>
    <%--<link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.min.css"/>--%>


    <link rel="stylesheet" href="../css/jquery.mobile-1.4.5.min.css"/>
    <%--<link rel="stylesheet" href="http://ajax.googleapis.com/ajax/libs/jquerymobile/1.4.5/jquery.mobile.min.css"/>--%>

    <link rel="stylesheet" href="../vendor/waves/waves.min.css"/>
    <link rel="stylesheet" href="../css/nativedroid2.css"/>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

</head>
<body>

<div data-role="page">

    <nd2-include data-src="left-panel.jsp"></nd2-include>


    <div data-role="header" data-position="fixed">
        <a href="#leftpanel2" class="ui-btn ui-btn-left"><i class="zmdi zmdi-menu"></i></a>
        <h1>Let's Go!</h1>
    </div>

    <div role="main" class="ui-content" data-inset="false" id="index2">

        <%--<a href="useless/chatTest.jsp" class="ui-btn ui-btn-b ui-corner-all" id="chat">聊天</a>--%>
        <%--<input type="button" value="获取我当前的位置" onClick="showAndroidToast()"/>--%>
        <%ActivityDAO activityDAO = new ActivityDAO();%>
        <%ArrayList<Activity> allActivities = activityDAO.getAllActivities();%>


        <!-- Simple Card with Title !-->
        <c:forEach var="activity" items="<%=allActivities%>">
            <%--<c:forEach var="activity" items="${sessionScope.allActivities}">--%>
            <div class="nd2-card">

                <div class="card-title has-avatar">
                    <img class="card-avatar" src="${activity.portraitImage}">
                    <h3 class="card-primary-title">${activity.launcher_name}</h3>
                    <h5 class="card-subtitle">发起时间: ${activity.launch_time}</h5>
                </div>

                <a href="#">
                    <div class="card-media">
                        <img src="${activity.image}">
                    </div>
                </a>


                <div class="card-supporting-text has-action">

                    <%--<p>活动id:${activity.id}</p>--%>
                    <p>活动主题:<strong>${activity.name}</strong></p>
                    <p> 介绍:${activity.info}</p>
                    <p>时间:${activity.date}  ${activity.time}</p>

                    <p>地点:${activity.location}</p>
                    <p>持续时间:${activity.during_time}</p>
                    <p>活动费:${activity.cost}￥</p>

                </div>


                <div class="card-action">
                    <div class="row between-xs">
                        <div class="col-xs-6">
                            <div class="box">
                                <a class="ui-btn ui-btn-inline ui-btn-fab" name="fav" href="#" id="${activity.id}"
                                   data-ajax="false"><i class='zmdi zmdi-favorite'></i></a>
                                    <%--<button class="ui-btn ui-btn-inline ui-btn-fab" onclick="addToMyFavorite(${activity.id})"--%>
                                    <%--><i class='zmdi zmdi-favorite'></i></button>--%>
                                    <%--a标签没有onclick时间 解决办法--%>
                                <a href="#" class="ui-btn ui-btn-inline ui-btn-fab"><i
                                        class='zmdi zmdi-mail-reply zmd-flip-horizontal'></i></a>
                            </div>
                        </div>
                        <div class="col-xs-6 align-right">
                            <div class="box">
                                <a href="order.do?activity_id=${activity.id}" class="ui-btn ui-btn-inline ui-btn-b">报名参加</a>
                            </div>
                        </div>
                    </div>
                </div>

            </div>

        </c:forEach>

    </div>

    <div data-role="footer" data-position="fixed">
        <div data-role="navbar">
            <ul>
                <li><a href="../tabs.jsp" data-icon="bars">主页</a></li>
                <li><a href="../MyOrders.jsp" data-icon="mail">订单</a></li>
                <li><a href="../myFavorite.jsp" data-icon="heart">喜欢</a></li>
                <li><a href="../launchActivity.jsp" data-icon="user">发起</a></li>

            </ul>
        </div>
    </div>

</div>


<%--<script src="js/jquery-3.2.1.js"></script>--%>
<%--<script src="js/jquery-ui.js"></script>--%>
<%--<script src="js/jquery.mobile-1.4.5.js"></script>--%>


<%--<script src="http://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>--%>
<%--<script src="http://ajax.googleapis.com/ajax/libs/jquerymobile/1.4.5/jquery.mobile.min.js"></script>--%>
<%--<script--%>
        <%--src="https://code.jquery.com/jquery-2.2.4.js"--%>
        <%--integrity="sha256-iT6Q9iMJYuQiMWNd9lDyBUStIq/8PuOW33aOqmvFpqI="--%>
        <%--crossorigin="anonymous"></script>--%>
<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
<script src="http://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
<script src="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.js"></script>

<script src="../vendor/waves/waves.min.js"></script>
<script src="../js/nativedroid2.js"></script>
<script src="nd2settings.js"></script>

<script type="text/javascript">



    function showAndroidToast() {
        // 获取UserAgent
        var u = navigator.userAgent;
        // 安卓
        var isAndroid = u.indexOf('Android') > -1 || u.indexOf('Adr') > -1;
        // IOS
        var isiOS = !!u.match(/\(i[^;]+;( U;)? CPU.+Mac OS X/);
        if(isAndroid==false){
            alert("只有通过手机才能获取位置信息哦！");
        }else{
            android.showLocation();
        }


    }
</script>

<script type="text/javascript">
    var scrollstart_top, scrollstop_top, is_swipe;
    $(document).on("scrollstart", function () {
        scrollstart_top = $(document).scrollTop();
        is_swipe = false;
    });
    $(document).on("scrollstop", function () {
        if (!is_swipe && $(document).scrollTop() == 0 && $(document).scrollTop() == scrollstart_top && scrollstop_top == $(document).scrollTop()) {
            window.location.reload();
        }
        scrollstop_top = $(document).scrollTop();
    });
    $(document).on("swipe", function () {
        is_swipe = true;
    });
</script>

<script type="text/javascript">

    $("a[name='fav']").click(function () {
        var activity_id = $(this).attr("id");
//        alert(activity_id);
        $.get("addToMyFavorite.do?activity_id=" + activity_id, {}, function (data) {
            var rec = data.toString();

            var u = navigator.userAgent;
            // 安卓
            var isAndroid = u.indexOf('Android') > -1 || u.indexOf('Adr') > -1;
            // IOS
            var isiOS = !!u.match(/\(i[^;]+;( U;)? CPU.+Mac OS X/);
            if(isAndroid==false){
                alert(rec);
            }else{
                android.showToast(rec);
            }


        });
    });

</script>

</body>
</html>
