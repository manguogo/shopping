package dao.implTest;

import dao.UserDao;
import dao.impl.UserDaoImpl;
import entity.User;
import org.junit.Assert;
import org.junit.Test;

import java.util.Iterator;
import java.util.Set;


public class UserDaoImplTest {

    @Test
    public void saveTest() {
        UserDao ud = new UserDaoImpl();
        User user = new User();

        user.setUserName("tom");
        user.setPassword("123456");
        user.setPhone("12345678901");
        user.setAddr("西雅图");

        ud.save(user);


    }

    @Test
    public void selectAllUsersTest(){
        UserDao ud = new UserDaoImpl();
        Set<User> users = ud.selectAllUsers();

        Iterator<User> userIter = users.iterator();
        while (userIter.hasNext()){
            User user = userIter.next();
            System.out.println(user.getUserName());
        }
    }

    @Test
    public void selectUserTest(){
        UserDao ud = new UserDaoImpl();
        User user = ud.selectUser(1);
        Assert.assertEquals("tom", user.getUserName());
    }

    @Test
    public  void updateUserTest(){
        UserDao ud = new UserDaoImpl();
        User user = new User();
        user.setId(5);
        user.setUserName("测试5");
        user.setPhone("000000");
        ud.updateUser(user);
    }

    @Test
    public void deleteUserTest(){
        UserDao ud = new UserDaoImpl();

        Assert.assertEquals(1, ud.deleteUser(6));


    }

}














