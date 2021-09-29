package com.maskalenchyk.education_helper.dal.dao;

import com.maskalenchyk.education_helper.application.ApplicationContext;
import com.maskalenchyk.education_helper.dal.connection.ConnectionException;
import com.maskalenchyk.education_helper.dal.connection_manager.ConnectionManager;
import com.maskalenchyk.education_helper.entity.Wallet;
import org.junit.After;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class WalletDaoImplTest {

    @Before
    public void createTable() throws SQLException, ConnectionException {
        ApplicationContext.initialize();
        String createTableSQLCommand = "CREATE TABLE wallet2 (" +
                "id_wallet SERIAL PRIMARY KEY," +
                "wallet_amount DECIMAL(10,2) NOT NULL DEFAULT 0);";
        executeSql(createTableSQLCommand);
    }

    @After
    public void dropTable() throws SQLException, ConnectionException {
        String dropTableSQLCommand = "DROP TABLE wallet2";
        executeSql(dropTableSQLCommand);
        ApplicationContext.getInstance().destroy();
    }

    @Test
    public void shouldCreateNewWallet() throws DaoException {
        WalletDao walletDao = ApplicationContext.getInstance().getBean(WalletDao.class);
        Assert.assertNotNull(walletDao);
        Wallet wallet = new Wallet();
        wallet.setAmount(new BigDecimal(1500));
        Wallet wallet1 = walletDao.save(wallet);
        Assert.assertNotNull(wallet1);

    }

    private void executeSql(String sql) throws SQLException, ConnectionException {
        ConnectionManager connectionManager = ApplicationContext.getInstance().getBean(ConnectionManager.class);
        Connection connection = connectionManager.getConnection();
        PreparedStatement statement = connection.prepareStatement(sql);
        statement.executeUpdate();
        statement.close();
        connection.close();

    }


}
