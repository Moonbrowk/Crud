package com.crud.dao;

import com.crud.model.User;

import java.util.List;

///
/**
 * Created by User on 21.05.2017.
 */
public interface UserDao {

    void addUser(User user);
    void updateUser(User user);
    User getUserById(int id);
    void deleteUserById(int id);
    List<User> getUserList();
    List<User> SearchByName(String UserName);

}
