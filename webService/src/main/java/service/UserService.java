package service;

import entity.User;

import java.sql.Timestamp;
import java.util.Set;

public interface UserService {
    public void add(User user);
    public Set<User> allUsers();
    public User getUser(int id);
    public void changeUser(User user);
}
