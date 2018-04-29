package test;

import entity.Product;
import org.junit.Test;
import productSearchTD.ProductSearch;
import service.ProductService;
import service.impl.ProductServiceImpl;

import java.util.List;

public class TestProductService {

    @Test
    public void searchProductsTest(){
        ProductService ps = ProductServiceImpl.getProductService();
        ProductSearch productSearchCondition = new ProductSearch();
        String[] names = new String[2];
        names[0] = "葡萄酒";
        names[1] = "冰红";
        productSearchCondition.setNames(names);
        List<Product> productList = ps.searchProducts(productSearchCondition, 3, 5);
        for (Product p : productList) {
            System.out.println(p.getId() +":" + p.getName());
        }
        System.out.println("共" + Product.pageCount + "页");



    }


}
