<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <jsp:include page="../style.jsp" />
</head>
<body>

<article class="cl pd-20">
    <form class="form form-horizontal" id="form-user-add">
        <c:if test="${not empty id}">
            <input type="hidden" value="${id}" name="id">
        </c:if>

        <%-- 角色 --%>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3">角色：</label>
            <div class="formControls col-xs-8 col-sm-9"> <span class="select-box" style="width:150px;">
				<select class="select" name="role" size="1">

                    <c:forEach items="${roles}" var="role">
                    <option value="${role.id}"
                            <c:if test="${user.role.id eq role.id}"> selected </c:if>>
                        ${role.name}
                    </option>
                    </c:forEach>

				</select>
				</span>
            </div>
        </div>

        <%-- 用户名 --%>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>用户名：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text"
                       class="input-text"
                       name="username"
                       value="${user.userName}">
            </div>
        </div>

        <%-- 姓名 --%>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3">姓名：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text"
                       class="input-text"
                       name="name"
                       value="${user.name}">
            </div>
        </div>

        <%-- 单位部门 --%>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3">单位部门：</label>
            <div class="formControls col-xs-8 col-sm-9"> <span class="select-box" style="width:150px;">
            <select class="select" name="unit" size="1">
                <c:forEach items="${units}" var="unit">
                    <option value="${unit.id}"
                            <c:if test="${user.unit.id eq unit.id}"> selected </c:if>>
                        ${unit.name}
                    </option>
                </c:forEach>
            </select>
            </span>
            </div>
        </div>

        <%-- 登录口令 --%>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3">登录口令：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text"
                       class="input-text"
                       name="password">
            </div>
        </div>

    </form>

    <div class="row cl mt-20">
        <div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3">
            <button class="btn btn-primary radius disabled" id="but_submit" disabled>
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
        var objForm = $("#form-user-add");

        $('#but_submit').click(function() {
            objForm.submit();
        });

        objForm.validate({
            rules: {
                username: {
                    required: true
                },
                <c:if test="${empty id}">
                password: {
                    required: true
                }
                </c:if>
            },
            onkeyup: false,
            focusCleanup: true,
            success: "valid",
            submitHandler: function(form) {
                // 提交
                $.ajax({
                    type: 'POST',
                    url: '${pageContext.request.contextPath}/user/save',
                    data: $(form).serializeArray(),
                    success: function (data) {
                        parent.location.reload();
                    },
                    error: function (data) {
                        enableSubmit(true);
                        console.log(data);
                    }
                });

                enableSubmit(false);
            }
        });
    });

</script>

</body>
</html>


