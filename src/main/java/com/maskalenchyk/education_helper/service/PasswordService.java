package com.maskalenchyk.education_helper.service;

import com.maskalenchyk.education_helper.service.exceptions.ServiceException;

public interface PasswordService {

    String generateRandomPassword(Integer length) throws ServiceException;

    String getPasswordHash(String password) throws ServiceException;
}
