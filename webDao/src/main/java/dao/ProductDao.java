package dao;

import entity.Product;
import productSearchTD.ProductSearch;

import java.sql.Timestamp;
import java.util.List;

public interface ProductDao {

    public void productInsert(Product product);

    public void productDelete(Product product);

    public void productDeleteById(Integer id);

    public Integer productUpdate(Product product);

    public List<Product> getProducts(Boolean isAllProducts, Product product, Integer pageSize, Integer pageNum);

    public Integer getProductPageCount(Integer pageSize);

    public String getFindProductsSql(ProductSearch productSearchCondition, Integer pageNum, Integer pageSize);

    public List<Product> findProducts(ProductSearch productSearchCondition, Integer pageNum, Integer pageSize);

}
