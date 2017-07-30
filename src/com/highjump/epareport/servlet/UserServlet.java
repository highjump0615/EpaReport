package com.highjump.epareport.servlet;

import com.sun.deploy.util.StringUtils;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

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

        RequestDispatcher dispatcher;

        if (pathInfo != null && pathInfo.equals("/add")) {
            // 详情页面
            dispatcher = this.getServletContext().getRequestDispatcher("/WEB-INF/view/user/detail.jsp");
        }
        else {
            // 列表页面
            dispatcher = this.getServletContext().getRequestDispatcher("/WEB-INF/view/user/list.jsp");
        }

        dispatcher.forward(req, resp);
    }
}
