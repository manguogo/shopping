import entity.User;
import org.junit.Test;
import service.UserService;
import service.impl.UserServiceImpl;

public class TestUserServiceImpl {
    @Test
    public void allUsersTest(){
        UserService us = new UserServiceImpl();

        User[] users = us.allUsers();
        for(int i = 0; i < users.length; i++)
            System.out.println(users[i].getId());

    }

}
