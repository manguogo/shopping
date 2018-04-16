package dao.impl;

import dao.UserDao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashSet;
import java.util.Set;

import common.*;
import entity.User;

public class UserDaoImpl implements UserDao{

    public void save(User user) {
        String sql = "insert into user VALUES (null, ?, ?, ?, ?, now())";
        Connection conn = null;
        PreparedStatement pst = null;

        conn = DBConnectors.getConnetion();
        try {
            pst = conn.prepareStatement(sql);
            pst.setString(1, user.getUserName());
            pst.setString(2, user.getPassword());
            pst.setString(3, user.getPhone());
            pst.setString(4, user.getAddr());
           // pst.setTimestamp(5, user.getDateTime());
            pst.execute();
        } catch (SQLException e) {
            e.printStackTrace();
        }


    }

    public Set<User> selectAllUsers() {
        String sql = "select * from user";
        Connection conn = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        Set<User> users = new HashSet<User>();

        conn = DBConnectors.getConnetion();
        try {
            pst = conn.prepareStatement(sql);
            rs = pst.executeQuery();
            while (rs.next()){
//                System.out.println(rs.getString("username"));
                users.add(new User(
                        rs.getInt("id"),
                        rs.getString("username"),
                        rs.getString("phone"),
                        rs.getString("addr"),
                        rs.getTimestamp("rdate")
                ));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            DBConnectors.close(conn, pst, rs);
        }

        return users;
    }

    public User selectUser(int id) {
        User user = null;
        Connection conn = null;
        ResultSet rs = null;
        PreparedStatement pst = null;
        conn = DBConnectors.getConnetion();
        String sql = "select * from user where id = ?";
        try {
            pst = conn.prepareStatement(sql);
            pst.setInt(1, id);
            rs = pst.executeQuery();
            rs.next();
            user = new User(rs.getInt("id"),
                            rs.getString("username"),
                            rs.getString("phone"),
                            rs.getString("addr"),
                            rs.getTimestamp("rdate"));

        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            DBConnectors.close(conn, pst, rs);
        }

        return user;

    }
}
