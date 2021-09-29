package com.maskalenchyk.education_helper.core;

import org.apache.log4j.Logger;

import java.lang.annotation.Annotation;
import java.lang.reflect.*;
import java.util.*;
import java.util.concurrent.ConcurrentHashMap;
import java.util.function.Predicate;
import java.util.function.Supplier;
import java.util.stream.Collectors;

public class BeanRegistryImpl implements BeanRegistry {

    private static final Logger LOGGER = Logger.getLogger(BeanRegistryImpl.class);
    private BeanBuilder beanBuilder = new BeanBuilder();
    private Set<RegistryInfo> registeredBeansInfo = new HashSet<>();

    @Override
    public <T> void registerBean(T bean) {
        RegistryInfo registryInfo = buildRegistryInfo(bean.getClass());
        registryInfo.setBean(bean);
        addRegisteredBeansInfo(registryInfo);
    }

    @Override
    public <T> void registerBean(Class<T> beanClass) {
        RegistryInfo registryInfo = buildRegistryInfo(beanClass);
        final Supplier<Object> builder = createBuilder(registryInfo);
        registryInfo.setBuilder(builder);
        addRegisteredBeansInfo(registryInfo);
    }

    @Override
    public <T> T getBean(String name) {
        Predicate<RegistryInfo> foundBean = registryInfo -> registryInfo.getName().equalsIgnoreCase(name) || registryInfo.getClazz().getSimpleName().equals(name);
        return getBean(foundBean);
    }

    @Override
    public <T> T getBean(Class<T> beanClass) {
        Bean bean = beanClass.getAnnotation(Bean.class);
        String beanName = bean != null && bean.name().trim().length() > 0 ? bean.name().trim() : null;
        Predicate<RegistryInfo> foundBean = registryInfo -> registryInfo.getName().equals(beanName) || registryInfo.getClazz().equals(beanClass) || registryInfo.getInterfaces().contains(beanClass);
        return getBean(foundBean);
    }

    @Override
    public <T> boolean removeBean(T bean) {
        RegistryInfo registryInfo = buildRegistryInfo(bean.getClass());
        return registeredBeansInfo.remove(registryInfo);
    }

    @Override
    public void destroy() {
        beanBuilder.destroy();
        registeredBeansInfo.clear();
    }

    private void addRegisteredBeansInfo(RegistryInfo registryInfo) {
        registeredBeansInfo.stream().filter(registeredBeanInfo -> registeredBeanInfo.getName().equals(registryInfo.getName()))
                .findFirst()
                .ifPresent(registeredBeanInfo -> {
                    throw new ApplicationCoreException("Bean with name " + registryInfo.getName() + " already registered");
                });
        registeredBeansInfo.add(registryInfo);
    }

    private RegistryInfo buildRegistryInfo(Class<?> beanClass) {
        Bean bean = beanClass.getAnnotation(Bean.class);
        if (bean == null) {
            throw new ApplicationCoreException(beanClass.getName() + " doesn't have @Bean annotation");
        }
        RegistryInfo registryInfo = new RegistryInfo();
        registryInfo.setClazz(beanClass);
        Class<?> parentAbstractClass = getAbstractParentClass(beanClass);
        registryInfo.setParentClass(parentAbstractClass);
        Set<Class<?>> interfacesSet = new HashSet<>();
        if (parentAbstractClass != null) {
            Class<?>[] parentAbstractClassInterfaces = parentAbstractClass.getInterfaces();
            Collections.addAll(interfacesSet, parentAbstractClassInterfaces);
        }
        Class<?>[] interfaces = beanClass.getInterfaces();
        Collections.addAll(interfacesSet, interfaces);
        registryInfo.setInterfaces(interfacesSet);
        Annotation[] annotations = beanClass.getAnnotations();
        registryInfo.setAnnotations(Arrays.stream(annotations).collect(Collectors.toSet()));
        Interceptor interceptor = beanClass.getAnnotation(Interceptor.class);
        if (interceptor != null) {
            registryInfo.setInterceptor(interceptor);
        }
        registryInfo.setName(findBeanName(beanClass));
        return registryInfo;
    }

    private Class<?> getAbstractParentClass(Class<?> beanClass) {
        Class<?> parentClass = beanClass.getSuperclass();

        boolean isAbstract = Modifier.isAbstract(parentClass.getModifiers());
        if (isAbstract) {
            Annotation[] parentClassAnnotations = parentClass.getAnnotations();
            Optional<Annotation> abstractSuperclass = Arrays.stream(parentClassAnnotations)
                    .filter(a -> a.annotationType().equals(AbstractSuperclass.class)).findFirst();
            if (abstractSuperclass.isPresent()) {
                return parentClass;
            }
//            else {
//                throw new ApplicationCoreException("Missed annotation  @AbstractSuperclass on abstract class");
//            }
        }
//        else {
//            return null;
//        }
        return null;
    }

    private String findBeanName(Class<?> beanClass) {
        String beanName = beanClass.getAnnotation(Bean.class).name().trim();
        if (beanName.length() > 0) {
            return beanName;
        }
        if (beanClass.getInterfaces().length == 1) {
            return beanClass.getInterfaces()[0].getSimpleName();
        }
//        if (beanClass.getSuperclass() != null) {
//            return beanClass.getSuperclass().getSimpleName();
//        }
        return beanClass.getSimpleName();
    }

    private Supplier<Object> createBuilder(RegistryInfo registryInfo) {
        Class<?> clazz = registryInfo.getClazz();
        Constructor<?>[] constructors = clazz.getDeclaredConstructors();
        if (constructors.length > 1) {
            throw new ApplicationCoreException("Class have more than one constructor");
        }
        return () -> {
            Constructor<?> constructor = constructors[0];
            if (constructor.getParameterCount() > 0) {
                Parameter[] parameters = constructor.getParameters();
                Object[] args = new Object[parameters.length];
                for (int i = 0; i < parameters.length; i++) {
                    Class<?> type = parameters[i].getType();
                    BeanParameter beanParameter = parameters[i].getAnnotation(BeanParameter.class);
                    if (beanParameter != null) {
                        Predicate<RegistryInfo> foundBean = searchInfo -> searchInfo.getName().equals(beanParameter.value());
                        args[i] = getBean(foundBean);
                    } else {
                        args[i] = getBean(type);
                    }
                }
                try {
                    return constructor.newInstance(args);
                } catch (InstantiationException | IllegalAccessException | InvocationTargetException e) {
                    throw new ApplicationCoreException("Initialize bean was failed", e);
                }
            } else {
                try {
                    constructors[0].setAccessible(true);
                    return constructors[0].newInstance();
                } catch (InstantiationException | IllegalAccessException | InvocationTargetException e) {
                    throw new ApplicationCoreException("Initialize bean" + registryInfo.getName() + " was failed", e);
                }
            }
        };
    }

    @SuppressWarnings("unchecked")
    private <T> T getBean(Predicate<RegistryInfo> foundBean) {
        List<RegistryInfo> registryInfoList = registeredBeansInfo
                .stream()
                .filter(foundBean)
                .collect(Collectors.toList());
        if (registryInfoList.size() > 1) {
            String names = registryInfoList
                    .stream()
                    .map(RegistryInfo::getName)
                    .collect(Collectors.joining(", "));
            throw new ApplicationCoreException("Multiple implementations found " + names);
        } else {
            return (T) registryInfoList.stream().map(this::getBeanFromRegistryInfo).findFirst().orElse(null);
        }
    }

    @SuppressWarnings("unchecked")
    private <T> T getBeanFromRegistryInfo(RegistryInfo registryInfo) {
        T service = (T) beanBuilder.getBean(registryInfo);
        Set<RegistryInfo> availableInterceptors = registeredBeansInfo
                .stream()
                .filter(RegistryInfo::isInterceptor)
                .filter(interceptorInfo -> registryInfo.getAnnotations()
                        .stream()
                        .anyMatch(a -> a.annotationType().equals(interceptorInfo.getInterceptor().clazz())))
                .collect(Collectors.toSet());
        if (availableInterceptors.isEmpty()) {
            return service;
        } else {
            List<BeanInterceptor> interceptors = availableInterceptors
                    .stream()
                    .map(interceptorInfo -> (BeanInterceptor) beanBuilder.getBean(interceptorInfo))
                    .collect(Collectors.toList());
            return getServiceProxy(service, registryInfo, interceptors);
        }
    }

    @SuppressWarnings("unchecked")
    private <T> T getServiceProxy(T service, RegistryInfo registryInfo, List<BeanInterceptor> interceptors) {
        Class<?>[] toProxy = new Class[registryInfo.getInterfaces().size()];
        Class<?>[] interfaces = registryInfo.getInterfaces().toArray(toProxy);
        return (T) Proxy.newProxyInstance(this.getClass().getClassLoader(), interfaces, ((proxy, method, args) -> {
            try {
                for (BeanInterceptor interceptor : interceptors) {
                    interceptor.before(proxy, service, method, args);
                }
                Object invoked = method.invoke(service, args);
                for (BeanInterceptor interceptor : interceptors) {
                    interceptor.success(proxy, service, method, args);
                }
                return invoked;
            }catch(InvocationTargetException e){
                throw e.getTargetException();
            }
                        catch (Exception e) {
                for (BeanInterceptor interceptor : interceptors) {
                    interceptor.fail(proxy, service, method, args);
                }
                LOGGER.error( e.getMessage(),e);
                throw new ApplicationCoreException(e.getMessage(),e);

            }

        }));
    }

    private static class RegistryInfo {

        private String name;
        private Class<?> clazz;
        private Class<?> parentClass;
        private Set<Class<?>> interfaces;
        private Set<Annotation> annotations;
        private Interceptor interceptor;
        private Supplier<?> builder;
        private Object bean;

        public String getName() {
            return name;
        }

        public void setName(String name) {
            this.name = name;
        }

        Class<?> getClazz() {
            return clazz;
        }

        void setClazz(Class<?> clazz) {
            this.clazz = clazz;
        }

        Set<Class<?>> getInterfaces() {
//            if (parentClass == null) {
            return interfaces;
//            } else {
//                return Arrays.stream(parentClass.getInterfaces()).collect(Collectors.toSet());
//            }
        }

        void setInterfaces(Set<Class<?>> interfaces) {
            this.interfaces = interfaces;
        }

        Set<Annotation> getAnnotations() {
            return annotations;
        }

        void setAnnotations(Set<Annotation> annotations) {
            this.annotations = annotations;
        }

        Interceptor getInterceptor() {
            return interceptor;
        }

        Supplier getBuilder() {
            return builder;
        }

        void setBuilder(Supplier<?> builder) {
            this.builder = builder;
        }

        Object getBean() {
            return bean;
        }

        void setBean(Object bean) {
            this.bean = bean;
        }

        public Class<?> getParentClass() {
            return parentClass;
        }

        void setParentClass(Class<?> parentClass) {
            this.parentClass = parentClass;
        }

        boolean isInterceptor() {
            return this.interceptor != null;
        }

        void setInterceptor(Interceptor interceptor) {
            this.interceptor = interceptor;
        }

        @Override
        public boolean equals(Object o) {
            if (this == o) return true;
            if (o == null || getClass() != o.getClass()) return false;
            RegistryInfo that = (RegistryInfo) o;
            return Objects.equals(name, that.name) &&
                    Objects.equals(clazz, that.clazz) &&
                    Objects.equals(interfaces, that.interfaces) &&
                    Objects.equals(annotations, that.annotations) &&
                    Objects.equals(interceptor, that.interceptor) &&
                    Objects.equals(builder, that.builder) &&
                    Objects.equals(bean, that.bean);
        }

        @Override
        public int hashCode() {
            return Objects.hash(name, clazz, interfaces, annotations, interceptor, builder, bean);
        }
    }

    private static class BeanBuilder {

        private Map<RegistryInfo, Object> beans = new ConcurrentHashMap<>();

        Object getBean(RegistryInfo registryInfo) {
            if (registryInfo.getBean() != null) {
                beans.put(registryInfo, registryInfo.getBean());
            } else if (!beans.containsKey(registryInfo)) {
                final Object bean = registryInfo.getBuilder().get();
                beans.put(registryInfo, bean);
            }
            return beans.get(registryInfo);
        }

        void destroy() {
            beans.clear();
        }
    }
}