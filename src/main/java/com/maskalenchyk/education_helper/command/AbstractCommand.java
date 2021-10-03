package com.maskalenchyk.education_helper.command;

import com.maskalenchyk.education_helper.application.ApplicationConstants;
import org.apache.log4j.Logger;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public abstract class AbstractCommand implements ServletCommand {

    private static final Logger LOGGER = Logger.getLogger(AbstractCommand.class);

    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {
        try {
            executeWrapper(request, response);
        } catch (CommandException e) {
            LOGGER.error("Command executing failed " + this.getClass().getName(), e);
            request.setAttribute(ApplicationConstants.ERROR_MESSAGE, e.getMessage());
            if (e.getHeader() != null) {
                request.setAttribute(ApplicationConstants.ERROR_HEADER, e.getHeader());
            }
            forward(request, response, ApplicationConstants.ERROR_PAGE_ADDRESS);
        }
    }

    protected void redirect(HttpServletResponse response, String url) {
        try {
            response.sendRedirect(url);
        } catch (IOException e) {
            LOGGER.error(e);
            throw new IllegalStateException("Redirect to " + url + " failed ", e);
        }
    }

    protected void forward(HttpServletRequest request, HttpServletResponse response, String url) {
        try {
            request.setAttribute("url", url);
            request.getRequestDispatcher(request.getContextPath() + url).forward(request, response);
        } catch (ServletException | IOException e) {
            LOGGER.error(e);
            throw new IllegalStateException("Forward to " + url + " failed ", e);
        }
    }

    protected abstract void executeWrapper(HttpServletRequest request, HttpServletResponse response) throws CommandException;
}
