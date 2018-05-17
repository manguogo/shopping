package serviceFactory;

import dao.SalesOrderDao;
import service.SalesOrderService;
import service.impl.SalesOrderServiceImpl;

public class SalesOrderFactory {

    private SalesOrderFactory() {
    }

    public static SalesOrderService getSalesOrder() {
        SalesOrderService salesOrderService = SalesOrderServiceImpl.getSalesOrderService();
        return salesOrderService;
    }
}
