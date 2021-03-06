package com.maskalenchyk.education_helper.dal.connection;

import com.maskalenchyk.education_helper.core.Bean;
import com.maskalenchyk.education_helper.dal.connection_pool.ConnectionPool;
import com.maskalenchyk.education_helper.dal.connection_pool.ConnectionPoolException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.sql.Connection;

@Bean
public class DataSourceImpl implements DataSource {

    private static final Logger LOGGER = LoggerFactory.getLogger(DataSourceImpl.class);
    private final ConnectionPool connectionPool;

    public DataSourceImpl(ConnectionPool connectionPool) {
        this.connectionPool = connectionPool;
    }

    @Override
    public Connection getConnection() throws ConnectionException {
        try {
            return connectionPool.getConnection();
        } catch (ConnectionPoolException e) {
            LOGGER.error(e.getMessage());
            throw new ConnectionException(e.getMessage());
        }
    }

    @Override
    public void close() {
        connectionPool.close();
    }
}
