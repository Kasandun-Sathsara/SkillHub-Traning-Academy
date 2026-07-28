package lk.jiat.wcdve02.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lk.jiat.wcdve02.model.Course;
import lk.jiat.wcdve02.model.DataStore;
import lk.jiat.wcdve02.model.Trainer;

import java.io.IOException;
import java.util.Optional;

public class CourseServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        DataStore ds = (DataStore) getServletContext().getAttribute("dataStore");
        String action = req.getParameter("action");
        
        if ("delete".equals(action)) {
            int id = Integer.parseInt(req.getParameter("id"));
            ds.getCourses().removeIf(c -> c.getId() == id);
            
            
            ds.getEnrollments().removeIf(e -> e.getCourse().getId() == id);
            ds.getAttendances().removeIf(a -> a.getCourse().getId() == id);
            
            resp.sendRedirect(req.getContextPath() + "/courses");
            return;
        }
        
        req.setAttribute("courses", ds.getCourses());
        req.setAttribute("trainers", ds.getTrainers());
        req.getRequestDispatcher("/courses.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        DataStore ds = (DataStore) getServletContext().getAttribute("dataStore");
        String action = req.getParameter("action");
        
        if ("add".equals(action)) {
            String name = req.getParameter("name");
            String desc = req.getParameter("description");
            int dur = 0;
            try { dur = Integer.parseInt(req.getParameter("durationMonths")); } catch(Exception e) {}
            
            Course c = new Course(ds.generateCourseId(), name, desc, dur);
            
            try {
                int trainerId = Integer.parseInt(req.getParameter("trainerId"));
                Optional<Trainer> tOpt = ds.getTrainers().stream().filter(t -> t.getId() == trainerId).findFirst();
                tOpt.ifPresent(c::setTrainer);
            } catch(Exception e) {}
            
            ds.getCourses().add(c);
        } else if ("edit".equals(action)) {
            int id = Integer.parseInt(req.getParameter("id"));
            String name = req.getParameter("name");
            String desc = req.getParameter("description");
            int dur = 0;
            try { dur = Integer.parseInt(req.getParameter("durationMonths")); } catch(Exception e) {}
            
            int finalDur = dur;
            ds.getCourses().stream().filter(c -> c.getId() == id).findFirst().ifPresent(c -> {
                c.setName(name);
                c.setDescription(desc);
                c.setDurationMonths(finalDur);
                
                try {
                    int trainerId = Integer.parseInt(req.getParameter("trainerId"));
                    Optional<Trainer> tOpt = ds.getTrainers().stream().filter(t -> t.getId() == trainerId).findFirst();
                    tOpt.ifPresent(c::setTrainer);
                } catch(Exception e) {}
            });
        }
        
        resp.sendRedirect(req.getContextPath() + "/courses");
    }
}
