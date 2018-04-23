package service;

import entity.Product;

import java.util.List;

public interface ProductService {

    public List<Product> getAllProducts();

    public void productAdd(Product product);

    public void removeProduct(Integer id);
}
