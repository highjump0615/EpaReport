package com.highjump.epareport.servlet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(urlPatterns = "/form/*")
public class FormServlet extends BaseServlet {

    public FormServlet() {
        super("form");
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doGet(req, resp);

        RequestDispatcher dispatcher;

        String pathInfo = req.getPathInfo();
        if (pathInfo != null && pathInfo.equals("/add")) {
            // 详情页面
            dispatcher = this.getServletContext().getRequestDispatcher("/WEB-INF/view/form/category.jsp");
        }
        else {
            // 详情页面
            dispatcher = this.getServletContext().getRequestDispatcher("/WEB-INF/view/form/category.jsp");
        }
        dispatcher.forward(req, resp);
    }
}
