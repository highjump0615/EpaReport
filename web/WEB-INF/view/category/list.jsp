<%@ page import="java.util.ArrayList" %>
<%@ page import="com.highjump.epareport.beans.Category" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    ArrayList<Category> listCategory = (ArrayList<Category>) request.getAttribute("categories");
%>

<html>
<head>
    <jsp:include page="../style.jsp" />
</head>
<body>

<jsp:include page="../header.jsp" />
<jsp:include page="../menu.jsp" />

<section class="Hui-article-box">

    <!-- 面包屑 -->
    <nav class="breadcrumb">
        <i class="Hui-iconfont">&#xe67f;</i> 首页
        <span class="c-gray en">&gt;</span> 产品分类
        <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新">
            <i class="Hui-iconfont">&#xe68f;</i>
        </a>
    </nav>

    <!-- 页面内容 -->
    <div class="Hui-article">

        <article class="cl pd-20">
            <div class="cl pd-5 bg-1 bk-gray">
				<span class="l">
					<a href="javascript:;" onclick="open_edit('添加分类', '${pageContext.request.contextPath}/category/add?level=1','800','400')" class="btn btn-primary radius">
                        <i class="Hui-iconfont">&#xe600;</i> 添加分类
                    </a>
				</span>
                <span class="r">共有数据：<strong>0</strong> 条</span>
            </div>

            <div class="mt-10">
                <table class="table table-border table-bordered table-bg">
                    <thead>
                    <tr class="text-c">
                        <th width="40">序号</th>
                        <th>产品大类</th>
                        <th>产品子类</th>
                        <th>产品细类</th>
                        <th>当前版本</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody>

                    <% for (Category category : listCategory) { %>
                    <tr class="text-c">
                        <td></td>
                        <td><%= category.getParentCategory(Category.LEVEL_CATEGORY).getName() %></td>
                        <td><%= category.getParentCategory(Category.LEVEL_SUBCATEGORY).getName() %></td>
                        <td><%= (category.getParentCategory(Category.LEVEL_PRODUCT) != null) ? category.getParentCategory(Category.LEVEL_PRODUCT).getName() : "" %></td>
                        <td><%= category.getVersion() %></td>
                        <td>
                            <a style="text-decoration:none" class="ml-5" onClick="deleteCategory(this,'{{$p->id}}')" href="javascript:;" title="删除">
                                <i class="Hui-iconfont">&#xe6e2;</i>
                            </a>
                        </td>
                    </tr>
                    <%
                    }
                    %>
                    </tbody>
                </table>
            </div>
        </article>

    </div>

</section>

<!-- script -->
<jsp:include page="../script.jsp" />

<script type="text/javascript" src="../../../lib/datatables/1.10.0/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="../../../js/common.js"></script>
<script type="text/javascript" src="../../../js/tablecommon.js"></script>

<script type="text/javascript">

    $(document).ready(function() {
    });

    function deleteCategory(obj,id){
        layer.msg('暂时不支持删除分类', {icon:7, time:1000});
    }

</script>

</body>
</html>
