import entity.User;
import org.junit.Test;
import service.UserService;
import service.impl.UserServiceImpl;

import java.util.List;

public class TestUserServiceImpl {
    @Test
    public void allUsersTest(){
        UserService us = new UserServiceImpl();

        List<User> users = us.allUsers();
        for(int i = 0; i < users.size(); i++)
            System.out.println(users.get(i).getId());

    }

}
