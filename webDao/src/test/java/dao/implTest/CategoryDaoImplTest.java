package dao.implTest;

import dao.CategoryDao;
import dao.impl.CategoryDaoImpl;
import entity.Category;
import org.junit.Test;

import java.util.Iterator;
import java.util.List;



public class CategoryDaoImplTest {

    @Test
    public void getAllCategoriesTest(){
        Category c;
        List<Category> categories;
        CategoryDao cd = CategoryDaoImpl.getCategoryDao();
        categories = cd.getAllCategories();

        for(Iterator<Category> ci = categories.iterator(); ci.hasNext(); ){
            c = ci.next();
            System.out.println(c.getId() + "　" + c.getName() + " " + c.getDesc() + " "
                    + c.getPid() + " " + c.getGrade() + " " + c.getIsleaf());
        }
    }

    @Test
    public void insertCategoryTest(){
        Category c = new Category();
        CategoryDao cd = CategoryDaoImpl.getCategoryDao();
        c.setName("茅台");
        c.setPid(1);
        c.setGrade(2);
        cd.insertCategory(c);

    }

    @Test
    public void updateCategoryLearTest(){
        Category c = new Category();
        CategoryDao cd = CategoryDaoImpl.getCategoryDao();
        c.setPid(6);

    }

    @Test
    public void deleteCategoryById(){
        CategoryDao cd = CategoryDaoImpl.getCategoryDao();
        cd.deleteCategoryById(12);

    }

    @Test
    public void hasChildCategoryTest(){
        CategoryDao cd = CategoryDaoImpl.getCategoryDao();
        Category c = new Category();
        c.setPid(10);
        System.out.println(cd.hasChildCategory(c));

    }
}













