<%@ page contentType="text/html;charset=UTF-8" language="java" %>

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

<script type="text/javascript">

    $(document).ready(function() {
        $('table').dataTable({
            'ordering': false
        });
    });

</script>

</body>
</html>
