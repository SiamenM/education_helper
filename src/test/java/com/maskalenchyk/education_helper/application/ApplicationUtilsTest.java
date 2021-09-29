package com.maskalenchyk.education_helper.application;

import org.junit.Assert;
import org.junit.Test;

import java.util.Arrays;
import java.util.List;

public class ApplicationUtilsTest {

    @Test
    public void numbersPhoneShouldBeValid() {
        boolean result = ApplicationUtils.isMobilePhone("375257167203");
        Assert.assertTrue(result);
        result = ApplicationUtils.isMobilePhone("+375257167203");
        Assert.assertTrue(result);
        result = ApplicationUtils.isMobilePhone("375337167203");
        Assert.assertTrue(result);
        result = ApplicationUtils.isMobilePhone("375446457203");
        Assert.assertTrue(result);
    }

    @Test
    public void numbersPhoneShouldBeNotValid() {
        boolean result = ApplicationUtils.isMobilePhone("+3752571672");
        Assert.assertFalse(result);
        result = ApplicationUtils.isMobilePhone("");
        Assert.assertFalse(result);
        result = ApplicationUtils.isMobilePhone("123");
        Assert.assertFalse(result);
        result = ApplicationUtils.isMobilePhone("345448567573");
        Assert.assertFalse(result);
    }

    @Test
    public void emailsShouldBeValid() {
        List<String> validEmails = Arrays.asList(
                "alex@yandex.ru",
                "alex-27@yandex.com",
                "alex.27@yandex.com",
                "alex111@rambler.com",
                "alex.100@mail.ru",
                "alex@1.com",
                "alex+27@gmail.com",
                "alex-27@yandex.com");
        for (String validEmail : validEmails) {
            boolean result = ApplicationUtils.isEmailAddress(validEmail);
            Assert.assertTrue(result);
        }
    }

    @Test
    public void emailsShouldBeNotValid() {
        List<String> invalidEmails = Arrays.asList(
                "string",
                "alex@.com.ua",
                "alex123@gmail.a",
                "alex123@.com",
                "alex123@.com.com",
                "alex()*@gmail.com",
                "alex@%*.com",
                "alex..2013@gmail.com",
                "alex.@gmail.com",
                "alex@mail@gmail.com",
                "alex@gmail.com.1ua");
        for (String invalidEmail : invalidEmails) {
            boolean result = ApplicationUtils.isEmailAddress(invalidEmail);
            Assert.assertFalse(result);
        }
    }
}