package com.maskalenchyk.education_helper.command.user;

import com.maskalenchyk.education_helper.command.AbstractCommand;
import com.maskalenchyk.education_helper.command.CommandException;
import com.maskalenchyk.education_helper.core.Bean;
import com.maskalenchyk.education_helper.entity.UserAccount;
import com.maskalenchyk.education_helper.service.UserService;
import com.maskalenchyk.education_helper.service.exceptions.ServiceException;
import org.apache.log4j.Logger;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Bean(name = "REGISTRATION_USER")
public class RegistrationUserCommand extends AbstractCommand {

    public static final Logger LOGGER = Logger.getLogger(RegistrationUserCommand.class);
    public static final String USER_NAME = "userName";
    public static final String USER_EMAIL = "userEmail";
    public static final String USER_PHONE = "userPhone";
    public static final String USER_SPECIALIZATION = "userSpecialization";
    public static final String USER_ADDITIONAL_INFO = "userAdditionalInfo";
    public static final String USER_ROLE = "userRole";
    public static final String REGISTRATION_ERROR_MESSAGE = "errorMessage";

    private final UserService userService;

    public RegistrationUserCommand(UserService userService) {
        this.userService = userService;
    }

    @Override
    protected void executeWrapper(HttpServletRequest request, HttpServletResponse response) throws CommandException {
        String userName = request.getParameter(USER_NAME);
        String userEmail = request.getParameter(USER_EMAIL);
        String userPhone = request.getParameter(USER_PHONE);

        try {

            if (isUserExist(userEmail) || isUserExist(userPhone)) {

            }
        } catch (ServiceException e) {
            e.printStackTrace();
        }
    }

    private Boolean isUserExist(String login) throws ServiceException {
        UserAccount userAccount = userService.getByLogin(login);
        return userAccount == null;
    }
}
