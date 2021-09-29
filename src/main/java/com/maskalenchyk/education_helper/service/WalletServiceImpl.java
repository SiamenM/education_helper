package com.maskalenchyk.education_helper.service;

import com.maskalenchyk.education_helper.core.Bean;
import com.maskalenchyk.education_helper.dal.dao.DaoException;
import com.maskalenchyk.education_helper.dal.dao.WalletDao;
import com.maskalenchyk.education_helper.dal.transaction_manager.Transactional;
import com.maskalenchyk.education_helper.entity.Wallet;
import com.maskalenchyk.education_helper.service.exceptions.ServiceException;
import com.maskalenchyk.education_helper.service.exceptions.WalletException;
import org.apache.log4j.Logger;

import java.math.BigDecimal;
import java.text.MessageFormat;

@Bean
public class WalletServiceImpl implements WalletService {

    private static final Logger LOGGER = Logger.getLogger(WalletServiceImpl.class);
    private final WalletDao walletDao;

    public WalletServiceImpl(WalletDao walletDao) {
        this.walletDao = walletDao;
    }

    @Override
    @Transactional
    public Wallet modifyWalletAmount(Wallet wallet, BigDecimal value, boolean isIncrease) throws ServiceException {
        Wallet updatedWallet = isIncrease ? increaseAmount(wallet, value) : decreaseAmount(wallet, value);
        try {
            walletDao.update(updatedWallet);
            return updatedWallet;
        } catch (DaoException e) {
            LOGGER.error(MessageFormat.format("Update amount exception database exception: {0}", e.getMessage()));
            throw new ServiceException(e.getMessage(), e);
        }
    }

    @Override
    public Wallet createNewWallet(BigDecimal startValue) {
        Wallet wallet = new Wallet();
        wallet.setAmount(startValue);
        return wallet;
    }

    private Wallet increaseAmount(Wallet wallet, BigDecimal value) {
        BigDecimal walletAmount = wallet.getAmount();
        BigDecimal updatedWalletAmount = walletAmount.add(value);
        wallet.setAmount(updatedWalletAmount);
        return wallet;
    }

    private Wallet decreaseAmount(Wallet wallet, BigDecimal value) throws WalletException {
        BigDecimal walletAmount = wallet.getAmount();
        if (walletAmount.compareTo(value) >= 0) {
            BigDecimal updatedWalletAmount = walletAmount.subtract(value);
            wallet.setAmount(updatedWalletAmount);
            return wallet;
        } else {
            throw new WalletException("Not enough money");
        }
    }
}
