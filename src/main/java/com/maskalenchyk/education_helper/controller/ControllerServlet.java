package com.maskalenchyk.education_helper.controller;

import com.maskalenchyk.education_helper.application.ApplicationConstants;
import com.maskalenchyk.education_helper.application.ApplicationContext;
import com.maskalenchyk.education_helper.command.CommandException;
import com.maskalenchyk.education_helper.command.ServletCommand;
import com.maskalenchyk.education_helper.core.Bean;
import org.apache.log4j.Logger;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Main Controller of web app
 */
@Bean
@MultipartConfig
@WebServlet(name = "ControllerServlet", urlPatterns = {"/pages/"})
public class ControllerServlet extends HttpServlet {

    private static final Logger LOGGER = Logger.getLogger(ControllerServlet.class);

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        processRequest(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        processRequest(req, resp);
    }

    private void processRequest(HttpServletRequest req, HttpServletResponse resp) {
        ServletCommand command = defineCommand(req);
        try {
            command.execute(req, resp);
        } catch (CommandException e) {
            //write error handler
            LOGGER.error(e.getMessage(), e);
        }
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
