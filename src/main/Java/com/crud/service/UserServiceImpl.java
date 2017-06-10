package com.crud.service;

import com.crud.dao.UserDao;
import com.crud.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.List;

/**
 * Created by User on 26.05.2017.
 */
@Service
public class UserServiceImpl implements UserService{




    private UserDao userDao;
    @Autowired
    public void setUserDao(UserDao userDao) {
        this.userDao = userDao;
    }

    @Override
    @Transactional
    public void addUser(User user) {
        userDao.addUser(user);
    }

    @Override
    @Transactional
    public void updateUser(User user) {
        userDao.updateUser(user);
    }

    @Override
    @Transactional
    public User getUserById(int id) {
        User user = userDao.getUserById(id);
        return user;

    }

    @Override
    @Transactional
    public void deleteUserById(int id) {
        userDao.deleteUserById(id);
    }

    @Override
    @Transactional
    public List<User> getUserList() {
        List<User> list = userDao.getUserList();
        return list;

    }

    @Override
    @Transactional
    public List<User> searchByName(String userName) {
        List<User> list = userDao.SearchByName(userName);
        return list;
    }


}
