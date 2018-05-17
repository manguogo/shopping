package service.impl;

import common.ServiceTransaction;
import dao.SalesItemDao;
import dao.SalesOrderDao;
import dao.impl.SalesItemDaoImpl;
import dao.impl.SalesOrderDaoImpl;
import daoFactory.SalesOrderDaoFactory;
import entity.Cart;
import entity.SalesItem;
import entity.SalesOrder;
import entity.User;
import service.SalesOrderService;

import java.util.List;

public class SalesOrderServiceImpl implements SalesOrderService {
    private  static SalesOrderService salesOrderService;
    static {
        salesOrderService = new SalesOrderServiceImpl();
    }
    private SalesOrderServiceImpl(){}

    private SalesOrderDao salesOrderDao = SalesOrderDaoFactory.getSalesOrderDao();
    public static SalesOrderService getSalesOrderService() {
        return salesOrderService;
    }

    public void addSalesOrder(Cart cart, User user) {
        SalesOrderDao sod = SalesOrderDaoImpl.getSalesOrderDao();
        SalesItemDao sd = SalesItemDaoImpl.getSalesItemDao();
        List<SalesItem> salesItemList = cart.getSalesItemList();
        SalesOrder so = null;

        //处理业务
        ServiceTransaction.beginTransaction();

        try {
            so = sod.saveWithoutTransaction(user, null);
            sd.saveItemsWithoutTransaction(so, salesItemList);
        } catch (Exception e) {
            ServiceTransaction.rollback();
            e.printStackTrace();
        }

        ServiceTransaction.commit();
        ServiceTransaction.close();


    }

    public List<SalesOrder> getAllOrders(Integer pageSize, Integer pageNum) {

        return salesOrderDao.getAllOrders(pageSize, pageNum);
    }

    public Integer getAllOrderCount() {
        return salesOrderDao.getAllOrdersCouont();
    }

    public List<SalesItem> getOrderDetails(Integer id) {
        return salesOrderDao.getItems(id);
    }

    public SalesOrder getOrderById(Integer id) {
        return salesOrderDao.getOrderById(id);
    }
}
