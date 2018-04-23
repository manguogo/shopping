package dao.implTest;

import dao.ProductDao;
import dao.impl.ProductDaoImpl;
import entity.Product;
import org.junit.Test;

import java.util.Iterator;
import java.util.List;

import static org.junit.Assert.*;

public class ProductDaoImplTest {


    @Test
    public void getProductsTest() {
        ProductDao pd = ProductDaoImpl.getProductDao();
        List<Product> products;
        Product product = null;
        products = pd.getProducts(true, null);
        for(Iterator<Product> productIterator = products.iterator(); productIterator.hasNext();){
            product = productIterator.next();
            System.out.println(product.getName());
        }
    }
}






















