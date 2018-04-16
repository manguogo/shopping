package entity;

import java.sql.Timestamp;

public class User {
    private int id;
    private String userName;
    private String password;
    private String phone;
    private String addr;
    private Timestamp dateTime;

    public User() {
    }

    public User(int id, String userName, String phone, String addr, Timestamp dateTime) {
        this.id = id;
        this.userName = userName;
        this.phone = phone;
        this.addr = addr;
        this.dateTime = dateTime;
    }

    public User(int id, String userName, String password, String phone, String addr, Timestamp dateTime) {
        this.id = id;
        this.userName = userName;
        this.password = password;
        this.phone = phone;
        this.addr = addr;
        this.dateTime = dateTime;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddr() {
        return addr;
    }

    public void setAddr(String addr) {
        this.addr = addr;
    }

    public Timestamp getDateTime() {
        return dateTime;
    }

    public void setDateTime(Timestamp dateTime) {
        this.dateTime = dateTime;
    }
}
