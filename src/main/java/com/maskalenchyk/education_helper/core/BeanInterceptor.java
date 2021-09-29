package com.maskalenchyk.education_helper.core;

import com.maskalenchyk.education_helper.dal.transaction_manager.TransactionManagerException;

import java.lang.reflect.Method;

public interface BeanInterceptor {

    void before(Object proxy, Object service, Method method, Object[] args) throws TransactionManagerException;

    void success(Object proxy, Object service, Method method, Object[] args) throws TransactionManagerException;

    void fail(Object proxy, Object service, Method method, Object[] args) throws TransactionManagerException;
}
