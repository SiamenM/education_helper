package com.maskalenchyk.education_helper.command;

public class CommandException extends Exception {
    private final String message;
    private final String header;


    public CommandException(String message) {
        this.message = message;
        this.header = null;
    }

    public CommandException(String header, String message) {
        this.message = message;
        this.header = header;
    }

    @Override
    public String getMessage() {
        return message;
    }

    public String getHeader() {
        return header;
    }
}
