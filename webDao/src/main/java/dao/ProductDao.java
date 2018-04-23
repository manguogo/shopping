package dao;

import entity.Product;

import java.util.List;

public interface ProductDao {

    public List<Product> getProducts(Boolean isAllProducts, Product product);

    public void productInsert(Product product);

    public void productDelete(Product product);

    public void productDeleteById(Integer id);
}
