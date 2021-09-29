package com.maskalenchyk.education_helper.service;

import com.maskalenchyk.education_helper.application.ApplicationContext;
import com.maskalenchyk.education_helper.dal.connection.ConnectionException;
import com.maskalenchyk.education_helper.dal.dao.UserAccountDao;
import com.maskalenchyk.education_helper.entity.UserAccount;
import com.maskalenchyk.education_helper.service.exceptions.ServiceException;
import org.junit.After;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;

import java.sql.SQLException;

import static org.mockito.Mockito.mock;

public class UserServiceImplTest {

    private UserService userService;
    private PasswordService passwordService;
    private UserAccountDao userAccountDao;
    private EmailService emailService;


    @Before
    public void createTable() {
        ApplicationContext.initialize();
        userService = ApplicationContext.getInstance().getBean(UserService.class);
        passwordService = ApplicationContext.getInstance().getBean(PasswordService.class);
        userAccountDao = ApplicationContext.getInstance().getBean(UserAccountDao.class);
        //HERE?
        emailService = mock(EmailServiceImpl.class);
    }

    @After
    public void dropTable() {
        ApplicationContext.getInstance().destroy();
    }

    @Test
    public void shouldCreateUser() throws ServiceException {
        String name = " test1";
        String phoneNumber = "+375257167345";
        String email = "test1@mail.ru";


        UserAccount userFromProgram = new UserAccount();
        userFromProgram.setName(name);
        userFromProgram.setPhone("+375257167345");
        userFromProgram.setEmail("test1@mail.ru");

//        UserAccount createdUserFromDb = userService.createUserAccount(email,phoneNumber,name);
//        Assert.assertNotNull(createdUserFromDb);
//        Assert.assertEquals(name,createdUserFromDb.getName());
//        Assert.assertEquals(phoneNumber,createdUserFromDb.getPhone());
//        Assert.assertEquals(email,createdUserFromDb.getEmail());


    }

}