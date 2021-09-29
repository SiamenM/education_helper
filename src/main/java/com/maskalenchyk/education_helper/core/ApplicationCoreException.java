package com.maskalenchyk.education_helper.core;

public class ApplicationCoreException extends RuntimeException {

    public ApplicationCoreException() {
        super();
    }

    public ApplicationCoreException(String message) {
        super(message);
    }

    public ApplicationCoreException(String message, Throwable cause) {
        super(message, cause);
    }

    public ApplicationCoreException(Throwable cause) {
        super(cause);
    }

    protected ApplicationCoreException(String message, Throwable cause, boolean enableSuppression, boolean writableStackTrace) {
        super(message, cause, enableSuppression, writableStackTrace);
    }
}
