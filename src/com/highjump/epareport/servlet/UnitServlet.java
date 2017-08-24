package com.highjump.epareport.servlet;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.highjump.epareport.beans.Unit;
import com.highjump.epareport.controller.UnitCtrl;
import com.highjump.epareport.utils.ConnectionUtils;
import com.highjump.epareport.utils.DBUtils;
import com.sun.deploy.util.StringUtils;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;

@WebServlet(urlPatterns = "/unit/*")
public class UnitServlet extends BaseServlet {

    public UnitServlet() {
        super("unit");
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doGet(req, resp);

        // 列表页面
        RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/WEB-INF/view/unit/list.jsp");;

        int nUnitId = 0;
        if (req.getParameterMap().containsKey("id")) {
            nUnitId = Integer.parseInt(req.getParameter("id"));
        }

        // 获取单位列表
        ArrayList<Unit> aryUnit = UnitCtrl.getInstance().getUnits(nUnitId);

        String pathInfo = req.getPathInfo();
        if (pathInfo != null) {
            if (pathInfo.equals("/add") || pathInfo.equals("/detail")) {
                req.setAttribute("id", req.getParameter("id"));
                if (aryUnit.size() > 0 && nUnitId > 0) {
                    req.setAttribute("unit", aryUnit.get(0));
                }

                // 详情页面
                dispatcher = this.getServletContext().getRequestDispatcher("/WEB-INF/view/unit/detail.jsp");
            }
        }
        else {
            req.setAttribute("units", aryUnit);
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

            String strName = req.getParameter("name");
            String strNumber = req.getParameter("number");
            String strContact = req.getParameter("contact");

            String strSql = "insert into dept(name, epanumber, contact) values (";
            strSql += String.format("'%s', ", strName);
            strSql += String.format("'%s', ", strNumber);
            strSql += String.format("'%s')", strContact);

            // 更新
            if (req.getParameterMap().containsKey("id")) {
                strSql = "update dept set name=";
                strSql += String.format("'%s', ", strName);
                strSql += "epanumber=";
                strSql += String.format("'%s', ", strNumber);
                strSql += "contact=";
                strSql += String.format("'%s' ", strContact);
                strSql += "where deptno=" + req.getParameter("id");
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

        String strSql = "delete dept where deptno=" + pathInfo.substring(1);

        //
        // 返回json数据
        //
        HashMap<String, Boolean> result = doSqlUpdate(strSql);

        resp.setContentType("application/json");
        resp.getWriter().println(new Gson().toJson(result));
    }
}
