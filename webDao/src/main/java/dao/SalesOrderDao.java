package dao;

import entity.SalesItem;
import entity.SalesOrder;
import entity.User;

import java.util.List;

public interface SalesOrderDao {
    public Integer saveSalesOrder(User user, String addr);

    public SalesOrder saveWithoutTransaction(User user, String addr) throws Exception;

    public List<SalesOrder> getAllOrders(Integer pageSize, Integer pageNum);

    public Integer getAllOrdersCouont();

    public List<SalesItem> getItems(Integer id);

    public SalesOrder getOrderById(Integer id);
}
