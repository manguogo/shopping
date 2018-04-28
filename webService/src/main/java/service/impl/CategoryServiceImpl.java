package service.impl;

import dao.CategoryDao;
import dao.impl.CategoryDaoImpl;
import entity.Category;
import service.CategoryService;

import java.util.ArrayList;
import java.util.List;

public class CategoryServiceImpl implements CategoryService {
    private static CategoryService categoryService;
    static {
        categoryService = new CategoryServiceImpl();
    }
    private CategoryServiceImpl(){};

    public static CategoryService getCategoryService(){
        return categoryService;
    }

    public List<Category> getCategories() {
        CategoryDao cd = CategoryDaoImpl.getCategoryDao();
        return cd.getAllCategories(true, null);
    }

    public void addCategory(Category c) {
        CategoryDao cd = CategoryDaoImpl.getCategoryDao();
        cd.insertCategory(c);
        cd.updateCategoryLeaf(c, false);

    }

    public void removeCategory(Integer id, Integer pid) {
        CategoryDao cd = CategoryDaoImpl.getCategoryDao();
        Category c = new Category();
        c.setId(id);
        c.setPid(pid);
        cd.deleteCategoryById(id);
        if(!cd.hasChildCategory(c)){
            cd.updateCategoryLeaf(c, true);
        }

    }

    public Category findACategory(Category category) {
        CategoryDao cd = CategoryDaoImpl.getCategoryDao();
        List<Category> categories = cd.getAllCategories(false, category);
        return categories.get(0);
    }

    public void updateCategory(Category category) {
        CategoryDao cd = CategoryDaoImpl.getCategoryDao();
        cd.updateCategory(category);
    }

    //通过递归方式得到传入的父类所有子类(包括自己), 使用桶子backCategories来获取所有的数据
    public void getChildCategories(Category[] parentCcategories, List<Category> backCategories) {
        CategoryDao cd = CategoryDaoImpl.getCategoryDao();
        List<Category> findedCategories = null;

        for(int i = 0; i < parentCcategories.length; i++) {
            findedCategories = cd.findChildCategoriesByParent(parentCcategories[i]);
            for(int j = 0; j < findedCategories.size(); j++) {
                backCategories.add(findedCategories.get(j));
                if (findedCategories.get(j).getIsleaf() == 0) {
                    Category[] cts = {findedCategories.get(j)};
                    getChildCategories(cts, backCategories);
                }
            }
        }



    }

}














