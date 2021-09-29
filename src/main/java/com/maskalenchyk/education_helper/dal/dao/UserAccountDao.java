package com.maskalenchyk.education_helper.dal.dao;

import com.maskalenchyk.education_helper.entity.UserAccount;

public interface UserAccountDao extends CRUDDao<UserAccount, Long> {

    UserAccount findByPhone(String phoneNumber) throws DaoException;

    UserAccount findByEmail(String email) throws DaoException;

    void assignNewRole(Long userId, String roleName) throws DaoException;

    void deleteUserRole(Long userId, String roleName) throws DaoException;
}
