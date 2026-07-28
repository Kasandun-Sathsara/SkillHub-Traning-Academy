package lk.jiat.wcdve02.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lk.jiat.wcdve02.model.DataStore;

import java.io.IOException;

public class DashboardServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        DataStore ds = (DataStore) getServletContext().getAttribute("dataStore");

        int studentCount = ds.getStudents().size();
        int courseCount = ds.getCourses().size();
        int trainerCount = ds.getTrainers().size();
        int enrollmentCount = ds.getEnrollments().size();

        req.setAttribute("studentCount", studentCount);
        req.setAttribute("courseCount", courseCount);
        req.setAttribute("trainerCount", trainerCount);
        req.setAttribute("enrollmentCount", enrollmentCount);

        req.getRequestDispatcher("/dashboard.jsp").forward(req, resp);
    }
}
