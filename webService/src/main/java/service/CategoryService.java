package service;

import entity.Category;

import java.util.List;

public interface CategoryService {

    public void addCategory(Category c);

    public void removeCategory(Integer id, Integer pid);

    public void updateCategory(Category category);

    public Category findACategory(Category category);

    //得到所有的category类型
    public List<Category> getCategories();

    //通过category父类型得到父类型下的所有子类型
    public void getChildCategories(Category[] parentCategories, List<Category> backCategories);
}
