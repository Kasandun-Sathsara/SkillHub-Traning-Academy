package lk.jiat.wcdve02.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lk.jiat.wcdve02.model.DataStore;
import lk.jiat.wcdve02.model.Trainer;

import java.io.IOException;

public class TrainerServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        DataStore ds = (DataStore) getServletContext().getAttribute("dataStore");
        String action = req.getParameter("action");
        
        if ("delete".equals(action)) {
            int id = Integer.parseInt(req.getParameter("id"));
            ds.getTrainers().removeIf(t -> t.getId() == id);
            
            
            ds.getCourses().forEach(c -> {
                if (c.getTrainer() != null && c.getTrainer().getId() == id) {
                    c.setTrainer(null);
                }
            });
            
            resp.sendRedirect(req.getContextPath() + "/trainers");
            return;
        }
        
        req.setAttribute("trainers", ds.getTrainers());
        req.getRequestDispatcher("/trainers.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        DataStore ds = (DataStore) getServletContext().getAttribute("dataStore");
        String action = req.getParameter("action");
        
        if ("add".equals(action)) {
            String name = req.getParameter("name");
            String spec = req.getParameter("specialty");
            
            Trainer t = new Trainer(ds.generateTrainerId(), name, spec);
            ds.getTrainers().add(t);
        } else if ("edit".equals(action)) {
            int id = Integer.parseInt(req.getParameter("id"));
            String name = req.getParameter("name");
            String spec = req.getParameter("specialty");
            
            ds.getTrainers().stream().filter(t -> t.getId() == id).findFirst().ifPresent(t -> {
                t.setName(name);
                t.setSpecialty(spec);
            });
        }
        
        resp.sendRedirect(req.getContextPath() + "/trainers");
    }
}
