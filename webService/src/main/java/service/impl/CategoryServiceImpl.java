package service.impl;

import dao.CategoryDao;
import dao.impl.CategoryDaoImpl;
import entity.Category;
import service.CatetoryService;

import java.util.List;

public class CategoryServiceImpl implements CatetoryService {
    public List<Category> getCategories() {
        CategoryDao cd = new CategoryDaoImpl();
        return cd.getAllCategories();
    }
}
