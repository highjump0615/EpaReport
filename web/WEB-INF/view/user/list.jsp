<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
        <span class="c-gray en">&gt;</span> 用户管理
        <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新">
            <i class="Hui-iconfont">&#xe68f;</i>
        </a>
    </nav>

    <!-- 页面内容 -->
    <div class="Hui-article">

        <article class="cl pd-20">
            <div class="cl pd-5 bg-1 bk-gray">
				<span class="l">
					<a href="javascript:;" onclick="open_edit('添加用户', '${pageContext.request.contextPath}/user/add','800','400')" class="btn btn-primary radius">
                        <i class="Hui-iconfont">&#xe600;</i> 添加用户
                    </a>
				</span>
                <span class="r">共有数据：<strong>0</strong> 条</span>
            </div>

            <div class="mt-10">
                <table class="table table-border table-bordered table-bg">
                    <thead>
                    <tr class="text-c">
                        <th width="40">序号</th>
                        <th>用户名</th>
                        <th>角色</th>
                        <th>姓名</th>
                        <th>单位部门</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${users}" var="user">
                        <tr class="text-c">
                            <td></td>
                            <td>${user.userName}</td>
                            <td>${user.role.name}</td>
                            <td>${user.name}</td>
                            <td>${user.unit.name}</td>
                            <td>
                                <a style="text-decoration:none" class="ml-5" onclick="open_edit('编辑', '${pageContext.request.contextPath}/user/detail?id=' + ${user.id},'800','400')" title="编辑">
                                    <i class="Hui-iconfont">&#xe6df;</i>
                                </a>
                                <c:if test="${user.role.name ne '系统管理员'}">
                                <a style="text-decoration:none" class="ml-5" onClick="deleteUser(this, ${user.id})" href="javascript:;" title="删除">
                                    <i class="Hui-iconfont">&#xe6e2;</i>
                                </a>
                                </c:if>
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
    function deleteUser(obj,id){
        layer.confirm('确认要删除吗？',function(index){
            $.ajax({
                type: 'DELETE',
                url: '${pageContext.request.contextPath}/user/' + id,
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
