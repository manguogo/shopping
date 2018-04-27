package dao;

import entity.Product;

import java.sql.Timestamp;
import java.util.List;

public interface ProductDao {

    public void productInsert(Product product);

    public void productDelete(Product product);

    public void productDeleteById(Integer id);

    public Integer productUpdate(Product product);

    public List<Product> getProducts(Boolean isAllProducts, Product product, Integer pageSize, Integer pageNum);

    public List<Product> findProducts(Integer[] ids, String[] names,
                                      Double normalPriceS, Double normalPriceE,
                                      Double memberPriceS, Double memberPriceE,
                                      Timestamp productPDateS, Timestamp productPDateE,
                                      Integer[] categoryIds);

    public Integer getProductPageCount(Integer pageSize);
}
