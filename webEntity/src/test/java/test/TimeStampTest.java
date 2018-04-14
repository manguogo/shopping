package test;

import java.sql.Timestamp;
import java.util.Date;

public class TimeStampTest {
    public static void main(String[] args) {
        Date d = new Date();
        Timestamp t = new Timestamp(System.currentTimeMillis());
        System.out.println(d.toString());
        System.out.println(t);
    }



}
