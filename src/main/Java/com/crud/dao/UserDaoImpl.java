package com.crud.dao;

import com.crud.model.User;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;
import java.util.logging.Logger;

/**
 * Created by User on 21.05.2017.
 */
public class UserDaoImpl implements UserDao{

    @Autowired
    SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }



    @Override
    public void addUser(User user) {
        Session session = sessionFactory.getCurrentSession();
        session.save(user);
        Logger.getLogger(user.toString() + "has ben saved");
    }

    @Override
    public void updateUser(User user) {
        Session session = sessionFactory.getCurrentSession();
        session.update(user);
        Logger.getLogger(user.toString() + "has ben updated");
    }

    @Override
    public User getUserById(int id) {
        Session session = sessionFactory.getCurrentSession();
        User user = (User)session.load(User.class, new Integer(id));
        Logger.getLogger(user.toString() + "has ben loaded");
        return user;
    }

    @Override
    public void deleteUserById(int id) {
        Session session = sessionFactory.getCurrentSession();
        User user = (User)session.load(User.class, new Integer(id));
        if (user != null) {
            session.delete(user);
        }
        Logger.getLogger(user.toString() + "has ben removed");
    }

    @Override
    @SuppressWarnings("Unchecked")
    public List<User> getUserList() {
        Session session = sessionFactory.getCurrentSession();
        List<User> list = session.createQuery("from User").list();
        for (User user : list) {
            Logger.getLogger(user.toString() + "has ben loaded to list");
        }

        return list;
    }

    @Override
    @SuppressWarnings("Unchecked")
    public List<User> SearchByName(String userName) {

        if (!userName.isEmpty()) {
            Query query = sessionFactory.getCurrentSession().createQuery("from User u where u.name like :name");
            List<User> list = query.setParameter("name", "%" + userName + "%").list();
            return list;
        }
        return null;
    }
}
