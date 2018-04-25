package service;

import entity.Product;

import java.sql.Timestamp;
import java.util.List;

public interface ProductService {

    public List<Product> getAllProducts();

    public void productAdd(Product product);

    public void removeProduct(Integer id);

    public Product getAProduct(Integer id);

    public void updateProduct(Product product);

    public List<Product> searchProducts(Integer[] ids, String[] names,
                                        Double normalPriceS, Double normalPriceE,
                                        Double memberPriceS, Double memberPriceE,
                                        Timestamp productPDateS, Timestamp productPDateE,
                                        Integer[] categoryIds);
}
