package com.maskalenchyk.education_helper.listener;

import com.maskalenchyk.education_helper.application.ApplicationContext;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

@WebListener
public class ApplicationContextListener implements ServletContextListener {

    private static final Logger LOGGER = LoggerFactory.getLogger(ApplicationContextListener.class);

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
