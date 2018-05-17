package dao.implTest;

import common.ServiceTransaction;
import dao.SalesOrderDao;
import dao.impl.SalesOrderDaoImpl;
import daoFactory.SalesOrderDaoFactory;
import entity.SalesItem;
import entity.SalesOrder;
import entity.User;
import org.junit.Test;

import java.util.List;

public class SalesOrderDaoImplTest {

    SalesOrderDao salesOrderDao = SalesOrderDaoFactory.getSalesOrderDao();
    @Test
    public void saveWithoutTransactionTest() {
        SalesOrderDao sod = SalesOrderDaoImpl.getSalesOrderDao();
        SalesOrder so = null;
        User user = new User();
        user.setId(1);
        user.setAddr("testAddr");

        ServiceTransaction.beginTransaction();

        try {
            so = sod.saveWithoutTransaction(user, null);
        } catch (Exception e) {
            ServiceTransaction.rollback();
        }

        ServiceTransaction.commit();
        ServiceTransaction.close();

        System.out.println(so.getId());


    }

    @Test
    public void getAllOrders() {
        List<SalesOrder> salesOrderList = salesOrderDao.getAllOrders(5,-1);
        for (SalesOrder s : salesOrderList) {
            System.out.println(s);
        }

    }

    @Test
    public void getAllOrdersCount(){
        System.out.println(salesOrderDao.getAllOrdersCouont());

    }

    @Test
    public void getItems() {
        List<SalesItem> salesItemList = null;
        salesItemList = salesOrderDao.getItems(20);
        for (SalesItem s : salesItemList) {
            System.out.println(s);
        }
    }

    @Test
    public void getOrderById() {
        SalesOrder s = salesOrderDao.getOrderById(15);
        System.out.println(s);
    }
}
