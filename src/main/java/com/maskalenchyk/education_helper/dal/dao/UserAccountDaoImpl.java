package com.maskalenchyk.education_helper.dal.dao;

import com.maskalenchyk.education_helper.core.Bean;
import com.maskalenchyk.education_helper.dal.connection.ConnectionException;
import com.maskalenchyk.education_helper.dal.connection_manager.ConnectionManager;
import com.maskalenchyk.education_helper.entity.UserAccount;
import com.maskalenchyk.education_helper.entity.UserRole;
import com.maskalenchyk.education_helper.entity.Wallet;
import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.MessageFormat;
import java.util.ArrayList;
import java.util.List;

@Bean
public class UserAccountDaoImpl implements UserAccountDao {
    private static final String QUERY_SELECT_ALL =
            "SELECT user.user_account_id,user.user_account_name,user.user_account_email,user.user_account_phone,user.user_account_password," +
                    "            user.user_account_registration_date," +
                    "            user.id_wallet, wallet.wallet_amount, role.role_name" +
                    "            FROM user_account AS user" +
                    "            JOIN user_account_has_role AS relation  ON relation.user_account_id=user.user_account_id" +
                    "            JOIN role ON relation.role_id=role.role_id" +
                    "            JOIN wallet ON wallet.wallet_id=user.id_wallet";
    private static final String QUERY_SELECT_USER_BY_ID =
            "SELECT user.user_account_id,user.user_account_name,user.user_account_email,user.user_account_phone,user.user_account_password," +
                    "            user.user_account_registration_date," +
                    "            user.id_wallet, wallet.wallet_amount, role.role_name" +
                    "            FROM user_account AS user" +
                    "            JOIN user_account_has_role AS relation ON relation.user_account_id=user.user_account_id" +
                    "            JOIN role ON relation.role_id=role.role_id" +
                    "            JOIN wallet ON wallet.wallet_id=user.id_wallet" +
                    "            WHERE user.user_account_id=?;";
    private static final String QUERY_SELECT_USER_BY_EMAIL =
            "SELECT user.user_account_id,user.user_account_name,user.user_account_email,user.user_account_phone,user.user_account_password," +
                    "            user.user_account_registration_date," +
                    "            user.id_wallet, wallet.wallet_amount, role.role_name" +
                    "            FROM user_account AS user" +
                    "            JOIN user_account_has_role AS relation ON relation.user_account_id=user.user_account_id" +
                    "            JOIN role ON relation.role_id=role.role_id" +
                    "            JOIN wallet ON wallet.wallet_id=user.id_wallet" +
                    "            WHERE user.user_account_email=?;";

    private static final String QUERY_SELECT_USER_BY_PHONE =
            "SELECT user.user_account_id,user.user_account_name,user.user_account_email,user.user_account_phone,user.user_account_password," +
                    "            user.user_account_registration_date," +
                    "            user.id_wallet, wallet.wallet_amount, role.role_name" +
                    "            FROM user_account AS user" +
                    "            JOIN user_account_has_role AS relation ON relation.user_account_id=user.user_account_id" +
                    "            JOIN role ON relation.role_id=role.role_id" +
                    "            JOIN wallet ON wallet.wallet_id=user.id_wallet" +
                    "            WHERE user.user_account_phone=?;";
    private static final String QUERY_UPDATE_USER_DATA =
            "UPDATE user_account SET user_account_name=?,user_account_email=?,user_account_phone=?, user_account_password=? " +
                    "WHERE user_account_id=?;";
    private static final String QUERY_DELETE_USER = "DELETE FROM user_account WHERE user_account_id=?;";
    private static final String QUERY_ASSIGN_USER_ROLE =
            "INSERT into user_account_has_role (user_account_id,role_id ) VALUES(?,(SELECT role_id FROM role WHERE role_name=?));";
    private static final String QUERY_DELETE_USER_ROLE =
            "DELETE FROM user_account_has_role WHERE user_account_id = ? and role_id =(SELECT role_id FROM role WHERE role_name=?);";
    private static final String QUERY_INSERT_NEW_USER =
                    "INSERT INTO wallet VALUES ();" +
                    "INSERT INTO user_account (user_account_name,user_account_email,user_account_phone,user_account_password,id_wallet)" +
                    "VALUES (?,?,?,?,?);" +
                    "INSERT INTO user_account_has_role VALUES (last_insert_id()," +
                    "(SELECT role_id FROM role WHERE role_name='user'));";

    private static final Logger LOGGER = LogManager.getLogger(UserAccountDaoImpl.class);
    private final ConnectionManager connectionManager;
    private final WalletDao walletDao;

    public UserAccountDaoImpl(ConnectionManager connectionManager, WalletDao walletDao) {
        this.connectionManager = connectionManager;
        this.walletDao = walletDao;
    }

    @Override
    public UserAccount save(UserAccount entity) throws DaoException {
        Wallet newWallet = walletDao.save(new Wallet());
        entity.setWallet(newWallet);
        try (Connection connection = connectionManager.getConnection();
             PreparedStatement statement = connection.prepareStatement(QUERY_INSERT_NEW_USER)) {
            int i = 0;
            statement.setString(++i, entity.getName());
            statement.setString(++i, entity.getEmail());
            statement.setString(++i, entity.getPhone());
            statement.setString(++i, entity.getPassword());
            statement.setLong(++i,entity.getWallet().getId());
            statement.executeUpdate();
            try (ResultSet generatedKeys = statement.getGeneratedKeys()) {
                if (generatedKeys.next()) {
                    return entity;
                } else {
                    LOGGER.error("Inserting new user failed, no ID obtained.");
                    throw new DaoException("Inserting new user failed, no ID obtained.");
                }
            }
        } catch (ConnectionException | SQLException e) {
            LOGGER.error(MessageFormat.format("Inserting new user failed.{0}", e.getMessage()));
            throw new DaoException(e.getMessage(), e);
        }
    }

    @Override
    public void update(UserAccount entity) throws DaoException {
        try (Connection connection = connectionManager.getConnection();
             PreparedStatement statement = connection.prepareStatement(QUERY_UPDATE_USER_DATA)) {
            int i = 0;
            statement.setString(++i, entity.getName());
            statement.setString(++i, entity.getEmail());
            statement.setString(++i, entity.getPhone());
            statement.setString(++i, entity.getPassword());
            statement.setLong(++i, entity.getId());
            statement.executeUpdate();
        } catch (ConnectionException | SQLException e) {
            LOGGER.error(MessageFormat.format("Updating user failed.{0}", e.getMessage()));
            throw new DaoException(e.getMessage(), e);
        }
    }

    @Override
    public void delete(UserAccount entity) throws DaoException {
        try (Connection connection = connectionManager.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(QUERY_DELETE_USER)) {
            preparedStatement.setLong(1, entity.getId());
            preparedStatement.executeUpdate();
        } catch (ConnectionException | SQLException e) {
            LOGGER.error(MessageFormat.format("Deleting user failed.{0}", e.getMessage()));
            throw new DaoException(e.getMessage(), e);
        }
    }

    @Override
    public UserAccount findById(Long id) throws DaoException {
        try (Connection connection = connectionManager.getConnection();
             PreparedStatement statement = connection.prepareStatement(QUERY_SELECT_USER_BY_ID)) {
            statement.setLong(1, id);
            try (ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) {
                    return parseUserFromResultSet(resultSet);
                } else {
                    return null;
                }
            }
        } catch (ConnectionException | SQLException e) {
            LOGGER.error(MessageFormat.format("Getting user by id failed. {0}", e.getMessage()));
            throw new DaoException(e.getMessage(), e);
        }
    }

    @Override
    public UserAccount findByPhone(String phoneNumber) throws DaoException {
        try (Connection connection = connectionManager.getConnection();
             PreparedStatement statement = connection.prepareStatement(QUERY_SELECT_USER_BY_PHONE)) {
            statement.setString(1, phoneNumber);
            try (ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) {
                    return parseUserFromResultSet(resultSet);
                } else {
                    return null;
                }
            }
        } catch (ConnectionException | SQLException e) {
            LOGGER.error(MessageFormat.format("Getting user by phone number failed. {0}", e.getMessage()));
            throw new DaoException(e.getMessage(), e);
        }
    }

    @Override
    public UserAccount findByEmail(String email) throws DaoException {
        try (Connection connection = connectionManager.getConnection();
             PreparedStatement statement = connection.prepareStatement(QUERY_SELECT_USER_BY_EMAIL)) {
            statement.setString(1, email);
            try (ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) {
                    return parseUserFromResultSet(resultSet);
                } else {
                    return null;
                }
            }
        } catch (ConnectionException | SQLException e) {
            LOGGER.error(MessageFormat.format("Getting user by phone number failed. {0}", e.getMessage()));
            throw new DaoException(e.getMessage(), e);
        }
    }

    @Override
    public void assignNewRole(Long userId, String roleName) throws DaoException {
        try (Connection connection = connectionManager.getConnection();
             PreparedStatement statement = connection.prepareStatement(QUERY_ASSIGN_USER_ROLE)) {
            int i = 0;
            statement.setLong(++i, userId);
            statement.setString(++i, roleName);
            statement.executeUpdate();
        } catch (ConnectionException | SQLException e) {
            LOGGER.error(MessageFormat.format("Assigning user role failed. {0}", e.getMessage()));
            throw new DaoException(e.getMessage(), e);
        }
    }

    @Override
    public void deleteUserRole(Long userId, String roleName) throws DaoException {
        try (Connection connection = connectionManager.getConnection();
             PreparedStatement statement = connection.prepareStatement(QUERY_DELETE_USER_ROLE)) {
            int i = 0;
            statement.setLong(++i, userId);
            statement.setString(++i, roleName);
            statement.executeUpdate();
        } catch (ConnectionException | SQLException e) {
            LOGGER.error(MessageFormat.format("Deleting user role failed. {0}", e.getMessage()));
            throw new DaoException(e.getMessage(), e);
        }
    }

    @Override
    public List<UserAccount> findAll() throws DaoException {
        try (Connection connection = connectionManager.getConnection();
             PreparedStatement statement = connection.prepareStatement(QUERY_SELECT_ALL)) {
            try (ResultSet resultSet = statement.executeQuery()) {
                List<UserAccount> accountList = new ArrayList<>();
                while (resultSet.next()) {
                    UserAccount user = parseUserFromResultSet(resultSet);
                    accountList.add(user);
                }
                return accountList;
            }
        } catch (ConnectionException | SQLException e) {
            LOGGER.error(MessageFormat.format("Getting all users failed. {0}", e.getMessage()));
            throw new DaoException(e.getMessage(), e);
        }
    }

    private UserAccount parseUserFromResultSet(ResultSet resultSet) throws SQLException {
        UserAccount userAccount = new UserAccount();
        userAccount.setId(resultSet.getLong("user_account_id"));
        userAccount.setName(resultSet.getString("user_account_name"));
        userAccount.setEmail(resultSet.getString("user_account_email"));
        userAccount.setPhone(resultSet.getString("user_account_phone"));
        userAccount.setPassword(resultSet.getString("user_account_password"));
        userAccount.setRegistrationDate(resultSet.getTimestamp("user_account_registration_date").getTime());

        Wallet wallet = new Wallet();
        wallet.setId(resultSet.getLong("wallet_id"));
        wallet.setAmount(resultSet.getBigDecimal("wallet_amount"));

        userAccount.setWallet(wallet);
        List<UserRole> userRoleList = new ArrayList<>();
        while (resultSet.next()) {
            String roleName = resultSet.getString("role_name");
            UserRole userRole = UserRole.valueOf(roleName.toUpperCase());
            userRoleList.add(userRole);
        }
        userAccount.setUserRoles(userRoleList);
        return userAccount;
    }
}