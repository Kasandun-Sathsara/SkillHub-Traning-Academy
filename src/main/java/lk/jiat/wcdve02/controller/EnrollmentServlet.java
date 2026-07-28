package lk.jiat.wcdve02.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lk.jiat.wcdve02.model.Course;
import lk.jiat.wcdve02.model.DataStore;
import lk.jiat.wcdve02.model.Enrollment;
import lk.jiat.wcdve02.model.Student;

import java.io.IOException;
import java.time.LocalDate;
import java.util.Optional;

public class EnrollmentServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        DataStore ds = (DataStore) getServletContext().getAttribute("dataStore");
        String action = req.getParameter("action");
        
        if ("delete".equals(action)) {
            int id = Integer.parseInt(req.getParameter("id"));
            ds.getEnrollments().removeIf(e -> e.getId() == id);
            resp.sendRedirect(req.getContextPath() + "/enrollments");
            return;
        }
        
        req.setAttribute("enrollments", ds.getEnrollments());
        req.setAttribute("students", ds.getStudents());
        req.setAttribute("courses", ds.getCourses());
        req.getRequestDispatcher("/enrollments.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        DataStore ds = (DataStore) getServletContext().getAttribute("dataStore");
        String action = req.getParameter("action");
        
        if ("add".equals(action)) {
            try {
                int studentId = Integer.parseInt(req.getParameter("studentId"));
                int courseId = Integer.parseInt(req.getParameter("courseId"));
                
                Optional<Student> sOpt = ds.getStudents().stream().filter(s -> s.getId() == studentId).findFirst();
                Optional<Course> cOpt = ds.getCourses().stream().filter(c -> c.getId() == courseId).findFirst();
                
                if (sOpt.isPresent() && cOpt.isPresent()) {
                    Enrollment e = new Enrollment(ds.generateEnrollmentId(), sOpt.get(), cOpt.get(), LocalDate.now());
                    ds.getEnrollments().add(e);
                }
            } catch (Exception e) {
                
            }
        }
        
        resp.sendRedirect(req.getContextPath() + "/enrollments");
    }
}
