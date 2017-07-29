<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="row header">
    <img src="../../images/index-logo.png">
    <div class="header-right">
        <p>${currentUser.role.name}</p>
        <p>${currentUser.name}</p>
        <a href="${pageContext.request.contextPath}/user/logout">退出</a>
    </div>
</div>