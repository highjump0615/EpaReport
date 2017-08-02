package com.highjump.epareport.servlet;

import com.highjump.epareport.utils.DBUtils;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.HashMap;

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

    /**
     * 运行sql而其结果返回成map
     * @param sql
     * @return
     */
    protected HashMap<String, Boolean> doSqlUpdate(String sql) {
        boolean bRes = false;

        try {
            bRes = DBUtils.getInstance().executeUpdateSql(sql);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        HashMap<String, Boolean> result = new HashMap<>();
        result.put("success", bRes);

        return result;
    }
}
