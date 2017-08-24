<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- 菜单 -->
<aside class="Hui-aside">
    <div class="menu_dropdown bk_2">

        <c:if test="${currentUser.role.name eq '系统管理员'}">
            <dl>
                <a href="${pageContext.request.contextPath}/category">
                <dt <c:if test="${menu eq 'category'}">class="current"</c:if>>
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
                <a href="${pageContext.request.contextPath}/log/login">
                <dt <c:if test="${menu eq 'loglogin'}">class="current"</c:if>>
                    <i class="Hui-iconfont">&#xe623;</i> 登录日志
                </dt>
                </a>
            </dl>
            <dl>
                <a href="${pageContext.request.contextPath}/log/process">
                <dt <c:if test="${menu eq 'logprocess'}">class="current"</c:if>>
                    <i class="Hui-iconfont">&#xe61a;</i> 操作日志
                </dt>
                </a>
            </dl>
        </c:if>

        <c:if test="${currentUser.role.name eq '国际部用户'}">
            <dl>
                <a href="${pageContext.request.contextPath}/pending">
                    <dt <c:if test="${menu eq 'pending'}">class="current"</c:if>>
                        <i class="Hui-iconfont">&#xe606;</i> 等待审核
                    </dt>
                </a>
            </dl>
            <dl>
                <a href="${pageContext.request.contextPath}/notpassed">
                    <dt <c:if test="${menu eq 'notpassed'}">class="current"</c:if>>
                        <i class="Hui-iconfont">&#xe6dd;</i> 审核未过
                    </dt>
                </a>
            </dl>
            <dl>
                <a href="${pageContext.request.contextPath}/waiting">
                    <dt <c:if test="${menu eq 'waiting'}">class="current"</c:if>>
                        <i class="Hui-iconfont">&#xe687;</i> 等待上报
                    </dt>
                </a>
            </dl>
            <dl>
                <a href="${pageContext.request.contextPath}/finished">
                    <dt <c:if test="${menu eq 'finished'}">class="current"</c:if>>
                        <i class="Hui-iconfont">&#xe637;</i> 完成上报
                    </dt>
                </a>
            </dl>
            <dl>
                <a href="${pageContext.request.contextPath}/category">
                    <dt <c:if test="${menu eq 'category'}">class="current"</c:if>>
                        <i class="Hui-iconfont">&#xe620;</i> 产品分类
                    </dt>
                </a>
            </dl>
        </c:if>

        <c:if test="${currentUser.role.name eq '认证实验室用户'}">
            <dl>
                <a href="${pageContext.request.contextPath}/form">
                    <dt <c:if test="${menu eq 'form'}">class="current"</c:if>>
                        <i class="Hui-iconfont">&#xe692;</i> 填报数据
                    </dt>
                </a>
            </dl>
            <dl>
                <a href="${pageContext.request.contextPath}/pending">
                    <dt <c:if test="${menu eq 'pending'}">class="current"</c:if>>
                        <i class="Hui-iconfont">&#xe606;</i> 等待审核
                    </dt>
                </a>
            </dl>
            <dl>
                <a href="${pageContext.request.contextPath}/notpassed">
                    <dt <c:if test="${menu eq 'notpassed'}">class="current"</c:if>>
                        <i class="Hui-iconfont">&#xe6dd;</i> 审核未过
                    </dt>
                </a>
            </dl>
            <dl>
                <a href="${pageContext.request.contextPath}/waiting">
                    <dt <c:if test="${menu eq 'waiting'}">class="current"</c:if>>
                        <i class="Hui-iconfont">&#xe687;</i> 等待上报
                    </dt>
                </a>
            </dl>
            <dl>
                <a href="${pageContext.request.contextPath}/finished">
                    <dt <c:if test="${menu eq 'finished'}">class="current"</c:if>>
                        <i class="Hui-iconfont">&#xe637;</i> 完成上报
                    </dt>
                </a>
            </dl>
        </c:if>
    </div>
</aside>
<div class="dislpayArrow hidden-xs"><a class="pngfix" href="javascript:void(0);" onClick="displaynavbar(this)"></a></div>
