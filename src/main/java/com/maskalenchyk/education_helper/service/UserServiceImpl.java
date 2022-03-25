package com.maskalenchyk.education_helper.service;

import com.maskalenchyk.education_helper.application.ApplicationUtils;
import com.maskalenchyk.education_helper.core.Bean;
import com.maskalenchyk.education_helper.dal.dao.DaoException;
import com.maskalenchyk.education_helper.dal.dao.UserAccountDao;
import com.maskalenchyk.education_helper.entity.UserAccount;
import com.maskalenchyk.education_helper.entity.UserRole;
import com.maskalenchyk.education_helper.entity.Wallet;
import com.maskalenchyk.education_helper.service.exceptions.ServiceException;
import com.maskalenchyk.education_helper.service.exceptions.UserServiceException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.math.BigDecimal;
import java.text.MessageFormat;
import java.time.Instant;
import java.util.List;

@Bean
public class UserServiceImpl implements UserService {

    private static final Logger LOGGER = LoggerFactory.getLogger(UserServiceImpl.class);
    private final UserAccountDao userAccountDao;
    private final PasswordService passwordService;
    private final EmailService emailService;
    private final WalletService walletService;

    public UserServiceImpl(UserAccountDao userAccountDao, PasswordService passwordService, EmailService emailService,
                           WalletService walletService) {
        this.userAccountDao = userAccountDao;
        this.passwordService = passwordService;
        this.emailService = emailService;
        this.walletService = walletService;
    }

    @Override
    public UserAccount getById(Long id) throws ServiceException {
        try {
            return userAccountDao.findById(id);
        } catch (DaoException e) {
            LOGGER.error(MessageFormat.format("User getting exception: {}", e.getMessage()));
            throw new ServiceException(e.getMessage(), e);
        }
    }

    @Override
    public UserAccount getByLogin(String login) throws ServiceException {
        try {
            if (ApplicationUtils.isMobilePhone(login)) {
                return userAccountDao.findByPhone(login);
            } else if (ApplicationUtils.isEmailAddress(login)) {
                return userAccountDao.findByEmail(login);
            } else {
                return null;
            }
        } catch (DaoException e) {
            LOGGER.error(MessageFormat.format("User finding by login exception: {}", e.getMessage()));
            throw new ServiceException(e.getMessage(), e);
        }
    }

    @Override
    public UserAccount signIn(String login, String password) throws ServiceException {
        UserAccount userAccount = getByLogin(login);
        if (userAccount != null) {
            String passwordHash = passwordService.getPasswordHash(password);
            if (userAccount.getPassword().equals(passwordHash)) {
                return userAccount;
            } else {
                return null;
            }
        }
        return null;
    }

    @Override
    //@Transactional
    public UserAccount createUserAccount(String email, String phoneNumber, String name, List<UserRole> userRoles, String additionalInformation)
            throws ServiceException {
        try {
            if (getByLogin(email) != null) {
                String errorMessage = "User with " + email + " already exists";
                LOGGER.debug(errorMessage);
                throw new UserServiceException(errorMessage, UserServiceException.EMAIL_ALREADY_EXISTS);
            }
            if (getByLogin(phoneNumber) != null) {
                String errorMessage = "User with " + phoneNumber + " already exists";
                LOGGER.debug(errorMessage);
                throw new UserServiceException(errorMessage, UserServiceException.PHONE_NUMBER_ALREADY_EXISTS);
            }
            String password = passwordService.generateRandomPassword(8);
            String digestPassword = passwordService.getPasswordHash(password);
            UserAccount userAccount = new UserAccount();
            userAccount.setEmail(email);
            userAccount.setPhone(phoneNumber);
            userAccount.setName(name);
            userAccount.setPassword(digestPassword);
            userAccount.setUserRoles(userRoles);
            userAccount.setAvailable(true);
            userAccount.setRegistrationDate(Instant.now().toEpochMilli());
            userAccount.setAdditionalInformation(additionalInformation);
            Wallet walletNewUser = walletService.createNewWallet(new BigDecimal(0));
            userAccount.setWallet(walletNewUser);
            emailService.sendRegistrationEmail(email, password);
            return userAccountDao.save(userAccount);
        } catch (DaoException e) {
            String errorMessage = "New user creating exception";
            LOGGER.error(errorMessage, e);
            throw new ServiceException(errorMessage, e);
        }
    }

    @Override
    public List<UserAccount> findAll() throws ServiceException {
        try {
            return userAccountDao.findAll();
        } catch (DaoException e) {
            LOGGER.error(MessageFormat.format("User list finding exception: {}", e.getMessage()));
            throw new ServiceException(e.getMessage(), e);
        }
    }

    @Override
    public void deleteById(Long id) throws ServiceException {
        UserAccount userAccount = getById(id);
        if (userAccount != null) {
            try {
                userAccountDao.delete(userAccount);
            } catch (DaoException e) {
                LOGGER.error(MessageFormat.format("User deleting exception: {}", e.getMessage()));
                throw new ServiceException(e.getMessage(), e);
            }
        } else {
            String errorMessage = "User with id " + id + " does't exist";
            LOGGER.error(errorMessage);
            throw new UserServiceException(errorMessage, UserServiceException.USER_NOT_EXIST);
        }
    }

    @Override
    public void addRoleForUser(Long id, UserRole role) throws ServiceException {
        String roleName = role.name().toLowerCase();
        try {
            userAccountDao.assignNewRole(id, roleName);
        } catch (DaoException e) {
            LOGGER.error(MessageFormat.format("Role adding exception: {}", e.getMessage()));
            throw new ServiceException(e.getMessage(), e);
        }
    }

    @Override
    public void deleteRoleForUser(Long id, UserRole role) throws ServiceException {
        String roleName = role.name().toLowerCase();
        try {
            userAccountDao.deleteUserRole(id, roleName);
        } catch (DaoException e) {
            LOGGER.error(MessageFormat.format("Role deleting exception: {}", e.getMessage()));
            throw new ServiceException(e.getMessage(), e);
        }
    }

    @Override
    public void updateUserAccount(UserAccount userAccount) throws ServiceException {
        try {
            UserAccount userAccountFromDb = userAccountDao.findById(userAccount.getId());
            if (userAccountFromDb != null) {
                userAccountDao.update(userAccount);
            } else {
                String errorMessage = "User doesn't exist.";
                LOGGER.debug(errorMessage);
                throw new UserServiceException(errorMessage, UserServiceException.USER_NOT_EXIST);
            }
        } catch (DaoException e) {
            LOGGER.error(MessageFormat.format("User updating exception: {}", e.getMessage()));
            throw new ServiceException(e.getMessage(), e);
        }

    }

    @Override
    public void updateUserPassword(UserAccount userAccount, String oldPassword, String newPassword) throws ServiceException {
        if (userAccount.getPassword().equals(passwordService.getPasswordHash(oldPassword))) {
            try {
                String newPasswordHash = passwordService.getPasswordHash(newPassword);
                userAccount.setPassword(newPasswordHash);
                userAccountDao.update(userAccount);
            } catch (DaoException e) {
                LOGGER.error(MessageFormat.format("Password changing exception: {}", e.getMessage()));
                throw new ServiceException(e.getMessage(), e);
            }
        } else {
            String errorMessage = "Invalid password.";
            throw new UserServiceException(errorMessage, UserServiceException.INCORRECT_PASSWORD);
        }
    }

}
