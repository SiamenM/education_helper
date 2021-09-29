package com.maskalenchyk.education_helper.core;

import java.lang.annotation.*;

@Target(ElementType.TYPE)
@Retention(RetentionPolicy.RUNTIME)
public @interface Interceptor {

    Class<? extends Annotation> clazz();
}
