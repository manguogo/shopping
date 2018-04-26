package common;

import org.junit.Test;
import util.Common;

import java.sql.Timestamp;

public class TestCommon {
    @Test
    public void timestampToString() {
        Timestamp timestamp = new Timestamp(System.currentTimeMillis());
        String timestampStr = Common.timestampToString(timestamp);
        System.out.println(timestampStr);


    }

}
