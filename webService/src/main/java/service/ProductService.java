package service;

import entity.Product;

import java.sql.Timestamp;
import java.util.List;

public interface ProductService {

    public void productAdd(Product product);

    public void removeProduct(Integer id);

    public Product getAProduct(Integer id);

    public void updateProduct(Product product);

    //product查询
    public List<Product> getAllProducts(Integer pageSize, Integer pageNum);

    public List<Product> searchProducts(Integer[] ids, String[] names,
                                        Double normalPriceS, Double normalPriceE,
                                        Double memberPriceS, Double memberPriceE,
                                        Timestamp productPDateS, Timestamp productPDateE,
                                        Integer[] categoryIds);
    public Integer getPageCount(Integer pageSize);
}
