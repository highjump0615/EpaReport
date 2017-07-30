package com.highjump.epareport.servlet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by high on 2017/7/31.
 */
public class BaseServlet extends HttpServlet {

    private String mstrMenu;

    public BaseServlet(String menu) {
        mstrMenu = menu;
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        // 设置当前菜单
        req.setAttribute("menu", mstrMenu);
    }
}
