<%@ page import="com.highjump.epareport.beans.Category" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    ArrayList<Category> listCategory = (ArrayList<Category>) request.getAttribute("categories");
    int parentId = Integer.parseInt(request.getParameter("parent"));
%>

<html>
<head>
    <jsp:include page="../style.jsp" />
</head>
<body>

<article class="cl pd-20">

    <div id="tab-system" class="HuiTab">

        <div class="tabBar cl">
            <a href="${pageContext.request.contextPath}/category/add?level=1"><span>添加大类</span></a>
            <a href="${pageContext.request.contextPath}/category/add?level=2"><span>添加子类</span></a>
            <span class="current">添加细类</span>
        </div>

        <!-- 添加细类 -->
        <div class="tabCon" style="display: block">
            <form action="${pageContext.request.contextPath}/user/save" method="post" class="form form-horizontal" id="form-category-add">
                <%-- 大类 --%>
                <div class="row cl">
                    <label class="form-label col-xs-4 col-sm-3">产品大类：</label>
                    <div class="formControls col-xs-8 col-sm-9"> <span class="select-box">
                        <select class="select" name="category" size="1">
                            <%
                                for (Category category : listCategory) {
                                    if (category.getLevel() == Category.LEVEL_CATEGORY) {
                            %>
                            <option value="<%= category.getId()%>"
                                    <% if (category.getId() == parentId) { %> selected <% } %>>
                                <%= category.getName()%>
                            </option>
                            <%
                                    }
                                }
                            %>
                        </select>
                        </span>
                    </div>
                </div>

                <%-- 子类 --%>
                <div class="row cl">
                    <label class="form-label col-xs-4 col-sm-3">产品子类：</label>
                    <div class="formControls col-xs-8 col-sm-9"> <span class="select-box">
                    <select class="select" name="subcategory" size="1">
                        <%
                            for (Category category : listCategory) {
                                if (category.getLevel() == Category.LEVEL_SUBCATEGORY) {
                        %>
                        <option value="<%= category.getId()%>">
                            <%= category.getName()%>
                        </option>
                        <%
                                }
                            }
                        %>
                    </select>
                    </span>
                    </div>
                </div>

                <%-- 子类名称 --%>
                <div class="row cl">
                    <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>细类名称：</label>
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

<script type="text/javascript" src="../../../js/urlget.js"></script>

<script type="text/javascript">

    $(document).ready(function() {
        $('select[name="category"]').change(function () {
            //获取URL的Get参数
            var paramGet = $.urlGet();

            // 组合新的链接
            paramGet['parent'] = $(this).val();

            var strGetUrl = '?';
            for (var prop in paramGet) {
                if (strGetUrl != '?') {
                    strGetUrl += '&';
                }
                strGetUrl += prop + '=' + paramGet[prop];
            }

            var aryUrl = window.location.href.split("?");
            var strUrl = aryUrl[0] + strGetUrl;

            window.location.href = strUrl;
        });
    });

</script>

</body>
</html>


