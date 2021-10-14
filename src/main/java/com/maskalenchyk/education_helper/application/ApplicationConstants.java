package com.maskalenchyk.education_helper.application;

import com.maskalenchyk.education_helper.command.CommandType;

public class ApplicationConstants {

    public static final String DB_PROPERTY_RESOURCE_FILE = "/mysql_connection.properties";
    public static final String EMAIL_SERVICE_RESOURCE_FILE = "/mailService.properties";

    public static final String LOCALE_PARAMETER = "locale";
    public static final String ENGLISH_LOCALE="en";
    public static final String RUSSIAN_LOCALE="ru";

    public static final String COMMAND_NAME_PARAMETER = "cmd";
    public static final String DEFAULT_COMMAND_NAME = CommandType.VIEW_HOME_PAGE.name();

    public static final String USER_PARAMETER = "user";

    public static final String ERROR_HEADER = "errorHeader";
    public static final String ERROR_MESSAGE = "errorMessage";
    public static final String ERROR_PAGE_ADDRESS = "/error";

    private ApplicationConstants() {
    }
}