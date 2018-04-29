package service.impl;

import dao.ProductDao;
import dao.impl.ProductDaoImpl;
import entity.Product;
import productSearchTD.ProductSearch;
import service.ProductService;

import java.sql.Timestamp;
import java.util.List;

public class ProductServiceImpl implements ProductService {
    private ProductDao pd = ProductDaoImpl.getProductDao();
    private static final ProductService ps;
    static {
        ps = new ProductServiceImpl();
    }

    private ProductServiceImpl(){};

    public void updateProduct(Product product) {
        pd.productUpdate(product);
    }

    public void productAdd(Product product) {
        pd.productInsert(product);
    }

    public void removeProduct(Integer id) {
        pd.productDeleteById(id);
    }

    //查询product
    public static ProductService getProductService(){
        return ps;
    }

    public List<Product> getAllProducts(Integer pageSize, Integer pageNum) {

        return pd.getProducts(true, null, pageSize, pageNum);
    }

    public Integer getPageCount(Integer pageSize){
        return  pd.getProductPageCount(pageSize);
    }

    public Product getAProduct(Integer id) {
        Product p = new Product();
        List<Product> products = null;
        p.setId(id);
        products = pd.getProducts(false, p, null ,null);
        return products.get(0);
    }

    public List<Product> searchProducts(ProductSearch productSearchCondition, Integer pageNum, Integer pageSize) {
        return pd.findProducts( productSearchCondition, pageNum, pageSize);
    }
}
