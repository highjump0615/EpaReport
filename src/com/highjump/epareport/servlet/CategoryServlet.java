package com.highjump.epareport.servlet;

import com.highjump.epareport.beans.Role;
import com.highjump.epareport.controller.CategoryCtrl;
import com.highjump.epareport.utils.DBUtils;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.function.Function;

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

        // 添加
        if (pathInfo != null && pathInfo.equals("/add")) {
            // 级别
            String strLevel = req.getParameter("level");
            int nLevel = Integer.parseInt(strLevel);

            // 上级分类
            int nParent = 0;
            if (req.getParameterMap().containsKey("parent")) {
                nParent = Integer.parseInt(req.getParameter("parent"));
            }

            req.setAttribute("categories", CategoryCtrl.getInstance().getCategories(nLevel, nParent));

            // 详情页面
            dispatcher = this.getServletContext().getRequestDispatcher("/WEB-INF/view/category/add" + strLevel + ".jsp");
        }
        else {
            req.setAttribute("categories", CategoryCtrl.getInstance().getCategories(0, 0));

            // 列表页面
            dispatcher = this.getServletContext().getRequestDispatcher("/WEB-INF/view/category/list.jsp");
        }

        dispatcher.forward(req, resp);
    }
}
