package com.magicshop.services;

import com.magicshop.dao.UserDao;
import com.magicshop.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class UserService {

    @Autowired
    UserDao userDao;

    public List<User> findAllUsers() {
        return userDao.findAllUsers();
    }

    public User findById(int id) {
        return userDao.findById(id);
    }

    public User findByEmail(String email) {
        return userDao.findByEmail(email);
    }

    public boolean addUser(User user) {
        return userDao.addUser(user);
    }

    public User findByOrder(int orderId) {
        return userDao.findByOrder(orderId);
    }



}
