<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <jsp:include page="../style.jsp" />
</head>
<body>

<article class="cl pd-20">

    <div id="tab-system" class="HuiTab">

        <div class="tabBar cl">
            <a href="${pageContext.request.contextPath}/category/add?level=1"><span>添加大类</span></a>
            <span class="current">添加子类</span>
            <a href="${pageContext.request.contextPath}/category/add?level=3&parent=1"><span>添加细类</span></a>
        </div>

        <!-- 添加子类 -->
        <div class="tabCon" style="display: block">
            <form action="${pageContext.request.contextPath}/user/save" method="post" class="form form-horizontal" id="form-category-add">
                <%-- 大类 --%>
                <div class="row cl">
                    <label class="form-label col-xs-4 col-sm-3">产品大类：</label>
                    <div class="formControls col-xs-8 col-sm-9"> <span class="select-box">
                        <select class="select" name="parent" size="1">
                            <c:forEach items="${categories}" var="category">
                            <option value="${category.id}">
                                ${category.name}
                            </option>
                            </c:forEach>
                        </select>
                        </span>
                    </div>
                </div>

                <%-- 子类名称 --%>
                <div class="row cl">
                    <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>子类名称：</label>
                    <div class="formControls col-xs-8 col-sm-9">
                        <input type="text"
                               class="input-text"
                               name="name">
                    </div>
                </div>

                <div class="row cl">
                    <div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3">
                        <input class="btn btn-primary radius disabled" type="submit" value="&nbsp;&nbsp;提交&nbsp;&nbsp;" disabled>
                    </div>
                </div>
            </form>
        </div>
    </div>

</article>

<!-- script -->
<jsp:include page="../script.jsp" />

<script type="text/javascript">

    $(document).ready(function() {
    });

</script>

</body>
</html>


