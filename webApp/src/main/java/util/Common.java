package util;

import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.TimeZone;

public class Common {

    /**
     * 格式为yyyy-MM-DD的字符串类型的日期转化为Timestamp类型
     * 注:1.String转Timestamp使用中间类Date是行不通的,会出错;
     *     请使用中间类Calendar转化String
     *  问题:使用Timestamp来查数据库中的Timestamp数据时会出现查不到数据的情况
     *      原因:sql查询语句是将Timestamp转换为String类型来查询的,
     *          当在sql中使用Timestamp类型时,在sql语句中会被转化为yyyy-MM-DD hh:mm:ss.xxx,
     *          问题就出现在.xxx上.
     *      解决:所以需要将Timestamp先转化为String再使用subString方法将.xxx给才掉,
     *          将裁好的String放到sql语句中就可以了;
     * 问题:为什么不在查询数据库的的时候直接将日期toString()后直接放到sql中查询?
     *      原因:因为传入数据类型不同,比如数据库用的是Timestamp类型而传入的却是Date数据类型;
     *
     */
    public static Timestamp stringToTimestamp(String timeStr){
        String[] timeStrs = timeStr.split("-");
        Integer[] timeInts = null;
        if (timeStrs != null) {
            timeInts = new Integer[timeStrs.length];
            for(int i = 0; i < timeStrs.length; i++) {
                timeInts[i] = Integer.parseInt(timeStrs[i]);
            }
        }

        Calendar calendar = Calendar.getInstance(TimeZone.getTimeZone("Asia/Shanghai"));
        if (timeInts != null) {
            calendar.set(timeInts[0], timeInts[1] - 1, timeInts[2]);
        }

        Timestamp timestamp = new Timestamp(calendar.getTimeInMillis());
        return timestamp;

    }

    public static String timestampToString(Timestamp timestamp) {
        Long timestampLong = timestamp.getTime();
        String timestampStr = timestampLong.toString();
        return timestampStr;
    }

}
