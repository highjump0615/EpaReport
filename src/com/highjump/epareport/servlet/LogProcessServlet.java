package com.highjump.epareport.servlet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(urlPatterns = "/log/process")
public class LogProcessServlet extends BaseServlet {

    public LogProcessServlet() {
        super("logprocess");
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doGet(req, resp);

        RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/WEB-INF/view/logprocess.jsp");
        dispatcher.forward(req, resp);
    }
}
