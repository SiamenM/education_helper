package com.maskalenchyk.education_helper.listener;

import com.maskalenchyk.education_helper.application.ApplicationContext;
import org.apache.log4j.Logger;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

@WebListener
public class ApplicationContextListener implements ServletContextListener {

    private static final Logger LOGGER = Logger.getLogger(ApplicationContextListener.class);

    @Override
    public void contextInitialized(ServletContextEvent servletContextEvent) {
        ApplicationContext.initialize();
        LOGGER.info("Application context was initialized");
    }

    @Override
    public void contextDestroyed(ServletContextEvent servletContextEvent) {
        ApplicationContext.getInstance().destroy();
        LOGGER.info("Application context was destroyed");
    }
}
