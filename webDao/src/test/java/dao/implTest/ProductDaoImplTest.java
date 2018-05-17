package dao.implTest;

import common.DBConnectors;
import dao.ProductDao;
import dao.impl.ProductDaoImpl;
import entity.Category;
import entity.Product;
import org.junit.Assert;
import org.junit.Test;
import productSearchTD.ProductSearch;

import java.sql.Connection;
import java.sql.Timestamp;
import java.util.ArrayList;
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
        products = pd.getProducts(true, null, 5, 4);
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
    public void findProductsTest(){
        ProductDao pd = ProductDaoImpl.getProductDao();
        /*Integer[] ids = {1, 2};
        String[] names = {"葡萄" };*/
        Integer[] categoryIds = {5};
        List<Product> products = null;
        ProductSearch productSearchCondition = new ProductSearch(null, null,
                null, null,
                null, null,
                null, null,
                categoryIds );
        products = pd.findProducts(productSearchCondition, 0,5);
        for (Product p : products) {
            System.out.println(p.getName());
        }
        System.out.println(products.size());

    }
    @Test
    public void timestamp(){
        Long currentTime = System.currentTimeMillis();
        Timestamp time = new Timestamp(currentTime);
        String str = time.toString();
        str = str.substring(0,19);
        System.out.println(str);
    }

    @Test
    public void getProductPageCountTest(){
        ProductDao pd = ProductDaoImpl.getProductDao();
        Integer pageCount = null;
        pageCount = pd.getProductPageCount(5);
        System.out.println(pageCount);

    }

    @Test
    public void getCategoriesTest(){
        ProductDao pd = ProductDaoImpl.getProductDao();
        List<Category> categoryList = new ArrayList<Category>();
        Category c = new Category();
        c.setId(5);
        c.setPid(0);
        c.setIsleaf(0);
        Connection conn = DBConnectors.getConnetion();
        pd.getCategories(conn, c, categoryList);

        for (Category category : categoryList) {
            System.out.println(category.getName());
        }


    }

    @Test
    public void getFindProductsSql(){
        ProductDao pd = ProductDaoImpl.getProductDao();
        ProductSearch productSearch = new ProductSearch();
        Integer[] ids = {Integer.valueOf(5), Integer.valueOf(10), Integer.valueOf(12), Integer.valueOf(18)};
        productSearch.setCategoryIds(ids);

        String sql = pd.getFindProductsSql(productSearch, 0, 5);
        System.out.println(sql);

    }

    @Test
    public void getLatestProductsTest() {
        ProductDao pd = ProductDaoImpl.getProductDao();
        List<Product> products;
        products = pd.getLatestProducts(5);
        for (Product p : products) {
            System.out.println(p.getName());
        }

    }




}






















