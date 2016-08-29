package com.magicshop.services;
//

import com.magicshop.dao.UserDao;
import com.magicshop.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Transactional
@Service
public class UserService {

    private final UserDao userDao;

    @Autowired
    public UserService(UserDao userDao) {
        this.userDao = userDao;
    }

    @Transactional(readOnly = true)
    public List<User> findAllUsers() {
        return userDao.findAllUsers();
    }
    
    @Transactional(readOnly = true)
    public User findById(int id) {
        return userDao.findById(id);
    }
    
    @Transactional(readOnly = true)
    public User findByEmail(String email) {
        return userDao.findByEmail(email);
    }
    
    public boolean addUser(User user) {
        return userDao.addUser(user);
    }  
    
    public boolean disableUser(User user) {
        return userDao.disableUser(user.getEmail());
    }

    public boolean activateUser(User user) {
        return userDao.activateUser(user.getEmail());
    }



}
