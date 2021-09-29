package com.maskalenchyk.education_helper.service.exceptions;

public class UserServiceException extends ServiceException {

    public static final int INCORRECT_PASSWORD = 1;
    public static final int USER_NOT_EXIST = 2;
    public static final int PHONE_NUMBER_ALREADY_EXISTS = 3;
    public static final int EMAIL_ALREADY_EXISTS = 4;
    public static final int WRONG_INPUT = 5;

    private int errorCode;

    public UserServiceException(int errorCode) {
        errorCode = errorCode;
    }

    public UserServiceException(String message, int errorCode) {
        super(message);
        this.errorCode = errorCode;
    }

    public UserServiceException(String message, Throwable cause, int errorCode) {
        super(message, cause);
        this.errorCode = errorCode;
    }

    public UserServiceException(Throwable cause, int errorCode) {
        super(cause);
        this.errorCode = errorCode;
    }

    public UserServiceException(String message, Throwable cause, boolean enableSuppression, boolean writableStackTrace, int errorCode) {
        super(message, cause, enableSuppression, writableStackTrace);
        this.errorCode = errorCode;
    }

    public int getErrorCode() {
        return errorCode;
    }
}
