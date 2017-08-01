package com.highjump.epareport.servlet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(urlPatterns = "/category/*")
public class CategoryServlet extends BaseServlet {

    public CategoryServlet() {
        super("category");
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doGet(req, resp);

        RequestDispatcher dispatcher;

        String pathInfo = req.getPathInfo();
        if (pathInfo != null && pathInfo.equals("/add")) {
            String strLevel = req.getParameter("level");

            // 详情页面
            dispatcher = this.getServletContext().getRequestDispatcher("/WEB-INF/view/category/add" + strLevel + ".jsp");
        }
        else {
            // 列表页面
            dispatcher = this.getServletContext().getRequestDispatcher("/WEB-INF/view/category/list.jsp");
        }
        dispatcher.forward(req, resp);
    }
}
