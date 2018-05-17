package dao.impl;

import common.DBConnectors;
import common.ServiceTransaction;
import dao.SalesOrderDao;
import entity.Product;
import entity.SalesItem;
import entity.SalesOrder;
import entity.User;

import javax.xml.transform.Result;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class SalesOrderDaoImpl implements SalesOrderDao {
    private static SalesOrderDao salesOrderDao;
    static{
        salesOrderDao = new SalesOrderDaoImpl();
    }
    private SalesOrderDaoImpl(){}
    public static SalesOrderDao getSalesOrderDao(){
        return salesOrderDao;
    }

    public Integer saveSalesOrder(User user, String addr) {
        return null;
    }

    public SalesOrder saveWithoutTransaction(User user, String addr) throws Exception {
        //向订单表中增加新订单
        Timestamp timestamp = new Timestamp(System.currentTimeMillis());
        //先对timestamp进行处理
        String timestampStr = timestamp.toString();
        String reg = "\\.[0-9]*";
        Pattern pattern = Pattern.compile(reg);
        Matcher matcher = pattern.matcher(timestampStr);
        timestampStr = matcher.replaceAll("");

        String sql = "insert into salesorder values(null," + user.getId() + ",'" + user.getAddr() + "','" +
                timestampStr + "',0)";
        Connection conn = ServiceTransaction.getConnection();
        PreparedStatement pst = null;

        //提取刚添加的订单
        String salesOrderSql = "select * from salesorder where userid=" + user.getId() + " and odate='" + timestampStr + "'";
        ResultSet rs = null;
        SalesOrder so = null;
        User u = new User();


        pst = conn.prepareStatement(sql);
        pst.execute();

        pst = null;
        pst = conn.prepareStatement(salesOrderSql);
        rs = pst.executeQuery();
        if(rs.next()) {
            u.setId(rs.getInt("userid"));
            so = new SalesOrder(rs.getInt("id"), u,
                    rs.getString("addr"), rs.getTimestamp("odate"),
                    rs.getInt("status"));
        }
        if (rs != null) {
            rs.close();
            pst = null;
        }

        if (pst != null) {
            pst.close();
            pst = null;
        }

        return so;
    }

    public List<SalesOrder> getAllOrders(Integer pageSize, Integer pageNum) {
        String sql = "select" +
                "  so.id orderId, so.userid orderUserid,u.username username, u.phone phone, " +
                "so.addr addr,  so.status orderStatus, so.odate orderDate" +
                " from salesorder so left join user u on so.userid = u.id limit " + ((pageNum -1 ) <= 0 ? 0 : (pageNum -1 ) * pageSize) + "," + (((pageNum <= 1 ? 1 : pageNum )-1)  * pageSize + pageSize);
        System.out.println(sql);
        List<SalesOrder> salesOrderList = new ArrayList<SalesOrder>();

        Connection conn = DBConnectors.getConnetion();
        PreparedStatement pst = null;
        ResultSet rs = null;
        SalesOrder salesOrder = null;
        User user = null;
        try {
            pst = conn.prepareStatement(sql);
            rs = pst.executeQuery();
            while (rs.next()) {
                user = new User();
                user.setId(rs.getInt("orderUserid"));
                user.setUserName(rs.getString("username"));
                user.setPhone(rs.getString("phone"));
                salesOrder = new SalesOrder(rs.getInt("orderId"), user,
                        rs.getString("addr"), rs.getTimestamp("orderDate"),
                        rs.getInt("orderStatus"));
                salesOrderList.add(salesOrder);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            DBConnectors.close(conn, pst, rs);
        }
        return salesOrderList;
    }

    public Integer getAllOrdersCouont() {
        String sql = "select count(*) oc from salesorder";
        Connection conn = DBConnectors.getConnetion();
        PreparedStatement pst = null;
        ResultSet rs = null;
        Integer count = 0;

        try {
            pst = conn.prepareStatement(sql);
            rs = pst.executeQuery();
            rs.next();
            count = rs.getInt("oc");
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            DBConnectors.close(conn, pst, rs);
        }

        return count;
    }

    public List<SalesItem> getItems(Integer id) {
        String sql = " select " +
                " s.id itemId, p.id pid, s.pcount pcount, s.unitprice price, p.name pname, p.categoryid categoryid " +
                " from salesitem s left join product p on s.productid=p.id where s.orderid=" + id;
        Connection conn = DBConnectors.getConnetion();
        PreparedStatement pst = null;
        ResultSet rs = null;
        List<SalesItem> salesItemList = new ArrayList<SalesItem>();

        SalesItem salesItem = null;
        Product product = null;

        try {
            pst = conn.prepareStatement(sql);
            rs = pst.executeQuery();
            while (rs.next()) {
                salesItem = new SalesItem();
                product = new Product();

                product.setId(rs.getInt("pid"));
                product.setName(rs.getString("pname"));

                salesItem.setId(rs.getInt("itemId"));
                salesItem.setProduct(product);
                salesItem.setpCount(rs.getInt("pcount"));
                salesItem.setUnitPrice(rs.getDouble("price"));

                salesItemList.add(salesItem);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            DBConnectors.close(conn, pst, rs);
        }

        return salesItemList;
    }

    public SalesOrder getOrderById(Integer id) {
        String sql = "select " +
                " s.id orderId,  u.id uid, s.addr addr, s.odate odate, s.status status, u.username username, u.phone phone" +
                " from salesorder s left join user u on s.userid=u.id where s.id=" + id;

        Connection conn = DBConnectors.getConnetion();
        PreparedStatement pst = null;
        ResultSet rs = null;
        SalesOrder salesOrder = new SalesOrder();
        User user = new User();

        try {
            pst = conn.prepareStatement(sql);
            rs = pst.executeQuery();
            while (rs.next()) {
                user.setId(rs.getInt("uid"));
                user.setUserName(rs.getString("username"));
                user.setPhone(rs.getString("phone"));

                salesOrder.setId(id);
                salesOrder.setAddr(rs.getString("addr"));
                salesOrder.setOdate(rs.getTimestamp("odate"));
                salesOrder.setStatus(rs.getInt("status"));
                salesOrder.setUser(user);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            DBConnectors.close(conn, pst, rs);
        }

        return salesOrder;
    }
}
