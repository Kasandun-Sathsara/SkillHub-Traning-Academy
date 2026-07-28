package lk.jiat.wcdve02.config;

import jakarta.servlet.*;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import lk.jiat.wcdve02.model.User;
import java.io.IOException;

public class AuthFilter implements Filter {

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;
        
        HttpSession session = req.getSession(false);
        String path = req.getRequestURI();
        
        boolean isLoginReq = path.endsWith("/login") || path.endsWith("/login.jsp");
        boolean isStaticReq = path.startsWith(req.getContextPath() + "/css") ||
                              path.startsWith(req.getContextPath() + "/js") ||
                              path.startsWith(req.getContextPath() + "/images");
                              
        boolean isLoggedIn = (session != null && session.getAttribute("user") != null);

        if (isLoggedIn) {
            chain.doFilter(request, response);
        } else if (isLoginReq || isStaticReq) {
            chain.doFilter(request, response);
        } else {
            res.sendRedirect(req.getContextPath() + "/login");
        }
    }
}
