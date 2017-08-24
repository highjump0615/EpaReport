package com.highjump.epareport.servlet;

import com.google.gson.Gson;
import com.highjump.epareport.beans.LoginLog;
import com.highjump.epareport.beans.Role;
import com.highjump.epareport.beans.Unit;
import com.highjump.epareport.beans.User;
import com.highjump.epareport.utils.DBUtils;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.function.Function;

@WebServlet(urlPatterns = "/log/login/*")
public class LogLoginServlet extends BaseServlet {

    private int mnCountTotal;

    public LogLoginServlet() {
        super("loglogin");
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doGet(req, resp);

        String pathInfo = req.getPathInfo();

        // 获取log数据
        if (pathInfo != null && pathInfo.equals("/list")) {

            ArrayList<LoginLog> aryData = new ArrayList<>();

            try {
                // 先获取全部数量
                String strSql = "select count(*) as count from loginlog";

                DBUtils.getInstance().executeSql(strSql, new Function<ResultSet, Boolean>() {
                    @Override
                    public Boolean apply(ResultSet resultSet) {
                        try {
                            while (resultSet.next()) {
                                mnCountTotal = resultSet.getInt("count");
                            }
                        } catch (SQLException e) {
                            e.printStackTrace();
                        }

                        return true;
                    }
                });

                // 获取一页的信息
                String strLength = req.getParameter("length");
                String strStart = req.getParameter("start");

                int nEnd = Integer.parseInt(strLength) + Integer.parseInt(strStart);

                strSql = "select * from " +
                        "(select a.*, rownum rnum from " +
                        "(select l.*, u.username " +
                        "from loginlog l " +
                        "join users u on l.userno = u.userno " +
                        "order by logintime desc) a " +
                        "where rownum <= " + nEnd + ") b " +
                        "where b.rnum > " + strStart;

                DBUtils.getInstance().executeSql(strSql, new Function<ResultSet, Boolean>() {
                    @Override
                    public Boolean apply(ResultSet resultSet) {
                        try {
                            while (resultSet.next()) {
                                LoginLog log = new LoginLog();

                                log.setId(resultSet.getInt("logno"));
                                log.setTime(resultSet.getTimestamp("logintime"));
                                log.setIp(resultSet.getString("loginip"));

                                User user = new User();
                                user.setId(resultSet.getInt("userno"));
                                user.setUserName(resultSet.getString("username"));
                                log.setUser(user);

                                aryData.add(log);
                            }
                        } catch (SQLException e) {
                            e.printStackTrace();
                        }

                        return true;
                    }
                });

            } catch (SQLException e) {
                e.printStackTrace();
            }

            //
            // 返回json数据
            //
            HashMap<String, Object> result = new HashMap<>();

            result.put("draw", req.getParameter("draw"));
            result.put("recordsTotal", mnCountTotal);
            result.put("recordsFiltered", mnCountTotal);

            ArrayList<String[]> aryResData = new ArrayList<>();
            for (LoginLog log: aryData) {
                String[] rowDatas = new String[4];
                rowDatas[0] = "";
                rowDatas[1] = log.getUser().getUserName();
                rowDatas[2] = log.getTimeFormatted();
                rowDatas[3] = log.getIp();

                aryResData.add(rowDatas);
            }
            result.put("data", aryResData);

            resp.setContentType("application/json");
            resp.getWriter().println(new Gson().toJson(result));

            return;
        }

        RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/WEB-INF/view/loglogin.jsp");
        dispatcher.forward(req, resp);
    }
}
