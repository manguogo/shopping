package service;

import entity.User;

import java.sql.Timestamp;
import java.util.List;
import java.util.Set;

public interface UserService {
    public void add(User user);
    public List<User> allUsers();
    public User getUser(int id);
    public void changeUser(User user);
    public void remove(Integer id);

    public User userIsExist(User user);
}
