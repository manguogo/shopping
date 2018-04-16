package service;

import entity.User;

import java.util.Set;

public interface UserService {
    public void add(User user);
    public Set<User> allUsers();
}
