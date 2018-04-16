package dao;

import entity.User;

import java.util.Set;

public interface UserDao {
    public void save(User user);
    public Set<User> selectAllUsers();
    public User selectUser(int id);
}
