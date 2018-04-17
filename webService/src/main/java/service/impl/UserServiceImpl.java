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

    public User[] allUsers() {
        Set<User> userSet = ud.selectAllUsers();
        Object[] objects =  userSet.toArray();
        User[] users = new User[objects.length];
        for(int i = 0; i < objects.length; i++){
            users[i] = (User) objects[i];
        }

        for(int i = 0; i < users.length - 1; i++){
            for(int j = users.length - 1; i < j; j--){
                if(users[i].getId() > users[j].getId() ){
                    User userTmp = null;
                    userTmp = users[i];
                    users[i] =  users[j];
                    users[j] = userTmp;
//                   Util.swap(users[i], users[j]);
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
}
