package entity;

public class SalesItem {
    private Integer id;
    private Product product;
    private Integer pCount;
    private Double unitPrice;
    private SalesOrder salesOrder;

    public SalesItem() {
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public Integer getpCount() {
        return pCount;
    }

    public void setpCount(Integer pCount) {
        this.pCount = pCount;
    }

    public Double getUnitPrice() {
        return unitPrice;
    }

    public void setUnitPrice(Double unitPrice) {
        this.unitPrice = unitPrice;
    }

    public SalesOrder getSalesOrder() {
        return salesOrder;
    }

    public void setSalesOrder(SalesOrder salesOrder) {
        this.salesOrder = salesOrder;
    }

    @Override
    public String toString() {
        return "SalesItem{" +
                "id=" + id +
                ", product=" + product.getName() +
                ", pCount=" + pCount +
                ", unitPrice=" + unitPrice +
                '}';
    }
}
