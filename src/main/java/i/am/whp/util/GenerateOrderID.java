package i.am.whp.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class GenerateOrderID {
    /**
     * 生成订单号
     * 规定标准12位，以一位随机数开头，后11位为当前年的时间戳
     */
    public static long generateOrderID() {
        Calendar calendar = Calendar.getInstance();
        int thisYear = calendar.get(Calendar.YEAR);

        Date thisYearFirstDayTime = null;
        try {
            thisYearFirstDayTime = new SimpleDateFormat("yyyyMMdd").parse(thisYear + "0101");
        } catch (ParseException e) {
            e.printStackTrace();
        }

        //最大是十一位，最小0
        long time = System.currentTimeMillis() - thisYearFirstDayTime.getTime();

        //同一秒内万分之一的重复率，同时保证最高位不是1
        int random = 0;
        while (random == 0) {
            random = (int) (Math.random() * (10));
        }
        //自动补充0
        String result = String.format("%011d", time);
        return Long.parseLong(Integer.toString(random).concat(result));
    }
}
