package service.impl;

import dao.UserDao;
import dao.impl.UserDaoImpl;
import entity.User;
import service.UserService;

import java.util.Set;

public class UserServiceImpl implements UserService {
    UserDao ud = new UserDaoImpl();
    public void add(User user) {
        ud.save(user);
    }

    public Set<User> allUsers() {
        return ud.selectAllUsers();
    }

    public User getUser(int id) {
        return ud.selectUser(id);
    }
}
