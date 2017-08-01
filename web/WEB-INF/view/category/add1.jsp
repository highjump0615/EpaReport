<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <jsp:include page="../style.jsp" />
</head>
<body>

<article class="cl pd-20">

    <div id="tab-system" class="HuiTab">

        <div class="tabBar cl">
            <span class="current">添加大类</span>
            <a href="${pageContext.request.contextPath}/category/add?level=2"><span>添加子类</span></a>
            <a href="${pageContext.request.contextPath}/category/add?level=3"><span>添加细类</span></a>
        </div>

        <!-- 添加大类 -->
        <div class="tabCon" style="display: block">

            <form action="${pageContext.request.contextPath}/user/save" method="post" class="form form-horizontal" id="form-parent-add">
                <%-- 分类名称 --%>
                <div class="row cl">
                    <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>大类名称：</label>
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


