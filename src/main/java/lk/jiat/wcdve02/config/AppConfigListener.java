package lk.jiat.wcdve02.config;

import jakarta.servlet.ServletContextEvent;
import jakarta.servlet.ServletContextListener;
import jakarta.servlet.annotation.WebListener;
import lk.jiat.wcdve02.model.*;

@WebListener
public class AppConfigListener implements ServletContextListener {

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        DataStore store = new DataStore();
        
        sce.getServletContext().setAttribute("dataStore", store);
        System.out.println("SkillHub: Application Initialized. DataStore created.");
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        System.out.println("SkillHub: Application Destroyed.");
    }
}
