package com.maskalenchyk.education_helper.dal.connection_manager;

import com.maskalenchyk.education_helper.dal.connection.ConnectionException;

import java.sql.Connection;

public interface ConnectionManager {
    Connection getConnection() throws ConnectionException;
}
