package service.impl;

import common.Util;
import dao.UserDao;
import dao.impl.UserDaoImpl;
import entity.User;
import service.UserService;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

public class UserServiceImpl implements UserService {
    UserDao ud = new UserDaoImpl();
    public void add(User user) {
        ud.save(user);
    }

    public List<User> allUsers() {
        Set<User> userSet = ud.selectAllUsers();
        List<User> users = new ArrayList<User>();
        Iterator<User> userSetIterator = userSet.iterator();
        User user = null;
        for(int i = 0; i < userSet.size() && userSetIterator.hasNext(); i++){
            user = userSetIterator.next();
            users.add(user);
        }
        userSet = null;
        for(int i = 0; i < users.size() - 1; i++){
            for(int j = users.size() - 1; i < j; j--){
                if(users.get(i).getId() > users.get(j).getId() ){
                    User userTmp = null;
                    userTmp = users.get(i);
                    users.set(i, users.get(j));
                    users.set(j, userTmp);
                }
            }
        }

      /*  List<User> userList = new ArrayList<User>();
        Iterator<User> userIterator = userSet.iterator();
        while(userIterator.hasNext()){
            userList.add(userIterator.next());
        }*/

        return users;
    }

    public User getUser(int id) {
        return ud.selectUser(id);
    }

    public void changeUser(User user) {
        ud.updateUser(user);
    }

    public void remove(Integer id) {
        ud.deleteUser(id);
    }

    public User userIsExist(User user) {
        return ud.userIsExist(user);
    }


}
