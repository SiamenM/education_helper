package com.maskalenchyk.education_helper.core;

import com.maskalenchyk.education_helper.dal.transaction_manager.TransactionManager;
import com.maskalenchyk.education_helper.dal.transaction_manager.TransactionManagerException;
import com.maskalenchyk.education_helper.dal.transaction_manager.TransactionSupport;
import com.maskalenchyk.education_helper.dal.transaction_manager.Transactional;

import java.lang.reflect.Method;
import java.util.Arrays;

@Bean
@Interceptor(clazz = TransactionSupport.class)
public class TransactionInterceptor implements BeanInterceptor {

    private TransactionManager transactionManager;

    public TransactionInterceptor(TransactionManager transactionManager) {
        this.transactionManager = transactionManager;
    }

    @Override
    public void before(Object proxy, Object service, Method method, Object[] args) throws TransactionManagerException {
        if (isMethodTransactional(service, method)) {
            transactionManager.beginTransaction();
        }
    }

    @Override
    public void success(Object proxy, Object service, Method method, Object[] args) throws TransactionManagerException {
        if (isMethodTransactional(service, method)) {
            transactionManager.commitTransaction();
        }
    }

    @Override
    public void fail(Object proxy, Object service, Method method, Object[] args) throws TransactionManagerException {
        if (isMethodTransactional(service, method)) {
            transactionManager.rollbackTransaction();
        }
    }

    private boolean isMethodTransactional(Object service, Method method) {
        boolean isMethodTransactional = method.getAnnotation(Transactional.class) != null;
        if (!isMethodTransactional) {
            isMethodTransactional = Arrays.stream(service.getClass().getDeclaredMethods())
                    .filter(serviceMethod -> serviceMethod.getName().equals(method.getName()))
                    .anyMatch(serviceMethod -> serviceMethod.getAnnotation(Transactional.class) != null);
        }
        return isMethodTransactional;
    }
}
