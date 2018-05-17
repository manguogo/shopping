package entity;

import java.util.ArrayList;
import java.util.List;

public class Cart {
    private List<SalesItem> salesItemList = new ArrayList<SalesItem>();
    private Double totalCount;

    public List<SalesItem> getSalesItemList() {
        return salesItemList;
    }

    public void setSalesItemList(List<SalesItem> salesItemList) {
        this.salesItemList = salesItemList;
    }

    public Double getTotalCount() {
        return totalCount;
    }

    public void setTotalCount(Double totalCount) {
        this.totalCount = totalCount;
    }
}
