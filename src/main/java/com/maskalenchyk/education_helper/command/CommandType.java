package com.maskalenchyk.education_helper.command;

import java.util.Optional;
import java.util.stream.Stream;

public enum CommandType {

    VIEW_HOME_PAGE,
    VIEW_COMPLETE_WORKS_PAGE,
    VIEW_GUARANTEES_PAGE,
    VIEW_CLIENT_INSTRUCTION_PAGE,
    VIEW_USER_CABINET_PAGE,
    VIEW_AUTHOR_QUESTIONS_PAGE,
    VIEW_AUTHOR_REGISTRATION_PAGE,
    VIEW_FORM_TASK_PAGE,
    VIEW_SERVICES_PAGE,
    VIEW_AUTHORIZATION_PAGE,
    REGISTRATION_USER,
    SIGN_IN,
    LOGOUT;

    public static Optional<CommandType> of(String name){
        return Stream.of(CommandType.values()).
                filter(commandType -> commandType.name().equalsIgnoreCase(name)).
                findFirst();
    }
}
