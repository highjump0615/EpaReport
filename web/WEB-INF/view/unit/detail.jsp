<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <jsp:include page="../style.jsp" />
</head>
<body>

<article class="cl pd-20">
    <form class="form form-horizontal" id="form-dept-add">
        <c:if test="${not empty id}">
            <input type="hidden" value="${id}" name="id">
        </c:if>
        <%-- 单位名称 --%>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>单位名称：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text"
                       class="input-text"
                       name="name"
                       value="${unit.name}">
            </div>
        </div>
        <%-- EPA组织编码 --%>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3">EPA组织编码：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text"
                       class="input-text"
                       name="number"
                       value="${unit.number}">
            </div>
        </div>
        <%-- 责任人 --%>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3">责任人：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text"
                       class="input-text"
                       name="contact"
                       value="${unit.contact}">
            </div>
        </div>

    </form>

    <!-- 提交 -->
    <div class="row cl mt-20">
        <div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3">
            <button class="btn btn-primary radius disabled" disabled id="but_submit">
                &nbsp;&nbsp;提交&nbsp;&nbsp;
            </button>
        </div>
    </div>

</article>

<!-- script -->
<jsp:include page="../script.jsp" />

<script type="text/javascript" src="../../../lib/jquery.validation/1.14.0/jquery.validate.js"></script>
<script type="text/javascript" src="../../../lib/jquery.validation/1.14.0/validate-methods.js"></script>
<script type="text/javascript" src="../../../lib/jquery.validation/1.14.0/messages_zh.js"></script>
<script type="text/javascript" src="../../../js/common.js"></script>

<script type="text/javascript">

    $(document).ready(function() {

        enableSubmit(true);

        /**
         * 检查输入
         */
        var objForm = $("#form-dept-add");

        $('#but_submit').click(function() {
            objForm.submit();
        });

        objForm.validate({
            rules: {
                name: {
                    required: true
                }
            },
            onkeyup: false,
            focusCleanup: true,
            success: "valid"
        });

        objForm.submit(function (e) {
            e.preventDefault();

            // 提交
            $.ajax({
                type: 'POST',
                url: '${pageContext.request.contextPath}/unit/save',
                data: $(this).serializeArray(),
                success: function (data) {
                    parent.location.reload();
                },
                error: function (data) {
                    enableSubmit(true);
                    console.log(data);
                }
            });

            enableSubmit(false);

            return false;
        });

    });

</script>

</body>
</html>


