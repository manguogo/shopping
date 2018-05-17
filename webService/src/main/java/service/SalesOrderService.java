package service;

import entity.Cart;
import entity.SalesItem;
import entity.SalesOrder;
import entity.User;

import java.util.List;

public interface SalesOrderService {
    public static Integer pageSize = 5;
    //采用ThreadLocal方式将事务层提到service层处理
    public void addSalesOrder(Cart cart, User user);

    //分页显示所有查到的订单
    public List<SalesOrder> getAllOrders(Integer pageSize, Integer pageNum);

    //获取所有订单的数量
    public Integer getAllOrderCount();
    //取得订单的明细
    public List<SalesItem> getOrderDetails(Integer id);

    //通过订单ID值获取订单信息
    public SalesOrder getOrderById(Integer id);
}
