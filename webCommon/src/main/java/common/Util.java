package common;

public class Util {
    public static void swap(Object ob1, Object ob2){
        Object userTmp = null;
        userTmp = ob1;
        ob1 = ob2;
        ob2 = userTmp;
    }
}
