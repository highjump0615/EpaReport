<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<header class="navbar-wrapper">
    <div class="navbar navbar-fixed-top">
        <div class="container-fluid cl">

            <a class="navbar-logo f-l mr-10 hidden-xs" href="/">
                <img src="../../images/index-logo.png">
            </a>

            <nav id="Hui-userbar" class="nav navbar-nav navbar-userbar hidden-xs">
                <ul class="cl">
                    <%-- 角色 --%>
                    <li>${currentUser.role.name}</li>

                    <%-- 用户名 --%>
                    <li class="dropDown dropDown_hover">
                        <a href="#" class="dropDown_A">
                            ${currentUser.userName}
                            <i class="Hui-iconfont">&#xe6d5;</i>
                        </a>
                        <ul class="dropDown-menu menu radius box-shadow">
                            <li><a href="${pageContext.request.contextPath}/user/logout">退出</a></li>
                        </ul>
                    </li>
                </ul>
            </nav>
        </div>
    </div>
</header>
