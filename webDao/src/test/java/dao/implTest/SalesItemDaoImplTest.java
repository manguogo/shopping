package dao.implTest;

import common.ServiceTransaction;
import dao.SalesItemDao;
import dao.impl.SalesItemDaoImpl;
import entity.Product;
import entity.SalesItem;
import entity.SalesOrder;
import org.junit.Test;

import java.util.ArrayList;
import java.util.List;

public class SalesItemDaoImplTest {
    @Test
    public void saveItemsWithoutTransactionTest() {
        SalesItemDao sd = SalesItemDaoImpl.getSalesItemDao();
        SalesOrder so = new SalesOrder();
        List<SalesItem> salesItemList = new ArrayList<SalesItem>();
        SalesItem salesItem = null;
        so.setId(1);
        for(int i = 1; i < 6; i++) {
            salesItem = new SalesItem();
            Product product = new Product();
            product.setId(i);
            product.setMemberPrice(i * 10.0);
            salesItem.setProduct(product);
            salesItem.setpCount(i);
            salesItemList.add(salesItem);
        }

        ServiceTransaction.beginTransaction();
        try {
            sd.saveItemsWithoutTransaction(so, salesItemList);
        } catch (Exception e) {
            e.printStackTrace();
            ServiceTransaction.rollback();
        }
        ServiceTransaction.commit();
        ServiceTransaction.close();

    }

}
