package com.maskalenchyk.education_helper.command.view;

import com.maskalenchyk.education_helper.command.AbstractCommand;
import com.maskalenchyk.education_helper.command.CommandException;
import com.maskalenchyk.education_helper.core.Bean;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Show  complete form task page
 */
@Bean(name = "VIEW_FORM_TASK_PAGE")
public class FormTaskPageCommand extends AbstractCommand {

    @Override
    protected void executeWrapper(HttpServletRequest request, HttpServletResponse response) throws CommandException {
        forward(request, response, "form_task");
    }
}
