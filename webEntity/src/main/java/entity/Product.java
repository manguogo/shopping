package entity;

import java.sql.Timestamp;

public class Product {
    private  Integer id;
    private String  name;
    private String desc;
    private Double normalPrice;
    private Double memberPrice;
    private Timestamp pdate;
    private Category category;

    public Product() {
    }

    public Product(Integer id, String name,
                   String desc, Double normalPrice,
                   Double memberPrice, Timestamp pdate,
                   Category category) {
        this.id = id;
        this.name = name;
        this.desc = desc;
        this.normalPrice = normalPrice;
        this.memberPrice = memberPrice;
        this.pdate = pdate;
        this.category = category;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
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

    public Double getNormalPrice() {
        return normalPrice;
    }

    public void setNormalPrice(Double normalPrice) {
        this.normalPrice = normalPrice;
    }

    public Double getMemberPrice() {
        return memberPrice;
    }

    public void setMemberPrice(Double memberPrice) {
        this.memberPrice = memberPrice;
    }

    public Timestamp getPdate() {
        return pdate;
    }

    public void setPdate(Timestamp pdate) {
        this.pdate = pdate;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }
}
