package com.maskalenchyk.education_helper.service;

import com.maskalenchyk.education_helper.application.ApplicationConstants;
import com.maskalenchyk.education_helper.core.Bean;
import com.maskalenchyk.education_helper.service.exceptions.ServiceException;
import org.apache.log4j.Logger;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.io.IOException;
import java.text.MessageFormat;
import java.util.Properties;

@Bean
public class EmailServiceImpl implements EmailService {

    private static final String REGISTRATION_SUBJECT = "Hello new User";
    private static final String REGISTRATION_MESSAGE =
            "Welcome to education-helper service\n" +
                    "Your login = ? \n" +
                    "Your password: ? \n" +
                    "Detail about your request you can see in your private cabinet.";
    private static final Logger LOGGER = Logger.getLogger(EmailServiceImpl.class);
    private boolean isInitialized = false;
    private Session session;
    private String hostMail;


    @Override
    public void sendRegistrationEmail(String recipient, String recipientPassword) throws ServiceException {
        if (!isInitialized) {
            initialize();
        }
        Message message = prepareRegistrationMessage(session, recipient, recipientPassword);
        try {
            Transport.send(message);
        } catch (MessagingException e) {
            LOGGER.error(MessageFormat.format("Mail sending failed.{0}", e.getMessage()));
            throw new ServiceException(e.getMessage(), e);
        }
    }

    private Message prepareRegistrationMessage(Session session, String recipient, String recipientPassword) throws ServiceException {
        try {
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(this.hostMail));
            message.setRecipient(Message.RecipientType.TO, new InternetAddress(recipient));
            message.setSubject(REGISTRATION_SUBJECT);
            message.setText(MessageFormat.format(REGISTRATION_MESSAGE, recipient, recipientPassword));
            return message;
        } catch (MessagingException e) {
            LOGGER.error(MessageFormat.format("Mail message generating failed.{0}", e.getMessage()));
            throw new ServiceException(e.getMessage(), e);
        }
    }

    private void initialize() throws ServiceException {
        Properties properties = new Properties();
        try {
            properties.load(getClass().getResourceAsStream(ApplicationConstants.EMAIL_SERVICE_RESOURCE_FILE));
        } catch (IOException e) {
            LOGGER.error(MessageFormat.format("Mail service resource file loading failed.{0}", e.getMessage()));
            throw new ServiceException(e.getMessage(), e);
        }
        this.hostMail = properties.getProperty("mail.address");
        String password = properties.getProperty("mail.password");
        this.session = Session.getInstance(properties, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(hostMail, password);
            }
        });
        isInitialized = true;
    }
}
