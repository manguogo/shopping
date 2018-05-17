package dao;

import entity.Cart;
import entity.SalesItem;
import entity.SalesOrder;

import java.sql.SQLException;
import java.util.List;

public interface SalesItemDao {
    public void saveItemsWithoutTransaction(SalesOrder salesOrder, List<SalesItem> salesItemList) throws Exception;

}
