package com.maskalenchyk.education_helper.dal.connection_manager;

import com.maskalenchyk.education_helper.core.Bean;
import com.maskalenchyk.education_helper.dal.connection.ConnectionException;
import com.maskalenchyk.education_helper.dal.connection.DataSource;
import com.maskalenchyk.education_helper.dal.transaction_manager.TransactionManager;
import com.maskalenchyk.education_helper.dal.transaction_manager.TransactionManagerException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.sql.Connection;

@Bean
public class ConnectionManagerImpl implements ConnectionManager {

    private static final Logger LOGGER = LoggerFactory.getLogger(ConnectionManagerImpl.class);
    private final DataSource dataSource;
    private final TransactionManager transactionManager;

    public ConnectionManagerImpl(DataSource dataSource, TransactionManager transactionManager) {
        this.dataSource = dataSource;
        this.transactionManager = transactionManager;
    }

    @Override
    public Connection getConnection() throws ConnectionException {
        try {
            Connection connection = transactionManager.getConnection();
            return connection != null ? connection : dataSource.getConnection();
        } catch (TransactionManagerException e) {
            LOGGER.error(e.getMessage());
            throw new ConnectionException(e.getMessage(), e);
        }
    }
}
