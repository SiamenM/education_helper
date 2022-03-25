package com.maskalenchyk.education_helper.controller;

import com.maskalenchyk.education_helper.application.ApplicationConstants;
import com.maskalenchyk.education_helper.application.ApplicationContext;
import com.maskalenchyk.education_helper.command.ServletCommand;
import com.maskalenchyk.education_helper.core.Bean;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Main Controller of web app
 */
@Bean
@MultipartConfig
@WebServlet(name = "ControllerServlet", urlPatterns = {"/pages/"})
public class ControllerServlet extends HttpServlet {

    private static final Logger LOGGER = LoggerFactory.getLogger(ControllerServlet.class);

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) {
        processRequest(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) {
        processRequest(req, resp);
    }

    private void processRequest(HttpServletRequest req, HttpServletResponse resp) {
        ServletCommand command = defineCommand(req);
        command.execute(req, resp);
    }

    private ServletCommand defineCommand(HttpServletRequest req) {
        String commandName = req.getParameter(ApplicationConstants.COMMAND_NAME_PARAMETER);
        ServletCommand command = ApplicationContext.getInstance().getBean(commandName);
        if (command == null) {
            command = ApplicationContext.getInstance().getBean(ApplicationConstants.DEFAULT_COMMAND_NAME);
        }
        return command;
    }
}
