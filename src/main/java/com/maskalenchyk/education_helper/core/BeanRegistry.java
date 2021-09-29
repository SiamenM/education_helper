package com.maskalenchyk.education_helper.core;

public interface BeanRegistry {

    <T> void registerBean(T bean);

    <T> void registerBean(Class<T> beanClass);

    <T> T getBean(String name);

    <T> T getBean(Class<T> beanClass);

    <T> boolean removeBean(T bean);

    void destroy();
}
