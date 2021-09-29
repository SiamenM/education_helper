package com.maskalenchyk.education_helper.dal.connection_pool;

/**
 * Exception which represents that {@link ConnectionPool} cannot work or even been created.
 */
public class FatalConnectionPoolException extends RuntimeException {
    public FatalConnectionPoolException() {
    }

    public FatalConnectionPoolException(String message) {
        super(message);
    }

    public FatalConnectionPoolException(String message, Throwable cause) {
        super(message, cause);
    }

    public FatalConnectionPoolException(Throwable cause) {
        super(cause);
    }

    public FatalConnectionPoolException(String message, Throwable cause, boolean enableSuppression, boolean writableStackTrace) {
        super(message, cause, enableSuppression, writableStackTrace);
    }
}
