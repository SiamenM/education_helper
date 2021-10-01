package com.maskalenchyk.education_helper.command.view;

import com.maskalenchyk.education_helper.command.AbstractCommand;
import com.maskalenchyk.education_helper.command.CommandException;
import com.maskalenchyk.education_helper.core.Bean;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Show authorization page
 */
@Bean(name = "VIEW_AUTHORIZATION_PAGE")
public class AuthorizationPageCommand extends AbstractCommand {
    @Override
    protected void executeWrapper(HttpServletRequest request, HttpServletResponse response) throws CommandException {
        forward(request, response, "/authorization");
    }
}
