package com.maskalenchyk.education_helper.service;

import com.maskalenchyk.education_helper.service.exceptions.ServiceException;

public interface EmailService {

    void sendRegistrationEmail(String recipient, String recipientPassword) throws ServiceException;
}
