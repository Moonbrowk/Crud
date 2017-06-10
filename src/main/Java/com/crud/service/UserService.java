package com.crud.service;

import com.crud.model.User;

import java.util.List;

/**
 * Created by User on 26.05.2017.
 */
public interface UserService {

    void addUser(User user);
    void updateUser(User user);
    User getUserById(int id);
    void deleteUserById(int id);
    List<User> getUserList();
    List<User> searchByName(String userName);




}
