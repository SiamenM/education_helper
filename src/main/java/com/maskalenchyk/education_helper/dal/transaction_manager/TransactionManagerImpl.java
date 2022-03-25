package com.maskalenchyk.education_helper.dal.transaction_manager;

import com.maskalenchyk.education_helper.core.Bean;
import com.maskalenchyk.education_helper.dal.connection.ConnectionException;
import com.maskalenchyk.education_helper.dal.connection.DataSource;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.sql.Connection;
import java.sql.SQLException;

@Bean
public class TransactionManagerImpl implements TransactionManager {

    private static final Logger LOGGER = LoggerFactory.getLogger(TransactionManagerImpl.class);
    private static final String EMPTY_CURRENT_CONNECTION_MESSAGE = "Local thread connection is empty";
    private final DataSource dataSource;
    private ThreadLocal<Connection> currentConnection = new ThreadLocal<>();

    public TransactionManagerImpl(DataSource dataSource) {
        this.dataSource = dataSource;
    }

    @Override
    public void beginTransaction() throws TransactionManagerException {
        try {
            Connection connection = dataSource.getConnection();
            currentConnection.set(connection);
            connection.setAutoCommit(false);
            LOGGER.info("Transaction started");
        } catch (ConnectionException | SQLException e) {
            LOGGER.error("Transaction didn't start: {}", e.getMessage());
            throw new TransactionManagerException(e.getMessage(), e);
        }
    }

    @Override
    public void commitTransaction() throws TransactionManagerException {
        Connection connection = currentConnection.get();
        if (connection != null) {
            try {
                connection.commit();
                LOGGER.info("Transaction commit");
                this.close();
            } catch (SQLException e) {
                LOGGER.error("Commit transaction error: {}", e.getMessage());
                throw new TransactionManagerException(e.getMessage(), e);
            }
        } else {
            LOGGER.error(EMPTY_CURRENT_CONNECTION_MESSAGE);
            throw new TransactionManagerException(EMPTY_CURRENT_CONNECTION_MESSAGE);
        }
    }

    @Override
    public void rollbackTransaction() throws TransactionManagerException {
        Connection connection = currentConnection.get();
        if (connection != null) {
            try {
                connection.rollback();
                LOGGER.info("Transaction rollback");
                this.close();
            } catch (SQLException e) {
                LOGGER.error("Rollback error: {}", e.getMessage());
                throw new TransactionManagerException(e.getMessage(), e);
            }
        } else {
            LOGGER.error(EMPTY_CURRENT_CONNECTION_MESSAGE);
            throw new TransactionManagerException(EMPTY_CURRENT_CONNECTION_MESSAGE);
        }
    }

    @Override
    public Connection getConnection() {
        return currentConnection.get();
    }

    private void close() throws TransactionManagerException {
        try {
            Connection connection = currentConnection.get();
            connection.setAutoCommit(true);
            connection.close();
            currentConnection.remove();
            LOGGER.info("Transaction closed");
        } catch (SQLException e) {
            LOGGER.error("Transaction closing exception {}", e.getMessage());
            throw new TransactionManagerException(e.getMessage(), e);
        }
    }
}
