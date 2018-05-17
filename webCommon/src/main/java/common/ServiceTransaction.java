package common;

import common.DBConnectors;

import java.sql.Connection;
import java.sql.SQLException;

public class ServiceTransaction {
    private static ThreadLocal<Connection> tl;
    static {
        tl = new ThreadLocal<Connection>();
        tl.set(DBConnectors.getConnetion());
    }

    private ServiceTransaction() {}

    public static Connection getConnection(){
        Connection conn = tl.get();
        if (conn == null) {
            tl.set(DBConnectors.getConnetion());
            conn = tl.get();
        }
        return conn;
    }
    public static void beginTransaction(){
        Connection conn = getConnection();
        try {
            conn.setAutoCommit(false);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    public static void commit(){
        Connection conn = getConnection();
        try {
            conn.commit();
            conn.setAutoCommit(true);
        } catch (SQLException e) {
            rollback();
            e.printStackTrace();
        }
    }

    public static void rollback() {
        Connection conn = getConnection();

        try {
            conn.rollback();
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }

    public static void close(){
        Connection conn = getConnection();
        try {
            conn.close();
            if(!conn.getAutoCommit()){
                conn.setAutoCommit(true);
            }
        } catch (SQLException e) {
            rollback();
            e.printStackTrace();
        }finally {
            tl.remove();
        }
    }


}
