package lk.jiat.wcdve02.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import lk.jiat.wcdve02.model.DataStore;
import lk.jiat.wcdve02.model.User;

import java.io.IOException;
import java.util.Optional;

public class AuthServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String path = req.getRequestURI();
        if (path.endsWith("/logout")) {
            HttpSession session = req.getSession(false);
            if (session != null) {
                session.invalidate();
            }
            resp.sendRedirect(req.getContextPath() + "/login");
        } else {
            req.getRequestDispatcher("/login.jsp").forward(req, resp);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String u = req.getParameter("username");
        String p = req.getParameter("password");

        DataStore ds = (DataStore) getServletContext().getAttribute("dataStore");
        Optional<User> userOpt = ds.getUsers().stream()
                .filter(user -> user.getUsername().equals(u) && user.getPassword().equals(p))
                .findFirst();

        if (userOpt.isPresent()) {
            HttpSession session = req.getSession(true);
            session.setAttribute("user", userOpt.get());
            resp.sendRedirect(req.getContextPath() + "/dashboard");
        } else {
            req.setAttribute("error", "Invalid username or password");
            req.getRequestDispatcher("/login.jsp").forward(req, resp);
        }
    }
}
