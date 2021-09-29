package com.maskalenchyk.education_helper.service;

import com.maskalenchyk.education_helper.core.Bean;
import com.maskalenchyk.education_helper.service.exceptions.ServiceException;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.Random;

@Bean
public class PasswordServiceImpl implements PasswordService {

    private static final String ALGORITHM = "MD5";
    private static final String CHAR_LOWER = "abcdefghijklmnopqrstuvwxyz";
    private static final String CHAR_UPPER = CHAR_LOWER.toUpperCase();
    private static final String NUMBER = "0123456789";
    private static final String OTHER_CHAR = "!@#$;:";
    private static final Integer MIN_PASSWORD_LENGTH = 7;

    private Random random = new SecureRandom();

    @Override
    public String generateRandomPassword(Integer length) throws ServiceException {
        if (length < MIN_PASSWORD_LENGTH) {
            throw new ServiceException("Incorrect password length entered:" + length);
        }
        String allowChars = CHAR_LOWER + CHAR_UPPER + NUMBER + OTHER_CHAR;
        String shuffledAllowChars = shuffleString(allowChars);
        StringBuilder stringBuilder = new StringBuilder();
        for (int i = 0; i < length; i++) {
            int randomCharPosition = random.nextInt(shuffledAllowChars.length());
            char randomChar = shuffledAllowChars.charAt(randomCharPosition);
            stringBuilder.append(randomChar);
        }
        return stringBuilder.toString();
    }


    @Override
    public String getPasswordHash(String password) throws ServiceException {
        try {
            MessageDigest messageDigest = MessageDigest.getInstance(ALGORITHM);
            messageDigest.update(password.getBytes());
            byte[] digest = messageDigest.digest();
            return new String(digest);
        } catch (NoSuchAlgorithmException e) {
            throw new ServiceException("Cryptographic algorithm is not available in the environment", e);
        }
    }

    private String shuffleString(String chars) {
        List<String> charList = Arrays.asList(chars.split(""));
        Collections.shuffle(charList);
        return String.join("", charList);
    }

}
