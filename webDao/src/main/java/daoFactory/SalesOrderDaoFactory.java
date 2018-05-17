package daoFactory;

import dao.SalesOrderDao;
import dao.impl.SalesOrderDaoImpl;

public class SalesOrderDaoFactory {
    private SalesOrderDaoFactory() {};
    public static SalesOrderDao getSalesOrderDao() {
        SalesOrderDao salesOrderDao = SalesOrderDaoImpl.getSalesOrderDao();
        return salesOrderDao;
    }
}
