<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- 菜单 -->
<aside class="Hui-aside">
    <div class="menu_dropdown bk_2">
        <c:if test="${currentUser.role.name eq '系统管理员'}">
        <dl>
            <a href="/">
            <dt>
                <i class="Hui-iconfont">&#xe620;</i> 产品分类
            </dt>
            </a>
        </dl>
        <dl>
            <a href="${pageContext.request.contextPath}/unit">
            <dt <c:if test="${menu eq 'unit'}">class="current"</c:if>>
                <i class="Hui-iconfont">&#xe643;</i> 单位部门
            </dt>
            </a>
        </dl>
        <dl>
            <a href="${pageContext.request.contextPath}/user">
                <dt <c:if test="${menu eq 'user'}">class="current"</c:if>>
                <i class="Hui-iconfont">&#xe62d;</i> 用户管理
            </dt>
            </a>
        </dl>
        <dl>
            <a href="/">
            <dt>
                <i class="Hui-iconfont">&#xe687;</i> 登录日志
            </dt>
            </a>
        </dl>
        <dl>
            <a href="/">
            <dt>
                <i class="Hui-iconfont">&#xe61a;</i> 操作日志
            </dt>
            </a>
        </dl>
        </c:if>
    </div>
</aside>
<div class="dislpayArrow hidden-xs"><a class="pngfix" href="javascript:void(0);" onClick="displaynavbar(this)"></a></div>
