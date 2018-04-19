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

        return categories;
    }

    public Boolean insertCategory(Category c) {
        String sql = "insert into category(id, pid, category.name, category.desc, grade, isleaf) values(null, ?, ?, ?, ?, ?)";
        Connection conn = DBConnectors.getConnetion();
        PreparedStatement pst = null;
        Boolean isInsert = false;
        try {
            pst = conn.prepareStatement(sql);
            if(c.getPid() != null){
                pst.setInt(1, c.getPid());
            }else{
                pst.setInt(1, 0);
            }
            if(c.getName() != null){
                pst.setString(2, c.getName());
            }else{
                return false;
            }
            if(c.getDesc() != null){
                pst.setString(3, c.getDesc());
            }else{
                pst.setString(3, null);
            }
            if(c.getGrade() != null){
                pst.setInt(4, c.getGrade());
            }else{
                pst.setInt(4, 1);
            }
            if(c.getIsleaf() != null){
                pst.setInt(5, c.getIsleaf());
            }else{
                pst.setInt(5, 0);
            }

            System.out.println(sql);
            isInsert = pst.execute();

        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            DBConnectors.close(conn, pst, null);
        }
        return isInsert;
    }
}























