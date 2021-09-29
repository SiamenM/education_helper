package com.maskalenchyk.education_helper.dal.connection_pool;

import java.sql.Connection;

/**
 * Database connection pool of web application
 */
public interface ConnectionPool {
    Connection getConnection() throws ConnectionPoolException;

    void close();
}
