package com.maskalenchyk.education_helper.command.user;

import com.maskalenchyk.education_helper.application.ApplicationConstants;
import com.maskalenchyk.education_helper.command.AbstractCommand;
import com.maskalenchyk.education_helper.command.CommandException;
import com.maskalenchyk.education_helper.core.Bean;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Bean(name = "LOGOUT")
public class LogoutCommand extends AbstractCommand {

    @Override
    protected void executeWrapper(HttpServletRequest request, HttpServletResponse response) throws CommandException {
        request.getSession().removeAttribute(ApplicationConstants.USER_PARAMETER);
        request.getSession().invalidate();
        redirect(response, "/homepage");
    }
}
