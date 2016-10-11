package com.magicshop.services;

import com.magicshop.dao.UserDao;
import com.magicshop.model.User;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.runners.MockitoJUnitRunner;
import java.util.ArrayList;
import java.util.List;

import static org.mockito.Mockito.*;
import static org.junit.Assert.*;

@RunWith(MockitoJUnitRunner.class)
public class UserServiceTest {

    @Mock
    private UserDao userDaoMock;

    @InjectMocks
    private UserService userService;

    @Test
    public void addUser_Should_Create_An_User() {
        User user = new User();
        user.setName("user name");
        user.setEmail("email@c.com");
        user.setPassword("password");

        when(userDaoMock.addUser(user)).thenReturn(true);
        boolean result = userService.addUser(user);
        assertTrue(result);
        verify(userDaoMock).addUser(user);
    }


    @Test
    public void addUser_Should_Not_Create_An_User_Throw_NPE() throws NullPointerException{
        User user = new User();
        when(userDaoMock.addUser(user)).thenReturn(false);
        boolean result = userService.addUser(user);
        assertFalse(result);
        verify(userDaoMock).addUser(user); //throw NPE
    }

    @Test
    public void findById_Should_Return_User() {
        User user = new User();
        when(userDaoMock.findById(1)).thenReturn(user);
        assertEquals(user, userService.findById(1));
        verify(userDaoMock).findById(1);
    }

    @Test
    public void findById_Should_Not_Return_Any_User(){
        when(userDaoMock.findById(-1)).thenReturn(null);
        assertEquals(null, userService.findById(-1));
    }

    @Test
    public void findByEmail_Should_Find_Any_User() {
        String email = "some email";
        User user = new User();
        when(userDaoMock.findByEmail(email)).thenReturn(user);
        assertEquals(user, userService.findByEmail(email));
        verify(userDaoMock).findByEmail(email);
    }

    @Test
    public void findByEmail_Should_Not_Find_Any_User() {
        when(userDaoMock.findByEmail("")).thenReturn(null);
        assertEquals(null, userService.findByEmail(""));
    }

    @Test
    public void disableUser_Should_Be_Past() {
        User user = new User();
        user.setEmail("email@gmail.com");
        when(userDaoMock.disableUser(user.getEmail())).thenReturn(true);
        assertTrue(userService.disableUser(user));
        verify(userDaoMock).disableUser(user.getEmail());
    }

    @Test
    public void disableUser_Should_Not_Past() {
        User user = new User();
        user.setEmail("");
        when(userDaoMock.disableUser(user.getEmail())).thenReturn(false);
        assertFalse(userService.disableUser(user));
    }


    @Test
    public void activateUser_Should_Be_Past() {
        User user = new User();
        user.setEmail("email@gmail.com");
        when(userDaoMock.activateUser(user.getEmail())).thenReturn(true);
        assertTrue(userService.activateUser(user));
        verify(userDaoMock).activateUser(user.getEmail());
    }

    @Test
    public void activateUser_Should_Not_Past() {
        User user = new User();
        user.setEmail("");
        when(userDaoMock.activateUser(user.getEmail())).thenReturn(false);
        assertFalse(userService.activateUser(user));
    }

    @Test
    public void findAllUsers_Should_Return_UserList() {
        List<User> users = new ArrayList<>();
        when(userDaoMock.findAllUsers()).thenReturn(users);
        assertEquals(users, userService.findAllUsers());
        verify(userDaoMock).findAllUsers();
    }

}


