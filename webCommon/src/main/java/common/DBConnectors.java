package common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnectors {

    private static String url = "jdbc:mysql://localhost:3306/shopping?useUnicode=true&characterEncoding=UTF-8&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
    private static String user = "root";
    private static String password = "000000";

    public static Connection getConnetion(){
        Connection conn = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");//com.mysql.jdbc.Driver
            conn = DriverManager.getConnection(url, user, password);
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("获取链接失败");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            System.out.println("未找到数据库连接类");
        }
        return conn;

    }

}
