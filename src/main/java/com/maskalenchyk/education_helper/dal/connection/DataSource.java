package com.maskalenchyk.education_helper.dal.connection;

import java.sql.Connection;

public interface DataSource {

    Connection getConnection() throws ConnectionException;

    void close();
}
