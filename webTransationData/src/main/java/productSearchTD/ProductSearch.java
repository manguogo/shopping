package productSearchTD;

import entity.Category;

import java.sql.Timestamp;

public class ProductSearch {
    private Integer[] ids;
    private String[] names;
    private Double normalPriceS;
    private Double normalPriceE;
    private Double memberPriceS;
    private Double memberPriceE;
    private Timestamp productPDateS;
    private  Timestamp productPDateE;
    private Integer[] categoryIds;

    public ProductSearch(){};

    public ProductSearch(Integer[] ids, String[] names,
                         Double normalPriceS, Double normalPriceE,
                         Double memberPriceS, Double memberPriceE,
                         Timestamp productPDateS, Timestamp productPDateE,
                         Integer[] categoryIds) {
        this.ids = ids;
        this.names = names;
        this.normalPriceS = normalPriceS;
        this.normalPriceE = normalPriceE;
        this.memberPriceS = memberPriceS;
        this.memberPriceE = memberPriceE;
        this.productPDateS = productPDateS;
        this.productPDateE = productPDateE;
        this.categoryIds = categoryIds;
    }

    public Integer[] getIds() {
        return ids;
    }

    public void setIds(Integer[] ids) {
        this.ids = ids;
    }

    public String[] getNames() {
        return names;
    }

    public void setNames(String[] names) {
        this.names = names;
    }

    public Double getNormalPriceS() {
        return normalPriceS;
    }

    public void setNormalPriceS(Double normalPriceS) {
        this.normalPriceS = normalPriceS;
    }

    public Double getNormalPriceE() {
        return normalPriceE;
    }

    public void setNormalPriceE(Double normalPriceE) {
        this.normalPriceE = normalPriceE;
    }

    public Double getMemberPriceS() {
        return memberPriceS;
    }

    public void setMemberPriceS(Double memberPriceS) {
        this.memberPriceS = memberPriceS;
    }

    public Double getMemberPriceE() {
        return memberPriceE;
    }

    public void setMemberPriceE(Double memberPriceE) {
        this.memberPriceE = memberPriceE;
    }

    public Timestamp getProductPDateS() {
        return productPDateS;
    }

    public void setProductPDateS(Timestamp productPDateS) {
        this.productPDateS = productPDateS;
    }

    public Timestamp getProductPDateE() {
        return productPDateE;
    }

    public void setProductPDateE(Timestamp productPDateE) {
        this.productPDateE = productPDateE;
    }

    public Integer[] getCategoryIds() {
        return categoryIds;
    }

    public void setCategoryIds(Integer[] categoryIds) {
        this.categoryIds = categoryIds;
    }
}
