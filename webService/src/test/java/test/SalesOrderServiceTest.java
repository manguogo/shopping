package test;

import entity.SalesOrder;
import org.junit.Test;
import service.SalesOrderService;
import serviceFactory.SalesOrderFactory;

import java.util.List;

public class SalesOrderServiceTest {
    @Test
    public void getAllOrders() {
        SalesOrderService salesOrderService = SalesOrderFactory.getSalesOrder();
        List<SalesOrder> salesOrderList = salesOrderService.getAllOrders(5,0);
        for (SalesOrder s : salesOrderList) {
            System.out.println(s);
        }
    }
}
