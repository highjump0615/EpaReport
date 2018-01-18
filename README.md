# EpaReport（基础版）
> Basic Admin panels for EPA report system made with Java Model + Servlet + JSP 

## Overview

### 1. 主要功能
- 用户与角色管理  
登录, 添加、删除、修改用户与角色  
- 单位、产品、分类管理  

### 2. 技术内容
#### 2.1 前段开发 (JSP/JSTL) 
基于[HUI Admin v3.1](http://www.h-ui.net/H-ui.admin.shtml)模板实现后台页面UI  

##### 2.1.1 代码技巧
- jQuery 获取Url的GET参数列表 ( urlget.js )  
```
var paramGet = $.urlGet();
```

##### 2.1.2 Third-Party Libraries
- [jQuery v1.9.1](https://github.com/jquery/jquery)  
- [jQuery Validation 插件 v1.14.0](https://github.com/jquery-validation/jquery-validation)
- [Web弹窗 Layer v3.0](http://layer.layui.com/)
- [jQuery DataTables 插件 v1.10.0](https://github.com/DataTables/DataTables)  

#### 2.2 后段开发 (Java Servlet) 

- 通过Servlet Filter实现用户认证和跳转
```
<filter>
	<filter-name>AuthenticationFilter</filter-name>
	<filter-class>com.highjump.epareport.filters.AuthenticationFilter</filter-class>
</filter>
<filter-mapping>
	<filter-name>AuthenticationFilter</filter-name>
	<url-pattern>/*</url-pattern>
</filter-mapping>
```  
- Oracle数据库存储数据
  
## Need to Improve  
- 待完善
