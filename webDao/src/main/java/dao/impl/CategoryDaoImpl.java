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
    public static CategoryDao cd;

    static {
        cd = new CategoryDaoImpl();
    }

    private CategoryDaoImpl(){};

    public static CategoryDao getCategoryDao(){
        return  cd;
    }

    public List<Category> getAllCategories(Boolean isAllCategories, Category category) {
        String sql = "select * from category";
        if(isAllCategories == false)
            sql += " where id=" + category.getId();
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


    //通过子类别寻找父类别的子类
    public List<Category> findChildCategory(Category c){
        String sql = "select * from category where pid = " + c.getPid();
        Connection conn = DBConnectors.getConnetion();
        PreparedStatement pst = null;
        ResultSet rs = null;
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

    //更改传递过来的category,若返回值是-1则可以判断未传递category的id或是名称
    public Integer updateCategory(Category category) {
        String name = category.getName();
        String desc = category.getDesc();
        Integer id = category.getId();

        if(null == id){
            return -1;
        }
        if( null == name || name.trim().equals(""))
            return -1;
        if( null == desc || desc.trim().equals("")) {
            desc = "";
        }
        String sql = "update category set category.name = '" + category.getName() +
                "' , category.desc = '" + category.getDesc() + "' where id = " + category.getId();
        System.out.println(sql);
        int isUpdate = 0;
        Connection conn = DBConnectors.getConnetion();
        PreparedStatement pst = null;

        try {
            pst = conn.prepareStatement(sql);
            isUpdate =  pst.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            DBConnectors.close(conn, pst, null);
        }

        return isUpdate;
    }

    //通过子类别寻找父类别下是否还有子节点
    public boolean hasChildCategory(Category c){
        String sql = "select COUNT(*) as count from category where pid = " + c.getPid();

        Connection conn = DBConnectors.getConnetion();
        PreparedStatement pst = null;
        ResultSet rs = null;
        List<Category> categories  = new ArrayList<Category>();
        Boolean hasChildes = null;

        try {
            pst = conn.prepareStatement(sql);
            rs = pst.executeQuery();
            rs.next();
            int count = rs.getInt("count");
            if(count > 0){
                hasChildes = true;
            }else {
                hasChildes = false;
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            DBConnectors.close(conn, pst, rs);
        }

        return hasChildes;

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
                pst.setInt(5, 1);
            }

            //System.out.println(sql);
            isInsert = pst.execute();

        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            DBConnectors.close(conn, pst, null);
        }
        return isInsert;
    }

    //通过子类别改变父类别的isleaf属性,当isleaf为true时父类是叶子节点,当isleaf为false时父类节点不为叶子节点
    public void updateCategoryLeaf(Category c, boolean isleaf) {
        int isAleaf = 0;
        if(isleaf == true){
            isAleaf = 1;
        }
        String sql = "update category set isleaf = " + isAleaf + " where id = " + c.getPid();
        Connection conn = DBConnectors.getConnetion();
        PreparedStatement pst = null;
        try {

            pst = conn.prepareStatement(sql);
            pst.execute();

        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            DBConnectors.close(conn, pst, null);
        }
    }

    public void deleteCategoryById(Integer id) {
        Category c = new Category();
        c.setId(id);
        deleteCategory(c);
    }

    public Boolean deleteCategory(Category c){

        String sql = "delete from category where 1=0";
        Boolean isDelete = false;

        if(c.getId() != null ){

            sql += " and id = " + c.getId();
            sql = sql.replace("1=0", "1=1");

        }
        if(c.getPid() != null ){
            sql += " and pid = " + c.getPid();
            if(sql.contains("1=0"))
                sql = sql.replace("1=0", "1=1");

        }
        if(c.getName() != null && c.getName().equals("")){
            sql += " and name like '%" + c.getName() + "%'";
            if(sql.contains("1=0"))
                sql = sql.replace("1=0", "1=1");
        }
        Connection conn = DBConnectors.getConnetion();
        PreparedStatement pst = null;

        try {
            pst = conn.prepareStatement(sql);
            isDelete = pst.execute();
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            DBConnectors.close(conn, pst, null);
        }
        return isDelete;
    }

}























