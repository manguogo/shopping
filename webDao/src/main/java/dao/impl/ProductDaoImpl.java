package dao.impl;

import common.DBConnectors;
import dao.ProductDao;
import entity.Category;
import entity.Product;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ProductDaoImpl implements ProductDao {
    private static ProductDao pd;

    static {
        pd = new ProductDaoImpl();
    }
    private ProductDaoImpl(){};
    public static ProductDao getProductDao(){
        return pd;
    }

    public List<Product> getProducts(Boolean isAllProducts, Product product) {
        String sql = null;
        Integer id = null;
        if(isAllProducts == true && product == null){
            sql = "select * from product";
        }
        if(isAllProducts == false && product != null){
            id = product.getId();
            System.out.println("isAllProducts" + isAllProducts);
            sql = "select * from product where 1=1";
            if (null != id) {
                sql += " and id = " + id;
            }
//            System.out.println(sql);
        }

        //数据库连接查询
        Connection conn = DBConnectors.getConnetion();
        PreparedStatement pst = null;
        ResultSet rs = null;
        List<Product> products = new ArrayList<Product>();
        Product p = null;
        Category category = null;

        try {
            pst = conn.prepareStatement(sql);
            rs = pst.executeQuery();
            while (rs.next()){
                category = new Category();
                category.setId(rs.getInt("categoryid"));
                p = new Product(rs.getInt("id"), rs.getString("name"),
                        rs.getString("descr"), rs.getDouble("normalprice"),
                        rs.getDouble("memberprice"), rs.getTimestamp("pdate"),
                        category);
                products.add(p);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            DBConnectors.close(conn, pst, rs);
        }

        return products;

    }

    public void productInsert(Product product) {
        String sql = "insert into product (name, descr, normalprice, memberprice, pdate, categoryid) values ( ?, ?, ?, ?, ?, ?)";

        Connection conn = DBConnectors.getConnetion();
        PreparedStatement pst = null;

        try {
            pst = conn.prepareStatement(sql);
            pst.setString(1, product.getName());
            pst.setString(2, product.getDesc());
            pst.setDouble(3, product.getNormalPrice());
            pst.setDouble(4, product.getMemberPrice());
            pst.setTimestamp(5, new Timestamp(System.currentTimeMillis()));
            if(product.getCategory().getId() != null)
                pst.setInt(6, product.getCategory().getId());

            pst.execute();

        } catch (SQLException e) {
            e.printStackTrace();

        }finally {
            DBConnectors.close(conn, pst, null);
        }

    }

    public void productDelete(Product product) {
        //拼写删除product的sql语句
        String sql = "delete from product where 1=0";
        Integer id = product.getId();
        String name = product.getName();
        Timestamp time = product.getPdate();
        Integer categoryId = null;
        if (product.getCategory() != null) {
            categoryId = product.getCategory().getId();
        }else{

        }
        if (id != null) {
            sql += " and id = " + id;
            sql = sql.replace("1=0", "1=1");
        }
        if(null != name && name.equals("")){
            sql += " and name = '" + name + "'";
            sql = sql.replace("1=0", "1=1");
        }
        if(time != null){
            sql += " and pdate = '" + time + "'";
            sql = sql.replace("1=0", "1=1");
        }
        if (null != categoryId) {
            sql += " and categoryid = " + categoryId;
            sql = sql.replace("1=0", "1=1");
        }
        System.out.println(sql);

        //删除product操作
        Integer deleteCount = 0;
        Connection conn = DBConnectors.getConnetion();
        PreparedStatement pst = null;

        try {
            pst = conn.prepareStatement(sql);
            deleteCount = pst.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            DBConnectors.close(conn, pst, null);
        }
    }

    public void productDeleteById(Integer id) {
        Product product = new Product();
        product.setId(id);
        productDelete(product);

    }

    public Integer productUpdate(Product product) {
        //拼写sql
        String sql = "update product set name = '" + product.getName() + "'";

        Integer id = product.getId();
        String desc = product.getDesc();
        Double normalPrice = product.getNormalPrice();
        Double memberPrice = product.getMemberPrice();
        Category category = product.getCategory();
        if(desc != null && !desc.equals("")){
            sql += ", descr = '" + desc + "'";
        }
        if (null != normalPrice) {
            sql += ", normalprice = " + normalPrice;
        }
        if (null != memberPrice) {
            sql += ", memberprice = " + memberPrice;
        }
        if (null != category) {
            sql += ", categoryid = " + category.getId();
        }
        if(null != id){
            sql += " where id = " + id;
        }
        System.out.println(sql);

        //更新字段
        Integer productUpdateCount = 0;
        Connection conn = DBConnectors.getConnetion();
        PreparedStatement pst = null;

        try {
            pst = conn.prepareStatement(sql);
            productUpdateCount = pst.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            DBConnectors.close(conn, pst,null);
        }

        return productUpdateCount;

    }

    public List<Product> findProducts(Integer[] ids, String[] names,
                                      Double normalPriceS, Double normalPriceE,
                                      Double memberPriceS, Double memberPriceE,
                                      Timestamp productPDateS, Timestamp productPDateE,
                                      Integer[] categoryIds) {
        //根据传进的值进行sql拼装
        String sql = "select * from product where 1=0";
        if(null != ids){
            String strid = "";
            for(int i = 0; i < ids.length; i++) {
                if( i == 0){
                    strid += ids[i].toString();
                }else{
                    strid += "," + ids[i];
                }
            }
            sql += " and id in (" + strid + ")";
            sql = sql.replace("1=0", "1=1");
        }
        //根据name查询语句
        if (null != names) {
            String nameStr = "";
            for(int i = 0; i < names.length; i++) {
                if (i == 0) {
                    nameStr += " and product.name like '%" + names[i] + "%'";
                } else {
                    nameStr += " or product.name like '%" + names[i] + "%'";
                }
            }
            sql +=  nameStr ;
            sql = sql.replace("1=0", "1=1");
        }
        //normalPrice判断语句
        if (null != normalPriceS) {
            String normalPriceStr = "";
            if (null == normalPriceE) {
                normalPriceStr = " " + normalPriceS + " and 999999999.0";
            } else {
                normalPriceStr = " " + normalPriceS + " and  " + normalPriceE ;
            }
            sql += " and normalprice between" + normalPriceStr;
            sql = sql.replace("1=0", "1=1");
        }
        if (null == normalPriceS) {
            String normalPriceStr = "";
            if (null == normalPriceE) {
                normalPriceStr = "";
            } else {
                normalPriceStr = " 0 and  " + normalPriceE ;
                sql += " and normalprice between" + normalPriceStr;
                sql = sql.replace("1=0", "1=1");
            }
        }
        //根据memberPrice拼装sql语句
        if (null != memberPriceS) {
            String memberPriceStr = "";
            if (null == memberPriceE) {
                memberPriceStr = " " + memberPriceS + " and 999999999.0";
            } else {
                memberPriceStr = " " + memberPriceS + " and  " + memberPriceE ;
            }
            sql += " and memberprice between" + memberPriceStr;
            sql = sql.replace("1=0", "1=1");
        }
        if (null == memberPriceS) {
            String memberPriceStr = "";
            if (null == memberPriceE) {
                memberPriceStr = "";
            } else {
                memberPriceStr = " 0 and  " + memberPriceE ;
                sql += " and memberprice between" + memberPriceStr;
                sql = sql.replace("1=0", "1=1");
            }
        }
        //根据pdate拼装sql语句
        if (null != productPDateS) {
            String productPDateStr = "";
            if (null == productPDateE) {
                productPDateStr = " '" + productPDateS + "' and now()";
            } else {
                productPDateStr = "'" + productPDateS + "' and '" + productPDateE + "'";
            }
            sql += " and pdate between " +  productPDateStr;
            sql = sql.replace("1=0", "1=1");
        }
        if (null == productPDateS) {
            String productPDateStr = "";
            if (null == productPDateE) {
                productPDateStr = "";
            } else {
                productPDateStr = " '"+ (new Timestamp(Long.parseLong("00000000000000"))).toString().substring(0, 19) +"' and '" + productPDateE.toString().substring(0,19)  + "'";
                sql += " and pdate between" + productPDateStr;
                sql = sql.replace("1=0", "1=1");
            }
        }
        //根据传入的categoryid拼装sql语句
        if (null != categoryIds) {
            String categoryIdStr = "";
            for(int i = 0; i < categoryIds.length; i++) {
                if (i == 0) {
                    categoryIdStr = categoryIds[i].toString();
                } else {
                    categoryIdStr += ", " + categoryIds[i].toString();
                }
            }
            sql += " and categoryid in(" + categoryIdStr + ")";
            sql = sql.replace("1=0", "1=1");
        }
        //连接数据库查询结果

        Connection conn = DBConnectors.getConnetion();
        PreparedStatement pst = null;
        ResultSet rs = null;
        List<Product> products = new ArrayList<Product>();
        Product product = null;
        Category category = null;

        try {
            pst = conn.prepareStatement(sql);
            rs = pst.executeQuery();
            while (rs.next()) {
                category = new Category();
                category.setId(rs.getInt("categoryid"));
                product = new Product(rs.getInt("id"), rs.getString("name"),
                        rs.getString("descr"), rs.getDouble("normalprice"),
                        rs.getDouble("memberprice"), rs.getTimestamp("pdate"),
                        category);
                products.add(product);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            DBConnectors.close(conn, pst, rs);
        }
//        System.out.println(sql);

        return products;
    }

}






























