package service.impl;

import dao.UserDao;
import dao.impl.UserDaoImpl;
import entity.User;
import service.UserService;

import java.util.Set;

public class UserServiceImpl implements UserService {

    public void add(User user) {
        UserDao ud = new UserDaoImpl();
        ud.save(user);
    }

    public Set<User> allUsers() {
        UserDao ud = new UserDaoImpl();
        return ud.selectAllUsers();
    }
}
