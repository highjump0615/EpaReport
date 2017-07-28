package com.highjump.epareport.servlet;


import MD5.MD5;
import com.highjump.epareport.beans.User;
import com.highjump.epareport.utils.CommonUtils;
import com.highjump.epareport.utils.ConnectionUtils;
import com.highjump.epareport.utils.DBUtils;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

@WebServlet(urlPatterns = "/login")
public class LoginServlet extends HttpServlet {

    public LoginServlet() {
        super();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/WEB-INF/view/login.jsp");
        dispatcher.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 获取参数
        String strUsername = req.getParameter("username");
        String strPassword = req.getParameter("password");

        String strMd5 = MD5.MD5Encode(strPassword);
        User user = new User();
        user.setUserName(strUsername);

        // 数据库操作
        try {
            String strSql = "select * from users where username='" + strUsername + "' and password='" + strMd5 + "'";

            Vector rs = DBUtils.getInstance().executeSql(strSql);
            // 登录成功
            if (rs.size() > 0) {
                Vector vUser = (Vector) rs.get(0);
                user.setId(Integer.parseInt(vUser.get(0).toString()));

                // 保存当前用户
                HttpSession session = req.getSession();
                CommonUtils.storeCurrentUser(session, user);

                // 跳转到主页面
                resp.sendRedirect(req.getContextPath() + "/home");
            }
            // 失败
            else {
                // 设置参数
                req.setAttribute("user", user);
                req.setAttribute("errString", "用户名或密码有误");

                RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/WEB-INF/view/login.jsp");
                dispatcher.forward(req, resp);
            }
        }
        catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
