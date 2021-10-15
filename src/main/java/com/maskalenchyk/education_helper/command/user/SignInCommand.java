package com.maskalenchyk.education_helper.command.user;

import com.maskalenchyk.education_helper.application.ApplicationConstants;
import com.maskalenchyk.education_helper.application.ApplicationUtils;
import com.maskalenchyk.education_helper.command.AbstractCommand;
import com.maskalenchyk.education_helper.command.CommandException;
import com.maskalenchyk.education_helper.core.Bean;
import com.maskalenchyk.education_helper.entity.UserAccount;
import org.apache.log4j.Logger;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@Bean(name = "SIGN_IN")
public class SignInCommand extends AbstractCommand {

    private static final Logger LOGGER = Logger.getLogger(SignInCommand.class);
    public static final String LOGIN_PARAMETER = "login";
    public static final String PASSWORD_PARAMETER = "password";

    @Override
    protected void executeWrapper(HttpServletRequest request, HttpServletResponse response) throws CommandException {
        String login = request.getParameter(LOGIN_PARAMETER);
        String password = request.getParameter(PASSWORD_PARAMETER);
        UserAccount user = getUser(request,login,password);
        LOGGER.info("User " + user.getId() + " signed in.");
        request.setAttribute(ApplicationConstants.USER_PARAMETER,user);
        forward(request,response,"/homepage");
    }

    private UserAccount getUser(HttpServletRequest request, String login, String password) {
        HttpSession session = request.getSession();
        UserAccount user = (UserAccount) session.getAttribute(ApplicationConstants.USER_PARAMETER);
    }
}
