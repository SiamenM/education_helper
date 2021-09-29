package com.maskalenchyk.education_helper.service;

import com.maskalenchyk.education_helper.entity.Wallet;
import com.maskalenchyk.education_helper.service.exceptions.ServiceException;

import java.math.BigDecimal;

public interface WalletService {

    Wallet modifyWalletAmount(Wallet wallet, BigDecimal value, boolean isIncrease) throws ServiceException;

    Wallet createNewWallet(BigDecimal startValue);

}
