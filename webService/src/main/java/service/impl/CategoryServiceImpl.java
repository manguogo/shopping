package service.impl;

import dao.CategoryDao;
import dao.impl.CategoryDaoImpl;
import entity.Category;
import service.CategoryService;

import java.util.List;

public class CategoryServiceImpl implements CategoryService {
    public List<Category> getCategories() {
        CategoryDao cd = new CategoryDaoImpl();
        return cd.getAllCategories();
    }

    public void addCategory(Category c) {
        CategoryDao cd = new CategoryDaoImpl();
        cd.insertCategory(c);
    }
}
