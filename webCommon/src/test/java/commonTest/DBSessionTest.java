package commonTest;

import common.DBConnectors;
import org.junit.Test;


public class DBSessionTest {
    @Test
    public void getConnector(){

        System.out.println(DBConnectors.getConnetion());

    }

}
