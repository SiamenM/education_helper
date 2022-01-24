package com.maskalenchyk.education_helper.application;

import com.maskalenchyk.education_helper.command.user.SignInCommand;
import com.maskalenchyk.education_helper.command.view.*;
import com.maskalenchyk.education_helper.core.BeanRegistry;
import com.maskalenchyk.education_helper.core.BeanRegistryImpl;
import com.maskalenchyk.education_helper.dal.connection.DataSourceImpl;
import com.maskalenchyk.education_helper.dal.connection_manager.ConnectionManagerImpl;
import com.maskalenchyk.education_helper.dal.connection_pool.ConnectionPool;
import com.maskalenchyk.education_helper.dal.connection_pool.ConnectionPoolImpl;
import com.maskalenchyk.education_helper.dal.dao.UserAccountDaoImpl;
import com.maskalenchyk.education_helper.dal.dao.WalletDaoImpl;
import com.maskalenchyk.education_helper.dal.transaction_manager.TransactionManagerImpl;
import com.maskalenchyk.education_helper.service.EmailServiceImpl;
import com.maskalenchyk.education_helper.service.PasswordServiceImpl;
import com.maskalenchyk.education_helper.service.UserServiceImpl;
import com.maskalenchyk.education_helper.service.WalletServiceImpl;
import org.apache.log4j.Logger;

import java.util.concurrent.locks.Lock;
import java.util.concurrent.locks.ReentrantLock;

public class ApplicationContext implements BeanRegistry {

    private static final Logger LOGGER = Logger.getLogger(ApplicationContext.class);
    private static final Lock LOCK = new ReentrantLock();
    private static ApplicationContext instance;

    private final BeanRegistry beanRegistry = new BeanRegistryImpl();

    private ApplicationContext() {
    }

    public static void initialize() {
        LOCK.lock();
        try {
            if (instance == null) {
                ApplicationContext applicationContext = new ApplicationContext();
                applicationContext.registerDataSource();
                applicationContext.registerClasses();
                instance = applicationContext;
                LOGGER.info("Context initialized successful");
            } else {
                LOGGER.error("Context init error. Context already initialized");
                throw new ApplicationContextException("Context already initialized");
            }
        } finally {
            LOCK.unlock();
        }
    }

    public static ApplicationContext getInstance() {
        if (instance == null) {
            throw new ApplicationContextException("Context wasn't initialized");
        } else {
            return instance;
        }
    }

    public <T> void registerBean(T bean) {
        this.beanRegistry.registerBean(bean);
    }

    public <T> void registerBean(Class<T> beanClass) {
        this.beanRegistry.registerBean(beanClass);
    }

    public <T> T getBean(String name) {
        return this.beanRegistry.getBean(name);
    }

    public <T> T getBean(Class<T> beanClass) {
        return this.beanRegistry.getBean(beanClass);
    }

    public <T> boolean removeBean(T bean) {
        return this.beanRegistry.removeBean(bean);
    }

    public void destroy() {
        ApplicationContext context = getInstance();
        ConnectionPool dataSource = context.getBean(ConnectionPool.class);
        dataSource.close();
        beanRegistry.destroy();
        LOGGER.info("Context destroyed");
    }

    private void registerClasses() {
        registerBean(UserAccountDaoImpl.class);
        registerBean(WalletDaoImpl.class);

        registerBean(EmailServiceImpl.class);
        registerBean(PasswordServiceImpl.class);
        registerBean(WalletServiceImpl.class);
        registerBean(UserServiceImpl.class);

        registerBean(AuthorQuestionPageCommand.class);
        registerBean(AuthorRegistrationPageCommand.class);
        registerBean(ClientInstructionPageCommand.class);
        registerBean(CompleteWorksPageCommand.class);
        registerBean(HomePageCommand.class);
        registerBean(UserCabinetPageCommand.class);
        registerBean(FormTaskPageCommand.class);
        registerBean(ServicePageCommand.class);
        registerBean(AuthorizationPageCommand.class);
        registerBean(GuaranteesPageCommand.class);

        registerBean(SignInCommand.class);
    }

    private void registerDataSource() {
        ConnectionPool connectionPool = ConnectionPoolImpl.getInstance();
        registerBean(connectionPool);
        registerBean(DataSourceImpl.class);
        registerBean(TransactionManagerImpl.class);
        registerBean(ConnectionManagerImpl.class);
    }
}
