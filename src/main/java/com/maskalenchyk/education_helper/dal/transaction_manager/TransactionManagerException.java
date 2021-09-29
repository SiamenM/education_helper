package com.maskalenchyk.education_helper.dal.transaction_manager;

public class TransactionManagerException extends Exception {

    public TransactionManagerException() {
    }

    public TransactionManagerException(String message) {
        super(message);
    }

    public TransactionManagerException(String message, Throwable cause) {
        super(message, cause);
    }

    public TransactionManagerException(Throwable cause) {
        super(cause);
    }

    public TransactionManagerException(String message, Throwable cause, boolean enableSuppression, boolean writableStackTrace) {
        super(message, cause, enableSuppression, writableStackTrace);
    }
}
