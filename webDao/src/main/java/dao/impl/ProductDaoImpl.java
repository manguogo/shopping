package dao.impl;

import common.DBConnectors;
import dao.ProductDao;
import entity.Category;
import entity.Product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
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
        if(isAllProducts == true && product == null){
            sql = "select * from product";
        }
        if(isAllProducts == false){
            System.out.println("isAllProducts" + isAllProducts);
            sql = "select * from product where 1=1";
        }

        //数据库连接查询
        Connection conn = DBConnectors.getConnetion();
        PreparedStatement pst = null;
        ResultSet rs = null;
        List<Product> products = new ArrayList<Product>();
        Product p = null;
        Category category = new Category();

        try {
            pst = conn.prepareStatement(sql);
            rs = pst.executeQuery();
            while (rs.next()){
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
}






























