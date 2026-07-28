package lk.jiat.wcdve02.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lk.jiat.wcdve02.model.DataStore;
import lk.jiat.wcdve02.model.Student;

import java.io.IOException;

public class StudentServlet extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        DataStore ds = (DataStore) getServletContext().getAttribute("dataStore");
        String action = req.getParameter("action");
        
        if ("delete".equals(action)) {
            int id = Integer.parseInt(req.getParameter("id"));
            ds.getStudents().removeIf(s -> s.getId() == id);
            
            
            ds.getEnrollments().removeIf(e -> e.getStudent().getId() == id);
            ds.getAttendances().removeIf(a -> a.getStudent().getId() == id);
            
            resp.sendRedirect(req.getContextPath() + "/students");
            return;
        }
        
        req.setAttribute("students", ds.getStudents());
        req.getRequestDispatcher("/students.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        DataStore ds = (DataStore) getServletContext().getAttribute("dataStore");
        String action = req.getParameter("action");
        
        if ("add".equals(action)) {
            String name = req.getParameter("name");
            String email = req.getParameter("email");
            String phone = req.getParameter("phone");
            
            Student s = new Student(ds.generateStudentId(), name, email, phone);
            ds.getStudents().add(s);
        } else if ("edit".equals(action)) {
            int id = Integer.parseInt(req.getParameter("id"));
            String name = req.getParameter("name");
            String email = req.getParameter("email");
            String phone = req.getParameter("phone");
            
            ds.getStudents().stream().filter(s -> s.getId() == id).findFirst().ifPresent(s -> {
                s.setName(name);
                s.setEmail(email);
                s.setPhone(phone);
            });
        }
        
        resp.sendRedirect(req.getContextPath() + "/students");
    }
}
