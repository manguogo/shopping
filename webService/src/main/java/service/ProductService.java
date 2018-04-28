package service;

import entity.Product;
import productSearchTD.ProductSearch;

import java.sql.Timestamp;
import java.util.List;

public interface ProductService {

    public void productAdd(Product product);

    public void removeProduct(Integer id);

    public Product getAProduct(Integer id);

    public void updateProduct(Product product);

    //product查询
    public List<Product> getAllProducts(Integer pageSize, Integer pageNum);

    //需要传入pageCount,对其进行程序内的赋值
    public List<Product> searchProducts(ProductSearch productSearchCondition, Integer pageNum, Integer pageSize, Integer[] pageCount);
    public Integer getPageCount(Integer pageSize);
}
