package com.maskalenchyk.education_helper.service;

import com.maskalenchyk.education_helper.entity.UserAccount;
import com.maskalenchyk.education_helper.entity.UserRole;
import com.maskalenchyk.education_helper.service.exceptions.ServiceException;

import java.util.List;

public interface UserService {

    UserAccount getById(Long id) throws ServiceException;

    UserAccount getByLogin(String login) throws ServiceException;

    UserAccount signIn(String login, String password) throws ServiceException;

    UserAccount createUserAccount(String email, String phoneNumber, String name,  List<UserRole> userRoles) throws ServiceException;

    List<UserAccount> findAll() throws ServiceException;

    void deleteById(Long id) throws ServiceException;

    void addRoleForUser(Long id, UserRole role) throws ServiceException;

    void deleteRoleForUser(Long id, UserRole role) throws ServiceException;

    void updateUserAccount(UserAccount userAccount) throws ServiceException;

    void updateUserPassword(UserAccount userAccount, String oldPassword, String newPassword) throws ServiceException;
}
