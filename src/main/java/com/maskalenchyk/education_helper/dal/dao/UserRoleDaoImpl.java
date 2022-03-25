package com.maskalenchyk.education_helper.dal.dao;

import com.maskalenchyk.education_helper.core.Bean;
import com.maskalenchyk.education_helper.dal.connection.ConnectionException;
import com.maskalenchyk.education_helper.dal.connection_manager.ConnectionManager;
import com.maskalenchyk.education_helper.entity.UserRole;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.MessageFormat;
import java.util.List;

@Bean
public class UserRoleDaoImpl implements UserRoleDao {

    private static final String QUERY_ASSIGN_ROLE_FOR_USER = "INSERT INTO user_account_has_role VALUES (?,\n" +
            "                    (SELECT role_id FROM role WHERE role_name=?));";
    private static final String QUERY_DELETE_ROLE_FOR_USER = "";
    private static final String QUERY_ASSIGN_SEVERAL_ROLES_FOR_USER = "";
    private static final String QUERY_SELECT_ALL_ROLES = "";

    private static final Logger LOGGER = LoggerFactory.getLogger(UserRoleDaoImpl.class);
    private final ConnectionManager connectionManager;

    public UserRoleDaoImpl(ConnectionManager connectionManager) {
        this.connectionManager = connectionManager;
    }

    @Override
    public UserRole save(UserRole entity) throws UnsupportedOperationException {
        LOGGER.error("Unsupported operation: creating new user role. Please use database manager.");
        throw new UnsupportedOperationException("Unsupported operation: creating new user role. Please use database manager.");
    }

    @Override
    public void update(UserRole entity) throws UnsupportedOperationException {
        LOGGER.error("Unsupported operation: updating user role. Please use database manager.");
        throw new UnsupportedOperationException("Unsupported operation: updating user role. Please use database manager.");
    }

    @Override
    public void delete(UserRole entity) throws UnsupportedOperationException {
        LOGGER.error("Unsupported operation: deleting user role. Please use database manager.");
        throw new UnsupportedOperationException("Unsupported operation: deleting user role. Please use database manager.");
    }

    @Override
    public UserRole findById(Long aLong) throws DaoException {
        return null;
    }

    @Override
    public List<UserRole> findAll() throws DaoException {
        return null;
    }

    @Override
    public void assignRoleForUser(Long idUser, UserRole userRole) throws DaoException {
        String userRoleName = userRole.name().toLowerCase();
        try (Connection connection = connectionManager.getConnection();
             PreparedStatement statement = connection.prepareStatement(QUERY_ASSIGN_ROLE_FOR_USER)) {
            int i = 0;
            statement.setLong(++i, idUser);
            statement.setString(++i, userRoleName);
            statement.executeUpdate();

        } catch (ConnectionException | SQLException e) {
            LOGGER.error(MessageFormat.format("Assigning role failed.{0}", e.getMessage()));
            throw new DaoException(e.getMessage(), e);
        }
    }

    @Override
    public void deleteRoleForUser(Long idUser, UserRole userRole) {

    }

    @Override
    public void assignSeveralRolesForUser(Long idUser, List<UserRole> userRoleList) {
    }
}
