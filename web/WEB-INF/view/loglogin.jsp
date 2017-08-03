<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <jsp:include page="style.jsp" />

    <style type="text/css">
        .table td {
            text-align: center;
        }
    </style>

</head>
<body>

<jsp:include page="header.jsp" />
<jsp:include page="menu.jsp" />

<section class="Hui-article-box">

    <!-- 面包屑 -->
    <nav class="breadcrumb">
        <i class="Hui-iconfont">&#xe67f;</i> 首页
        <span class="c-gray en">&gt;</span> 登录日志
        <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新">
            <i class="Hui-iconfont">&#xe68f;</i>
        </a>
    </nav>

    <!-- 页面内容 -->
    <div class="Hui-article">

        <article class="cl pd-20">
            <div class="cl pd-5 bg-1 bk-gray">
                <span class="r">共有数据：<strong>0</strong> 条</span>
            </div>

            <div class="mt-10">
                <table class="table table-border table-bordered table-bg">
                    <thead>
                    <tr class="text-c">
                        <th width="40">序号</th>
                        <th>用户名</th>
                        <th>登陆时间</th>
                        <th>登录IP</th>
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
<jsp:include page="script.jsp" />

<script type="text/javascript" src="../../lib/datatables/1.10.0/jquery.dataTables.min.js"></script>

<script type="text/javascript">

    $(document).ready(function() {
        $('table').dataTable({
            'ordering': false,
            'searching': false,
            'processing': true,
            'serverSide': true,
            'ajax': {
                'url': '${pageContext.request.contextPath}/log/login/list',
                'dataType': 'json',
                'type': 'GET'
            },
            'fnDrawCallback': function() {
                var api = this.api();
                var startIndex = api.context[0]._iDisplayStart;
                api.column(0).nodes().each(function(cell, i) {
                    cell.innerHTML = startIndex + i + 1;
                });
            }
        });
    });

</script>

</body>
</html>
