package dao.impl;

import common.ServiceTransaction;
import dao.SalesItemDao;
import entity.Cart;
import entity.SalesItem;
import entity.SalesOrder;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

public class SalesItemDaoImpl implements SalesItemDao {
    private static SalesItemDao salesItemDao;
    static {
        salesItemDao = new SalesItemDaoImpl();
    }
    private SalesItemDaoImpl () {}
    public static SalesItemDao getSalesItemDao() {
        return salesItemDao;
    }

    public void saveItemsWithoutTransaction(SalesOrder salesOrder, List<SalesItem> salesItemList) throws Exception {
        Connection conn = ServiceTransaction.getConnection();
        PreparedStatement pst = null;

        for (SalesItem salesItem : salesItemList) {
            String sql = "insert into salesitem values(null," + salesItem.getProduct().getId() + "," + salesItem.getProduct().getMemberPrice() +
                    "," + salesItem.getpCount() + "," + salesOrder.getId() + ")";
            pst = conn.prepareStatement(sql);
            pst.execute();
            pst.close();
            pst = null;
        }


    }
}
