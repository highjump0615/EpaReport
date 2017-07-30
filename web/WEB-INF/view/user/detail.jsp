<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <jsp:include page="../style.jsp" />
</head>
<body>

<article class="cl pd-20">
    <form action="${pageContext.request.contextPath}/user/save" method="post" class="form form-horizontal" id="form-admin-add">
        <%-- 角色 --%>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3">单位名称：</label>
            <div class="formControls col-xs-8 col-sm-9"> <span class="select-box" style="width:150px;">
				<select class="select" name="role" size="1">
					<option value="1">
                        系统管理员
                    </option>
                    <option value="2">
                        系统管理员
                    </option>
				</select>
				</span>
            </div>
        </div>
        <%-- 用户名 --%>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3">用户名：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text"
                       class="input-text"
                       name="username">
            </div>
        </div>
        <%-- 用户名 --%>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3">姓名：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text"
                       class="input-text"
                       name="name">
            </div>
        </div>
        <%-- 单位部门 --%>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3">单位名称：</label>
            <div class="formControls col-xs-8 col-sm-9"> <span class="select-box" style="width:150px;">
            <select class="select" name="role" size="1">
                <option value="1">
                    系统管理员
                </option>
                <option value="2">
                    系统管理员
                </option>
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


