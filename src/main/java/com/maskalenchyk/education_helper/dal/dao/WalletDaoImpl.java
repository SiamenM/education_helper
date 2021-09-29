package com.maskalenchyk.education_helper.dal.dao;

import com.maskalenchyk.education_helper.core.Bean;
import com.maskalenchyk.education_helper.dal.connection.ConnectionException;
import com.maskalenchyk.education_helper.dal.connection_manager.ConnectionManager;
import com.maskalenchyk.education_helper.entity.Wallet;
import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.MessageFormat;
import java.util.LinkedList;
import java.util.List;

@Bean
public class WalletDaoImpl implements WalletDao {

    private static final String QUERY_SELECT_BY_ID = "SELECT wallet_id, wallet_amount FROM wallet WHERE wallet_id= ?;";
    private static final String QUERY_UPDATE = "UPDATE wallet SET wallet_amount=? WHERE wallet_id = ?;";
    private static final String QUERY_DELETE = "DELETE FROM wallet WHERE wallet_id = ?;";
    private static final String QUERY_SELECT_ALL = "SELECT wallet_id, wallet_amount FROM wallet;";
    private static final String QUERY_INSERT = "INSERT INTO wallet(wallet_amount) VALUES(?);";
    private static final String QUERY_INSERT_EMPTY_WALLET = "INSERT INTO wallet(wallet_amount) VALUES(?);";

    private static final Logger LOGGER = LogManager.getLogger(WalletDaoImpl.class);
    private final ConnectionManager connectionManager;

    public WalletDaoImpl(ConnectionManager connectionManager) {
        this.connectionManager = connectionManager;
    }

    @Override
    public Wallet save(Wallet entity) throws DaoException {
        String query = entity.getAmount() != null ? QUERY_INSERT : QUERY_INSERT_EMPTY_WALLET;
        try (Connection connection = connectionManager.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            prepareWalletStatement(entity, preparedStatement);
            preparedStatement.executeUpdate();
            try (ResultSet generatedKeys = preparedStatement.getGeneratedKeys()) {
                if (generatedKeys.next()) {
                    entity.setId(generatedKeys.getLong(1));
                    return entity;
                } else {
                    LOGGER.error("Creating wallet failed, no ID obtained.");
                    throw new DaoException("Creating wallet failed, no ID obtained.");
                }
            }
        } catch (ConnectionException | SQLException e) {
            LOGGER.error(MessageFormat.format("Creating wallet failed. {0}", e.getMessage()));
            throw new DaoException(e.getMessage(), e);
        }
    }

    @Override
    public void update(Wallet entity) throws DaoException {
        try (Connection connection = connectionManager.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(QUERY_UPDATE)) {
            prepareWalletStatement(entity, preparedStatement);
            preparedStatement.setLong(1, entity.getId());
            preparedStatement.executeUpdate();
        } catch (ConnectionException | SQLException e) {
            LOGGER.error(MessageFormat.format("Updating wallet failed.{0}", e.getMessage()));
            throw new DaoException(e.getMessage(), e);
        }
    }

    @Override
    public void delete(Wallet entity) throws DaoException {
        try (Connection connection = connectionManager.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(QUERY_DELETE)) {
            preparedStatement.setLong(1, entity.getId());
            preparedStatement.executeUpdate();
        } catch (ConnectionException | SQLException e) {
            LOGGER.error(MessageFormat.format("Deleting wallet failed.{0}", e.getMessage()));
            throw new DaoException(e.getMessage(), e);
        }
    }

    @Override
    public Wallet findById(Long id) throws DaoException {
        try (Connection connection = connectionManager.getConnection();
             PreparedStatement statement = connection.prepareStatement(QUERY_SELECT_BY_ID)) {
            statement.setLong(1, id);
            try (ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) {
                    return parseWalletFromResultSet(resultSet);
                } else {
                    return null;
                }
            }
        } catch (ConnectionException | SQLException e) {
            LOGGER.error(MessageFormat.format("Getting wallet by id failed. {0}", e.getMessage()));
            throw new DaoException(e.getMessage(), e);
        }
    }

    @Override
    public List<Wallet> findAll() throws DaoException {
        try (Connection connection = connectionManager.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(QUERY_SELECT_ALL)) {
            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                List<Wallet> walletList = new LinkedList<>();
                while (resultSet.next()) {
                    Wallet wallet = parseWalletFromResultSet(resultSet);
                    walletList.add(wallet);
                }
                return walletList;
            }
        } catch (ConnectionException | SQLException e) {
            LOGGER.error(MessageFormat.format("Getting list of wallets failed. {0}", e.getMessage()));
            throw new DaoException(e.getMessage(), e);
        }
    }

    private Wallet parseWalletFromResultSet(ResultSet resultSet) throws SQLException {
        Long walletId = resultSet.getLong("id_wallet");
        BigDecimal walletAmount = resultSet.getBigDecimal("wallet_amount");
        Wallet wallet = new Wallet();
        wallet.setId(walletId);
        wallet.setAmount(walletAmount);
        return wallet;
    }

    private void prepareWalletStatement(Wallet entity, PreparedStatement statement) throws SQLException {
        int i = 0;
        statement.setBigDecimal(++i, entity.getAmount());
        statement.setLong(++i, entity.getId());
    }

}