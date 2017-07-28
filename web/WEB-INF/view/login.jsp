<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 7/9/17
  Time: 5:05 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <link href="../../css/bootstrap.css" rel="stylesheet">
    <link href="../../css/style.css" rel="stylesheet">
    <link href="../../css/pages/login.css" rel="stylesheet">
</head>
<body>
<div class="container-fluid jb_color">
    <div class="row header_login">
        <div class="container">
            <img src="../../css/index-logo.png">
        </div>
    </div>
    <p class="title_login">EPA认证数据上报系统</p>
    <div class="row box_login">
        <form class="login_content" action="login" method="post">
            <div class="tab">登录</div>

            <c:if test="${not empty errString}">
                <!-- 错误提示 -->
                <p class="bg-danger">${errString}</p>
            </c:if>

            <div class="first_row clearfix">
                <input class="input_name"
                       type="text"
                       placeholder="用户名"
                       value="${user.userName}"
                       name="username">
            </div>
            <div class="pwd clearfix">
                <input class="input_pwd" type="password" placeholder="密码" name="password">
            </div>
            <div class="clearfix">
                <img src="../../images/vcode.png" class="vcode" width="90" alt>
                <input id="input_vcode" class="vcode login_vcode" type="text" placeholder="验证码">
            </div>
            <div class="clearfix">
                <a href="#">看不清，换一张</a>
            </div>
            <div class="clearfix">
                <button class="btn btn-blue" type="submit">登录</button>
            </div>
        </form>
    </div>
    <div class="row footer">
        <div class="container">
            <div class="col-sm-6 col-md-7 col-lg-8">
                <div class="link">
                    <a href="#">网站导航</a>&nbsp;|&nbsp;
                    <a href="#">联系方式</a>&nbsp;|&nbsp;
                    <a href="#">招贤纳士</a>&nbsp;|&nbsp;
                    <a href="#">法律声明</a>
                </div>
                <p>中国质量认证中心 CHINA QUALITY CERTIFICATION CENTRE. Copyright © 2000-2016 CQC.COM.CN</p>
            </div>
            <div class="col-sm-6 col-md-5 col-lg-4">
                <p class="p1"><span>京ICP备12022416号-1 </span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="s1">京公网安备11010602060034号</span></p>
                <p class="p2">网站访问量:111111
                    <span></span>
                </p>
            </div>
        </div>
    </div>
</div>
</body>
</html>
