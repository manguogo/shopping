package entity;

import java.sql.Timestamp;

public class SalesOrder {
    private Integer id;
    private User user;
    private String addr;
    private Timestamp odate;
    private Integer status;


    public SalesOrder() {
    }

    public SalesOrder(Integer id, User user, String addr, Timestamp odate, Integer status) {
        this.id = id;
        this.user = user;
        this.addr = addr;
        this.odate = odate;
        this.status = status;
    }

    @Override
    public String toString() {
        return "SalesOrder{" +
                "id=" + id +
                ", user=" + user.getUserName() +
                ", addr='" + addr + '\'' +
                ", odate=" + odate +
                ", status=" + status +
                '}';
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public String getAddr() {
        return addr;
    }

    public void setAddr(String addr) {
        this.addr = addr;
    }

    public Timestamp getOdate() {
        return odate;
    }

    public void setOdate(Timestamp odate) {
        this.odate = odate;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }
}
