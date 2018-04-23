package dao.implTest;

import dao.ProductDao;
import dao.impl.ProductDaoImpl;
import entity.Category;
import entity.Product;
import org.junit.Assert;
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

    @Test
    public void productInsertTest() {
        ProductDao pd = ProductDaoImpl.getProductDao();
        Product p = new Product();
        Category c = new Category();
        c.setId(2);

        p.setName("艾泽干红葡萄酒");
        p.setNormalPrice(299.0);
        p.setMemberPrice(196.0);
        p.setCategory(c);
        pd.productInsert(p);


    }

    @Test
    public void productDeleteById() {
        ProductDao pd = ProductDaoImpl.getProductDao();
        /*Product product = new Product();
        Category c = new Category();
        c.setId(12);
        product.setCategory(c);
        pd.productDelete(product);*/
        //pd.productDeleteById(13);
        //Assert.assertEquals(1, pd.productDeleteById(13));
    }

}






















