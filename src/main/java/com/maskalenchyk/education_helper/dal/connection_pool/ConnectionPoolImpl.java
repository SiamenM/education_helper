package com.maskalenchyk.education_helper.dal.connection_pool;

import com.maskalenchyk.education_helper.application.ApplicationConstants;
import com.maskalenchyk.education_helper.core.Bean;
import org.apache.log4j.Logger;

import java.io.IOException;
import java.lang.reflect.Proxy;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.text.MessageFormat;
import java.util.Properties;
import java.util.concurrent.ArrayBlockingQueue;
import java.util.concurrent.BlockingQueue;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.locks.Lock;
import java.util.concurrent.locks.ReentrantLock;

@Bean
public class ConnectionPoolImpl implements ConnectionPool {

    private static final Logger LOGGER = Logger.getLogger(ConnectionPoolImpl.class);
    private static final Lock instanceLock = new ReentrantLock();
    private static ConnectionPoolImpl instance;
    private BlockingQueue<Connection> availableConnections;
    private BlockingQueue<Connection> usedConnections;

    private ConnectionPoolImpl() {
    }

    public static ConnectionPool getInstance() {
        instanceLock.lock();
        try {
            if (instance == null) {
                instance = new ConnectionPoolImpl();
                instance.initializeConnectionPool();
            }
        } finally {
            instanceLock.unlock();
        }
        return instance;
    }

    @Override
    public Connection getConnection() throws ConnectionPoolException {
        Connection connection;
        try {
            connection = availableConnections.poll(30, TimeUnit.SECONDS);
        } catch (InterruptedException e) {
            LOGGER.error(MessageFormat.format("Thread was interrupted: {0}", e.getMessage()));
            Thread.currentThread().interrupt();
            throw new ConnectionPoolException(e.getMessage());
        }
        if (connection == null) {
            throw new ConnectionPoolException("Timeout exceeded");
        }
        usedConnections.add(connection);
        return createProxyConnection(connection);
    }

    private Connection createProxyConnection(Connection connection) {
        return (Connection) Proxy.newProxyInstance(connection.getClass().getClassLoader(), new Class[]{Connection.class},
                ((proxy, method, args) -> {
                    if ("close".equals(method.getName())) {
                        releaseConnection(connection);
                        return null;
                    } else {
                        return method.invoke(connection, args);
                    }
                }));
    }

    private void releaseConnection(Connection connection) throws ConnectionPoolException {
        if(usedConnections.contains(connection)){
            try{
                usedConnections.remove(connection);
                availableConnections.put(connection);
            }catch (InterruptedException e) {
                LOGGER.error(e);
                Thread.currentThread().interrupt();
                throw new ConnectionPoolException("Unsuccessful releasing connection");
            }
        }else {
            throw new ConnectionPoolException("Try to close not a pool connection");
        }
    }

    @Override
    public void close() {
        try {
            instanceLock.lock();
            for (Connection connection : availableConnections) {
                connection.close();
            }
            availableConnections.clear();
            for (Connection connection : usedConnections) {
                connection.close();
            }
            usedConnections.clear();
            LOGGER.info("Connection pool was successfully destroyed");
        } catch (SQLException e) {
            LOGGER.error("Connection pool cannot destroy", e);
        } finally {
            instanceLock.unlock();
        }
    }

    private void initializeConnectionPool() {
        Properties properties = new Properties();
        try {
            properties.load(getClass().getResourceAsStream(ApplicationConstants.DB_PROPERTY_RESOURCE_FILE));
            Class.forName(properties.getProperty("driverClassName"));
            initConnectionQueue(properties);
            LOGGER.info("Connection pool was successfully initialized");
        } catch (IOException e) {
            LOGGER.error(e);
            throw new FatalConnectionPoolException("Property file cannot be found", e);
        } catch (ClassNotFoundException e) {
            LOGGER.error(e);
            throw new FatalConnectionPoolException("Driver cannot be found", e);
        }
    }

    private void initConnectionQueue(Properties properties) {
        String userName = properties.getProperty("userLogin");
        String password = properties.getProperty("userPassword");
        String url = properties.getProperty("url");
        String databaseName = properties.getProperty("dataBaseName");
        Integer connectionsCapacity = Integer.parseInt(properties.getProperty("poolSize"));
        if (connectionsCapacity > 0) {
            availableConnections = new ArrayBlockingQueue<>(connectionsCapacity);
            usedConnections = new ArrayBlockingQueue<>(connectionsCapacity);
            for (int i = 0; i < connectionsCapacity; i++) {
                try {
                    Connection connection = DriverManager.getConnection(url + databaseName, userName, password);
                    availableConnections.add(connection);
                } catch (SQLException e) {
                    LOGGER.error(e);
                    throw new FatalConnectionPoolException("Cannot create connection " + e);
                }
            }
        } else {
            throw new FatalConnectionPoolException("Invalid number of connections");
        }

    }


}
