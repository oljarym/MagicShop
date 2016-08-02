package com.magicshop.controllers;

import com.magicshop.model.User;
import com.magicshop.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RequestMapping(value = "/users/")
@RestController
public class UsersRestController {

    @Autowired
    private UserService userService;

    @RequestMapping(method = RequestMethod.GET)
    public ResponseEntity<List<User>> listOfAllUsers() {
        List<User> allUsers = userService.findAllUsers();
        if (allUsers.isEmpty()) {
            return new ResponseEntity<>(HttpStatus.NO_CONTENT);
        }
        return new ResponseEntity<>(allUsers, HttpStatus.OK);
    }

    @RequestMapping(value = "{idUser}", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<User> getUser(@PathVariable int idUser) {
        User user = userService.findById(idUser);
        if (user == null) {
            return new ResponseEntity<>(HttpStatus.NO_CONTENT);
        }
        return new ResponseEntity<>(user, HttpStatus.OK);
    }

    @RequestMapping( method = RequestMethod.POST)
    public ResponseEntity<Void> createUser(@RequestBody User user) {
        User user1 = userService.findByEmail(user.getEmail());
        if (user1 == null) {
            userService.addUser(user);
            return new ResponseEntity<>(HttpStatus.CREATED);
        } else {
            return new ResponseEntity<>(HttpStatus.NOT_ACCEPTABLE);
        }
    }







}
