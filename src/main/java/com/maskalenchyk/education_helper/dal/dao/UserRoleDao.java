package com.maskalenchyk.education_helper.dal.dao;

import com.maskalenchyk.education_helper.entity.UserRole;

import java.util.List;

public interface UserRoleDao extends CRUDDao<UserRole, Long> {

    void assignRoleForUser(Long idUser, UserRole userRole) throws DaoException;

    void deleteRoleForUser(Long idUser, UserRole userRole) throws DaoException;

    void assignSeveralRolesForUser(Long idUser, List<UserRole> userRoleList) throws DaoException;
}
