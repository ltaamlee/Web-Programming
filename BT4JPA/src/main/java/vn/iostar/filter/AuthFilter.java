package vn.iostar.filter;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import vn.iostar.entity.User;

import java.io.IOException;

@WebFilter("/*")
public class AuthFilter implements Filter {

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse resp = (HttpServletResponse) response;
        String uri = req.getRequestURI();

        HttpSession session = req.getSession(false);

        if (uri.endsWith("/login") || uri.contains("/css") || uri.contains("/js") || uri.contains("/images")) {
            chain.doFilter(request, response);
            return;
        }

        if (session == null || session.getAttribute("account") == null) {
            resp.sendRedirect(req.getContextPath() + "/login");
            return;
        }

        User user = (User) session.getAttribute("account");
        int role = user.getRoleid();

        if (uri.startsWith(req.getContextPath() + "/admin") && role != 1) {
            resp.sendRedirect(req.getContextPath() + "/accessDenied.jsp");
            return;
        }
        if (uri.startsWith(req.getContextPath() + "/manager") && role != 2 && role != 1) {
            resp.sendRedirect(req.getContextPath() + "/accessDenied.jsp");
            return;
        }
        if (uri.startsWith(req.getContextPath() + "/user") && role != 3 && role != 2 && role != 1) {
            resp.sendRedirect(req.getContextPath() + "/accessDenied.jsp");
            return;
        }

        chain.doFilter(request, response);
    }
}
