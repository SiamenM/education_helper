package com.maskalenchyk.education_helper.command.view;


import com.maskalenchyk.education_helper.command.AbstractCommand;
import com.maskalenchyk.education_helper.command.CommandException;
import com.maskalenchyk.education_helper.core.Bean;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Show services page
 */
@Bean(name = "VIEW_SERVICES_PAGE")
public class ServicePageCommand extends AbstractCommand {
    @Override
    protected void executeWrapper(HttpServletRequest request, HttpServletResponse response) throws CommandException {
        forward(request, response, "/services");
    }
}
