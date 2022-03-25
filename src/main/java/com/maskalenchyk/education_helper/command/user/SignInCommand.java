package com.maskalenchyk.education_helper.command.user;

import com.maskalenchyk.education_helper.application.ApplicationConstants;
import com.maskalenchyk.education_helper.application.ApplicationUtils;
import com.maskalenchyk.education_helper.command.AbstractCommand;
import com.maskalenchyk.education_helper.command.CommandException;
import com.maskalenchyk.education_helper.core.Bean;
import com.maskalenchyk.education_helper.entity.UserAccount;
import com.maskalenchyk.education_helper.service.UserService;
import com.maskalenchyk.education_helper.service.exceptions.ServiceException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@Bean(name = "SIGN_IN")
public class SignInCommand extends AbstractCommand {

    private static final Logger LOGGER = LoggerFactory.getLogger(SignInCommand.class);
    public static final String LOGIN_PARAMETER = "login";
    public static final String PASSWORD_PARAMETER = "password";
    public static final String INCORRECT_PARAMETER = "isWrong";

    private UserService userService;

    public SignInCommand(UserService userService) {
        this.userService = userService;
    }

    @Override
    protected void executeWrapper(HttpServletRequest request, HttpServletResponse response) throws CommandException {
        String login = request.getParameter(LOGIN_PARAMETER);
        String password = request.getParameter(PASSWORD_PARAMETER);
        UserAccount user = getUser(login, password);
        if (user != null) {
            HttpSession session = request.getSession();
            session.setAttribute(ApplicationConstants.USER_PARAMETER, user.getId());
            LOGGER.info("User {} signed in.",user.getId());
            forward(request, response, "/homepage");
        }
        request.setAttribute(LOGIN_PARAMETER, login);
        request.setAttribute(INCORRECT_PARAMETER,"1");
        forward(request, response, "/WEB-INF/jsp/authorizationPage.jsp");
    }

    private UserAccount getUser(String login, String password) {
        if (ApplicationUtils.isMobilePhone(login) || ApplicationUtils.isEmailAddress(login)) {
            try {
                return userService.signIn(login, password);
            } catch (ServiceException e) {
                ///обработка исключения
                e.printStackTrace();
            }
        }
        return null;
    }
}
