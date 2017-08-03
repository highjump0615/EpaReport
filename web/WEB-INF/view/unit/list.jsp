<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

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
        <span class="c-gray en">&gt;</span> 单位部门
        <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新">
            <i class="Hui-iconfont">&#xe68f;</i>
        </a>
    </nav>

    <!-- 页面内容 -->
    <div class="Hui-article">

        <article class="cl pd-20">
            <div class="cl pd-5 bg-1 bk-gray">
				<span class="l">
					<a href="javascript:;" onclick="open_edit('添加单位', '${pageContext.request.contextPath}/unit/add','800','400')" class="btn btn-primary radius">
                        <i class="Hui-iconfont">&#xe600;</i> 添加单位
                    </a>
				</span>
                <span class="r">共有数据：<strong>${fn:length(units)}</strong> 条</span>
            </div>

            <div class="mt-10">
                <table class="table table-border table-bordered table-bg">
                    <thead>
                    <tr class="text-c">
                        <th width="40">序号</th>
                        <th>单位名称</th>
                        <th>EPA组织编码</th>
                        <th>责任人</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${units}" var="unit">
                        <tr class="text-c">
                            <td></td>
                            <td>${unit.name}</td>
                            <td>${unit.number}</td>
                            <td>${unit.name}</td>
                            <!-- 操作 -->
                            <td>
                                <a style="text-decoration:none" class="ml-5" onclick="open_edit('编辑', '${pageContext.request.contextPath}/unit/detail?id=' + ${unit.id},'800','400')" title="编辑">
                                    <i class="Hui-iconfont">&#xe6df;</i>
                                </a>
                                <a style="text-decoration:none" class="ml-5" onClick="deleteUnit(this, ${unit.id})" href="javascript:;" title="删除">
                                    <i class="Hui-iconfont">&#xe6e2;</i>
                                </a>
                            </td>
                        </tr>
                    </c:forEach>
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

    var gTable;

    $(document).ready(function() {
        gTable = initTable('table');
    });

    /**
     * 删除
     * @param obj
     * @param id
     */
    function deleteUnit(obj,id){
        layer.confirm('确认要删除吗？',function(index){
            $.ajax({
                type: 'DELETE',
                url: '${pageContext.request.contextPath}/unit/' + id,
                data: {},
                success: function (data) {
                    // 删除行
                    gTable.row($(obj).parents('tr')).remove().draw();

                    // 提示
                    layer.msg('已删除!',{icon:1,time:1000});
                },
                error: function (data) {
                    console.log(data);
                }
            });
        });
    }

</script>

</body>
</html>
