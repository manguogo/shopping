package util;

import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Common {

    public static Timestamp stringToTimestamp(String timeStr){
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-DD");
        Date date = null;
        try {
            date = sdf.parse(timeStr);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        Timestamp timestamp = new Timestamp(date.getTime());
        return timestamp;

    }

    public static String timestampToString(Timestamp timestamp) {
        Long timestampLong = timestamp.getTime();
        String timestampStr = timestampLong.toString();
        return timestampStr;
    }

}
