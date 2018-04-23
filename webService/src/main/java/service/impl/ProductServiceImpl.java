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

    public Product getAProduct(Integer id) {
        Product p = new Product();
        List<Product> products = null;
        p.setId(id);
        products = pd.getProducts(false, p);
        return products.get(0);
    }

    public void updateProduct(Product product) {
        pd.productUpdate(product);
    }

    public void productAdd(Product product) {
        pd.productInsert(product);
    }

    public void removeProduct(Integer id) {
        pd.productDeleteById(id);
    }
}
