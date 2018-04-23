package service.impl;

import dao.ProductDao;
import dao.impl.ProductDaoImpl;
import entity.Product;
import service.ProductService;

import java.util.List;

public class ProductServiceImpl implements ProductService {
    private ProductDao pd = ProductDaoImpl.getProductDao();
    private static final ProductService ps;
    static {
        ps = new ProductServiceImpl();
    }

    private ProductServiceImpl(){};

    public static ProductService getProductService(){
        return ps;
    }

    public List<Product> getAllProducts() {
        return pd.getProducts(true, null);
    }

    public void productAdd(Product product) {
        pd.productInsert(product);
    }
}
