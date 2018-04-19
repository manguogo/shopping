package entity;

public class Category {

    private Integer id;
    private Integer pid;
    private String name;
    private String desc;
    private Integer grade;
    private Integer isleaf;

    public Category() {
    }

    public Category(Integer id, Integer pid, String name, String desc, Integer grade, Integer isleaf) {
        this.id = id;
        this.pid = pid;
        this.name = name;
        this.desc = desc;
        this.grade = grade;
        this.isleaf = isleaf;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getPid() {
        return pid;
    }

    public void setPid(Integer pid) {
        this.pid = pid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDesc() {
        return desc;
    }

    public void setDesc(String desc) {
        this.desc = desc;
    }

    public Integer getGrade() {
        return grade;
    }

    public void setGrade(Integer grade) {
        this.grade = grade;
    }

    public Integer getIsleaf() {
        return isleaf;
    }

    public void setIsleaf(Integer isleaf) {
        this.isleaf = isleaf;
    }
}
