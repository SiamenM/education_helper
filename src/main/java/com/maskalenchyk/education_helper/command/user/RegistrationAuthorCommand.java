package com.maskalenchyk.education_helper.command.user;

import com.maskalenchyk.education_helper.command.AbstractCommand;
import com.maskalenchyk.education_helper.command.CommandException;
import com.maskalenchyk.education_helper.core.Bean;
import com.maskalenchyk.education_helper.entity.UserAccount;
import com.maskalenchyk.education_helper.entity.UserRole;
import com.maskalenchyk.education_helper.service.UserService;
import com.maskalenchyk.education_helper.service.exceptions.ServiceException;
import com.maskalenchyk.education_helper.service.exceptions.UserServiceException;
import org.apache.log4j.Logger;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Arrays;
import java.util.LinkedList;
import java.util.List;
import java.util.stream.Collectors;

@Bean(name = "REGISTRATION_AUTHOR")
public class RegistrationAuthorCommand extends AbstractCommand {

    public static final Logger LOGGER = Logger.getLogger(RegistrationAuthorCommand.class);
    public static final String USER_NAME = "userName";
    public static final String USER_EMAIL = "userEmail";
    public static final String USER_PHONE = "userPhone";
    public static final String USER_SPECIALIZATION = "userSpecialization";
    public static final String USER_ADDITIONAL_INFO = "userAdditionalInfo";
    public static final String USER_ROLE = "userRole";
    public static final String REGISTRATION_RESULT_ERROR = "errorMessage";
    public static final String ERROR_CODE = "errorCode";
    public static final String EMAIL_ERROR_VALUE = "emailError";
    public static final String PHONE_ERROR_VALUE = "phoneError";
    public static final String DEFAULT_ERROR_VALUE = "defaultError";
    public static final String REGISTRATION_RESPONSE = "registrationResponse";

    private final UserService userService;

    public RegistrationAuthorCommand(UserService userService) {
        this.userService = userService;
    }

    @Override
    protected void executeWrapper(HttpServletRequest request, HttpServletResponse response) throws CommandException {
        String userName = request.getParameter(USER_NAME);
        String userEmail = request.getParameter(USER_EMAIL);
        String userPhone = request.getParameter(USER_PHONE);
        String[] disciplesValues = request.getParameterValues(USER_SPECIALIZATION);
        UserRole userRole = UserRole.valueOf(request.getParameter(USER_ROLE));
        List<UserRole> userRoleList = new LinkedList<>();
        userRoleList.add(userRole);
        userRoleList.add(UserRole.USER);
        String userAdditionalInfo = request.getParameter(USER_ADDITIONAL_INFO);
        if (disciplesValues != null) {
            String disciples = Arrays.stream(disciplesValues).map(String::valueOf).collect(Collectors.joining(","));
            userAdditionalInfo = userAdditionalInfo.concat(disciples);
        }
        try {
            UserAccount registeredUser = userService.createUserAccount(userEmail, userPhone, userName, userRoleList, userAdditionalInfo);
            LOGGER.info("User " + registeredUser.getId() + " have registered.");
            request.setAttribute(REGISTRATION_RESPONSE, "1");
            forward(request, response, "/WEB-INF/jsp/authorRegistrationPage");

            //результат успешного выполнения

        } catch (UserServiceException e) {
            LOGGER.info("Registration failed for " + userEmail + ", " + userPhone);
            String errorMessage;
            switch (e.getErrorCode()) {
                case UserServiceException.EMAIL_ALREADY_EXISTS:
                    errorMessage = EMAIL_ERROR_VALUE;
                    request.setAttribute(ERROR_CODE, EMAIL_ERROR_VALUE);
                    break;
                case UserServiceException.PHONE_NUMBER_ALREADY_EXISTS:
                    errorMessage = PHONE_ERROR_VALUE;
                    request.setAttribute(ERROR_CODE, PHONE_ERROR_VALUE);
                    break;
                default:
                    errorMessage = DEFAULT_ERROR_VALUE;
                    request.setAttribute(ERROR_CODE, DEFAULT_ERROR_VALUE);
                    break;
            }
            request.setAttribute(REGISTRATION_RESULT_ERROR, errorMessage);
            forward(request, response, "/WEB-INF/jsp/authorRegistrationPage");
        } catch (ServiceException e) {
            forward(request, response, "/WEB-INF/jsp/errorPage");
        }
    }

    private Boolean isUserExist(String login) throws ServiceException {
        UserAccount userAccount = userService.getByLogin(login);
        return userAccount == null;
    }
}
