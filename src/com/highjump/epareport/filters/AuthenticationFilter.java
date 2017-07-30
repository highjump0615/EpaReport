package com.highjump.epareport.filters;

import com.highjump.epareport.utils.CommonUtils;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * Created by Administrator on 7/9/17.
 */
@WebFilter("/AuthenticationFilter")
public class AuthenticationFilter implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest)servletRequest;
        HttpServletResponse response = (HttpServletResponse) servletResponse;

        // 登录页面除外
        String strUri = request.getRequestURI();
        if (strUri.startsWith("/login")) {
            filterChain.doFilter(request, response);
            return;
        }

        // css、js等除外
        if (strUri.startsWith("/css") || strUri.startsWith("/images") || strUri.startsWith("/js") || strUri.startsWith("/lib/")) {
            filterChain.doFilter(request, response);
            return;
        }

        HttpSession session = request.getSession(false);
        if (session == null) {
            redirectToLogin(response);
            return;
        }

        // 找不到用户名
        if (CommonUtils.getCurrentUser(session) == null) {
            redirectToLogin(response);
            return;
        }

        filterChain.doFilter(request, response);
    }

    /**
     * 跳转到登录页面
     * @param response
     * @throws IOException
     */
    private void redirectToLogin(HttpServletResponse response) throws IOException {
        response.sendRedirect("/login");
    }

    @Override
    public void destroy() {

    }
}
