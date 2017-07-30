<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <jsp:include page="../style.jsp" />
</head>
<body>

<article class="cl pd-20">
    <form action="${pageContext.request.contextPath}/user/save" method="post" class="form form-horizontal" id="form-admin-add">
        <%-- 单位名称 --%>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>单位名称：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text"
                       class="input-text"
                       name="name">
            </div>
        </div>
        <%-- EPA组织编码 --%>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3">EPA组织编码：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text"
                       class="input-text"
                       name="number">
            </div>
        </div>
        <%-- 责任人 --%>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3">责任人：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text"
                       class="input-text"
                       name="head">
            </div>
        </div>

        <div class="row cl">
            <div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3">
                <input class="btn btn-primary radius disabled" type="submit" value="&nbsp;&nbsp;提交&nbsp;&nbsp;" disabled>
            </div>
        </div>
    </form>
</article>

<!-- script -->
<jsp:include page="../script.jsp" />

<script type="text/javascript">

    $(document).ready(function() {
    });

</script>

</body>
</html>


