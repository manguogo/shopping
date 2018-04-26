package test;

import entity.Category;
import org.junit.Test;
import org.junit.runner.RunWith;
import service.CategoryService;
import service.impl.CategoryServiceImpl;

import java.util.ArrayList;
import java.util.List;

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

    @Test
    public void getChildCategories(){
        CategoryService cs = CategoryServiceImpl.getCategoryService();
        Category[] parentCategories = {new Category()};
        parentCategories[0].setId(0);
        List<Category> categoryList = new ArrayList<Category>();
        cs.getChildCategories(parentCategories, categoryList);
        for (Category c : categoryList) {
            String pre = "";
            if(c.getId() != 0) {
                for(int i = 0; i < c.getGrade(); i++) {
                    pre += "--";
                }
            }
            System.out.println(pre + c.getName());
        }






    }
}
