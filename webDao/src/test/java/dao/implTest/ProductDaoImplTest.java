package dao.implTest;

import dao.ProductDao;
import dao.impl.ProductDaoImpl;
import entity.Category;
import entity.Product;
import org.junit.Assert;
import org.junit.Test;

import java.sql.Timestamp;
import java.util.Iterator;
import java.util.List;

import static org.junit.Assert.*;

public class ProductDaoImplTest {


    @Test
    public void getProductsTest() {
        ProductDao pd = ProductDaoImpl.getProductDao();
        List<Product> products;
        Product product = new Product();
        product.setId(9);
        products = pd.getProducts(true, null);
//        products = pd.getProducts(false, product);
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

    @Test
    public  void productUpdate(){
        ProductDao pd = ProductDaoImpl.getProductDao();
        Product p = new Product();
        Category c = new Category();
        c.setId(1);
        p.setName("PZ干红葡萄酒");
        p.setId(8);
        p.setDesc("法国百年佩瑞酒庄");
        p.setCategory(c);
       // pd.productUpdate(p);



    }

    @Test
    public void findProducts(){
        Integer[] ids = {1, 2};
        String[] names = {"葡萄" };
        ProductDao pd = ProductDaoImpl.getProductDao();
        Integer[] categoryIds = {2, 12};
        List<Product> products = null;
        products = pd.findProducts(ids, null,
                null, null,
                null, null,
                new Timestamp(Long.parseLong("00000000000000")), null,
                null);
        for (Product p : products) {
            System.out.println(p.getName());
        }

    }
    @Test
    public void timestamp(){
        Long currentTime = System.currentTimeMillis();
        Timestamp time = new Timestamp(currentTime);
        String str = time.toString();
        str = str.substring(0,19);
        System.out.println(str);
    }




}






















