package com.highjump.epareport.servlet;

import MD5.MD5;
import com.google.gson.Gson;
import com.highjump.epareport.beans.Role;
import com.highjump.epareport.beans.Unit;
import com.highjump.epareport.beans.User;
import com.highjump.epareport.utils.DBUtils;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.function.Function;

@WebServlet(urlPatterns = "/user/*")
public class UserServlet extends BaseServlet {

    public UserServlet() {
        super("user");
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doGet(req, resp);

        String pathInfo = req.getPathInfo();

        // 退出
        if (pathInfo != null && pathInfo.equals("/logout")) {
            HttpSession session = req.getSession();
            session.invalidate();

            // 跳转到主页面
            resp.sendRedirect(req.getContextPath() + "/");
            return;
        }

        RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/WEB-INF/view/user/list.jsp");;

        // 获取用户
        ArrayList<User> aryUser = new ArrayList<User>();

        String strSql = "select u.*, r.name as rname, d.name as dname from users u ";
        strSql += "left join roles r on u.roleno = r.roleno ";
        strSql += "left join dept d on u.deptno = d.deptno ";

        if (req.getParameterMap().containsKey("id")) {
            strSql += "where u.userno = " + req.getParameter("id");
        }

        try {
            DBUtils.getInstance().executeSql(strSql, new Function<ResultSet, Boolean>() {
                @Override
                public Boolean apply(ResultSet resultSet) {

                    try {
                        while (resultSet.next()) {
                            User user = new User();
                            user.setId(resultSet.getInt("userno"));
                            user.setUserName(resultSet.getString("username"));
                            user.setName(resultSet.getString("name"));

                            // 角色
                            Role role = new Role();
                            role.setId(resultSet.getInt("roleno"));
                            role.setName(resultSet.getString("rname"));
                            user.setRole(role);

                            // 单位
                            Unit unit = new Unit();
                            unit.setId(resultSet.getInt("deptno"));
                            unit.setName(resultSet.getString("dname"));
                            user.setUnit(unit);

                            aryUser.add(user);
                        }
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }

                    return true;
                }
            });
        } catch (SQLException e) {
            e.printStackTrace();
        }

        if (pathInfo != null) {
            if (pathInfo.equals("/add") || pathInfo.equals("/detail")) {
                // 更新，获取当前用户信息
                req.setAttribute("id", req.getParameter("id"));
                if (aryUser.size() > 0 && req.getParameterMap().containsKey("id")) {
                    req.setAttribute("user", aryUser.get(0));
                }

                // 获取角色
                ArrayList<Role> aryRole = new ArrayList<Role>();
                strSql = "select * from roles ";

                try {
                    DBUtils.getInstance().executeSql(strSql, new Function<ResultSet, Boolean>() {
                        @Override
                        public Boolean apply(ResultSet resultSet) {

                            try {
                                while (resultSet.next()) {
                                    Role role = new Role();
                                    role.setId(resultSet.getInt("roleno"));
                                    role.setName(resultSet.getString("name"));

                                    // 系统管理员除外
                                    if (role.getName().equals("系统管理员")) {
                                        continue;
                                    }

                                    aryRole.add(role);
                                }
                            } catch (SQLException e) {
                                e.printStackTrace();
                            }

                            return true;
                        }
                    });
                } catch (SQLException e) {
                    e.printStackTrace();
                }

                // 获取单位
                ArrayList<Unit> aryUnit = new ArrayList<Unit>();
                strSql = "select * from dept ";

                try {
                    DBUtils.getInstance().executeSql(strSql, new Function<ResultSet, Boolean>() {
                        @Override
                        public Boolean apply(ResultSet resultSet) {

                            try {
                                while (resultSet.next()) {
                                    Unit unit = new Unit();
                                    unit.setId(resultSet.getInt("deptno"));
                                    unit.setName(resultSet.getString(
                                            "name"));

                                    aryUnit.add(unit);
                                }
                            } catch (SQLException e) {
                                e.printStackTrace();
                            }

                            return true;
                        }
                    });
                } catch (SQLException e) {
                    e.printStackTrace();
                }

                req.setAttribute("roles", aryRole);
                req.setAttribute("units", aryUnit);

                // 详情页面
                dispatcher = this.getServletContext().getRequestDispatcher("/WEB-INF/view/user/detail.jsp");
            }
        }
        else {
            req.setAttribute("users", aryUser);
        }

        dispatcher.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String pathInfo = req.getPathInfo();

        if (pathInfo == null) {
            return;
        }

        if (pathInfo.equals("/save")) {
            // 添加或更新

            String strRole = req.getParameter("role");
            String strUsername = req.getParameter("username");
            String strName = req.getParameter("name");
            String strUnit = req.getParameter("unit");
            String strPassword = req.getParameter("password");
            if (strPassword != null) {
                strPassword = MD5.MD5Encode(strPassword);
            }

            String strSql = "insert into users(username, password, name, roleno, deptno) values (";
            strSql += String.format("'%s', ", strUsername);
            strSql += String.format("'%s', ", strPassword);
            strSql += String.format("'%s', ", strName);
            strSql += String.format("%s, ", strRole);
            strSql += String.format("%s) ", strUnit);

            // 更新
            if (req.getParameterMap().containsKey("id")) {
                strSql = "update users set username=";
                strSql += String.format("'%s', ", strUsername);
                strSql += "name=";
                strSql += String.format("'%s', ", strName);
                strSql += "roleno=";
                strSql += String.format("%s, ", strRole);
                strSql += "deptno=";
                strSql += String.format("%s, ", strUnit);

                if (strPassword != null) {
                    strSql += "password=";
                    strSql += String.format("'%s' ", strPassword);
                }

                strSql += "where userno=" + req.getParameter("id");
            }

            //
            // 返回json数据
            //
            HashMap<String, Boolean> result = doSqlUpdate(strSql);

            resp.setContentType("application/json");
            resp.getWriter().println(new Gson().toJson(result));
        }
    }

    @Override
    protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 单位id
        String pathInfo = req.getPathInfo();

        String strSql = "delete users where userno=" + pathInfo.substring(1);

        //
        // 返回json数据
        //
        HashMap<String, Boolean> result = doSqlUpdate(strSql);

        resp.setContentType("application/json");
        resp.getWriter().println(new Gson().toJson(result));
    }
}
