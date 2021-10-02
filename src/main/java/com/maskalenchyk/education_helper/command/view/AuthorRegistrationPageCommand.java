package com.maskalenchyk.education_helper.command.view;

import com.maskalenchyk.education_helper.application.ApplicationConstants;
import com.maskalenchyk.education_helper.command.AbstractCommand;
import com.maskalenchyk.education_helper.command.CommandException;
import com.maskalenchyk.education_helper.core.Bean;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@Bean(name = "VIEW_AUTHOR_REGISTRATION_PAGE")
public class AuthorRegistrationPageCommand extends AbstractCommand {

    @Override
    protected void executeWrapper(HttpServletRequest request, HttpServletResponse response) throws CommandException {
        HttpSession currentSession = request.getSession();
        if (currentSession == null || currentSession.getAttribute(ApplicationConstants.USER_PARAMETER) == null) {
            forward(request, response, "/author-registration-form");
        } else {
            throw new CommandException("The user is logged in this operation is not available");
        }
    }
}
