package com.maskalenchyk.education_helper.command;

import com.maskalenchyk.education_helper.application.ApplicationConstants;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public abstract class AbstractCommand implements ServletCommand {

    private static final Logger LOGGER = LoggerFactory.getLogger(AbstractCommand.class);

    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {
        try {
            executeWrapper(request, response);
        } catch (CommandException e) {
            String errorSource = this.getClass().getName();
            LOGGER.error("Command executing failed in {}",errorSource);
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
            throw new IllegalStateException("Redirect to " + url + " failed ", e);
        }
    }

    protected void forward(HttpServletRequest request, HttpServletResponse response, String url) {
        try {
            request.setAttribute("url", url);
            request.getRequestDispatcher(request.getContextPath() + url).forward(request, response);
        } catch (ServletException | IOException e) {
            throw new IllegalStateException("Forward to " + url + " failed ", e);
        }
    }

    protected abstract void executeWrapper(HttpServletRequest request, HttpServletResponse response) throws CommandException;
}
