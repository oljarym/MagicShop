package com.magicshop.dao;

import com.magicshop.model.User;

import java.util.List;

public interface UserDao {

    List<User> findAllUsers();

    User findById(int id);

    User findByEmail(String email);

    boolean addUser(User user);

    boolean disableUser(String email);

    User findByOrder(int orderId);

    boolean updateUser(User user);

}
