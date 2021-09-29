package com.maskalenchyk.education_helper.dal.transaction_manager;

import java.sql.Connection;

public interface TransactionManager {

    void beginTransaction() throws TransactionManagerException;

    void commitTransaction() throws TransactionManagerException;

    void rollbackTransaction() throws TransactionManagerException;

    Connection getConnection() throws TransactionManagerException;
}
