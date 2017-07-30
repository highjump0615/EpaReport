package com.highjump.epareport.servlet;

import com.sun.deploy.util.StringUtils;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(urlPatterns = "/user/*")
public class UserServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        // 退出
        String pathInfo = req.getPathInfo();
        if (pathInfo == null) {
            return;
        }

        if (pathInfo.equals("/logout")) {
            HttpSession session = req.getSession();
            session.invalidate();

            // 跳转到主页面
            resp.sendRedirect(req.getContextPath() + "/");
        }
    }
}
