package dao;

import entity.Category;
import entity.Product;
import productSearchTD.ProductSearch;

import java.sql.Connection;
import java.sql.Timestamp;
import java.util.List;

public interface ProductDao {

    //产品增加
    public void productInsert(Product product);

    //产品删除
    public void productDelete(Product product);

    //产品根据ID删除
    public void productDeleteById(Integer id);

    //产品修改
    public Integer productUpdate(Product product);

    //通过isAllProducts为true时获取所有的产品,isALlProducts为false时传入产品来查询产品信息
    public List<Product> getProducts(Boolean isAllProducts, Product product, Integer pageSize, Integer pageNum);

    //获取全部产品的分页总和
    public Integer getProductPageCount(Integer pageSize);

    //将查询的语句拼装封装为一个方法,填进查询条件,返回查询语句
    public String getFindProductsSql(ProductSearch productSearchCondition, Integer pageNum, Integer pageSize);

    //根据查询条件查询相关的product
    public List<Product> findProducts(ProductSearch productSearchCondition, Integer pageNum, Integer pageSize);

    //利用递归搜索所有的子category
    public void getCategories(Connection conn, Category category, List<Category> categories);

    //获取最新的products
    public List<Product> getLatestProducts(Integer i);
}
