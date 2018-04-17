package dao.impl;

import dao.UserDao;

import java.sql.*;
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
        }finally {
            DBConnectors.close(conn, pst, null);
        }


    }

    public Set<User> selectAllUsers() {
        String sql = "select * from user ORDER by id ASC ";
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

    public void updateUser(User user) {
        String sql = "update user set username = " + "'" + user.getUserName() + "'";
        String password = user.getPassword();
        String phone = user.getPhone();
        String addr = user.getAddr();
        Connection conn = null;
        PreparedStatement pst = null;

        conn = DBConnectors.getConnetion();

        if(password != "" && password != null)
            sql += ",password = " +  "'" + password  + "'";
        if(phone != "" && phone != null)
            sql += ",phone = " + "'" + phone  + "'";
        if(addr != "" && addr != null)
            sql += ",addr = " + "'" + addr + "'";

        sql += " where id = " + user.getId() + ";";
        //System.out.println(sql);

        try {
            pst = conn.prepareStatement(sql);
            pst.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            DBConnectors.close(conn, pst, null);
        }
    }

    public int deleteUser(Integer id) {
        String sql = "delete from user where id = " + id + ";";
//        System.out.println(sql);
        int i = 0;
        Connection conn = null;
        PreparedStatement pst = null;

        conn = DBConnectors.getConnetion();
        try {
            pst = conn.prepareStatement(sql);
            i = pst.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            DBConnectors.close(conn, pst, null);
        }
        return i;
    }
}




















