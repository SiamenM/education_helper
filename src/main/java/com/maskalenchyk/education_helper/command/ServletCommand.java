package com.maskalenchyk.education_helper.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface ServletCommand {

    /**
     * Executes command using {@link HttpServletRequest} specified
     *
     * @param request  request from the user with necessary data to execute
     * @param response response to the user for future actions
     * @throws CommandException if command cannot be executed or execution failed
     */

    void execute(HttpServletRequest request, HttpServletResponse response) throws CommandException;
}
