package com.highjump.epareport.servlet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(urlPatterns = "/unit/*")
public class UnitServlet extends BaseServlet {

    public UnitServlet() {
        super("unit");
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doGet(req, resp);

        RequestDispatcher dispatcher;

        String pathInfo = req.getPathInfo();
        if (pathInfo != null && pathInfo.equals("/add")) {
            // 详情页面
            dispatcher = this.getServletContext().getRequestDispatcher("/WEB-INF/view/unit/detail.jsp");
        }
        else {
            // 列表页面
            dispatcher = this.getServletContext().getRequestDispatcher("/WEB-INF/view/unit/list.jsp");
        }
        dispatcher.forward(req, resp);
    }
}
