package dao;

import entity.Product;

import java.util.List;

public interface ProductDao {

    public List<Product> getProducts(Boolean isAllProducts, Product product);

}
