package test;

import entity.Category;
import org.junit.Test;
import org.junit.runner.RunWith;
import service.CategoryService;
import service.impl.CategoryServiceImpl;

import static org.junit.Assert.*;

public class CategoryServiceImplTest {

    @Test
    public void findACategoryTest() {
        CategoryService cs = CategoryServiceImpl.getCategoryService();
        Category c = new Category();
        Category category = null;
        c.setId(12);
        category = cs.findACategory(c);
        System.out.println(category.getName());

    }
}
