package dao.impl;

import common.DBConnectors;
import dao.CategoryDao;
import entity.Category;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CategoryDaoImpl implements CategoryDao {

    public List<Category> getAllCategories() {

        String sql = "select * from category";
        Connection conn = DBConnectors.getConnetion();
        PreparedStatement pst = null;
        ResultSet rs = null;
        Category c = null;
        List<Category> categories  = new ArrayList<Category>();

        try {
            pst = conn.prepareStatement(sql);
            rs = pst.executeQuery();
            while (rs.next()){
                c = new Category(rs.getInt("id"), rs.getInt("pid"),
                                 rs.getString("name"), rs.getString("desc"),
                                 rs.getInt("grade"), rs.getInt("isleaf"));
                categories.add(c);

            }

        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            DBConnectors.close(conn, pst, rs);
        }

        return null;
    }
}























