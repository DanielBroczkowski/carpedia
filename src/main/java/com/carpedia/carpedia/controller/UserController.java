package com.carpedia.carpedia.controller;

import com.carpedia.carpedia.model.UserModel;
import com.carpedia.carpedia.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
public class UserController {

    @Autowired
    UserRepository user;

    @RequestMapping("/user/save")
    public String process(){
        // save a single User
        user.save(new UserModel("dawbit","psswd","Dawid","Bitner"));
        return "Done";
    }

    @GetMapping("/user")
    public List<UserModel> getAllUsers() {
        return user.findAll();
    }

    @GetMapping("/user/id/{id}")
    public UserModel getUserById(@PathVariable long id) {
        return user.findById(id);
    }



}