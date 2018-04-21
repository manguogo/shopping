package dao;

import entity.Category;

import java.util.List;

public interface CategoryDao {


    public List<Category> getAllCategories(Boolean isAllCategories, Category category);

    //通过子类别寻找父类别下是否还有子节点
    public boolean hasChildCategory(Category c);

    public Boolean insertCategory(Category c);

    //通过子类别改变父类别的isleaf属性,当isleaf为true时父类是叶子节点,当isleaf为false时父类节点不为叶子节点
    public void updateCategoryLeaf(Category c, boolean isleaf);

    public void deleteCategoryById(Integer id);

    //通过子类别寻找父类别的子类
    public List<Category> findChildCategory(Category c);

    public Integer updateCategory(Category category);
}
