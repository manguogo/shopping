package dao.impl;

import dao.UserDao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import common.*;
import entity.User;

public class UserDaoImpl implements UserDao{

    @Override
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
}
