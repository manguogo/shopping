package service;

import entity.Category;

import java.util.List;

public interface CategoryService {

    public List<Category> getCategories();

    public void addCategory(Category c);

    public void removeCategory(Integer id, Integer pid);
}
