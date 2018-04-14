package dao.implTest;

import dao.UserDao;
import dao.impl.UserDaoImpl;
import entity.User;
import org.junit.jupiter.api.Test;


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

}
