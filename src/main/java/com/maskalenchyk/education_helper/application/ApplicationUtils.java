package com.maskalenchyk.education_helper.application;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class ApplicationUtils {

    private ApplicationUtils() {
    }

    public static boolean isMobilePhone(String phoneNumber) {
        String mobilePhonePattern = "^(\\+?375)(\\d{9})$";
        return match(mobilePhonePattern, phoneNumber);
    }

    public static boolean isEmailAddress(String email) {
        String emailPattern = "^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@" +
                "[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$";
        return match(emailPattern, email);
    }

    private static boolean match(String patternString, String value) {
        Pattern pattern = Pattern.compile(patternString);
        Matcher matcher = pattern.matcher(value);
        return matcher.matches();
    }
}
