package se;

import i.am.whp.util.EmailUtil;
import i.am.whp.util.GenerateOrderID;

import java.io.UnsupportedEncodingException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;

public class Test {
    @org.junit.Test
    public void orderId() {
        System.out.println(GenerateOrderID.generateOrderID());
    }

    @org.junit.Test
    public void time() {
        String format = new SimpleDateFormat("DDHHmmSS").format(new Date());
        System.out.println(format);
        Calendar calendar = Calendar.getInstance();
        System.out.println(calendar.get(Calendar.YEAR));

        Date thisYear = null;
        Date thisYearEnd = null;
        try {
            thisYear = new SimpleDateFormat("yyyyMMdd").parse("20180101");
            thisYearEnd = new SimpleDateFormat("yyyyMMdd").parse("20181231");
        } catch (ParseException e) {
            e.printStackTrace();
        }
        System.out.println(thisYearEnd.getTime() - thisYear.getTime());
    }

    @org.junit.Test
    public void getVerificationCode() {
        System.out.println(EmailUtil.getVerificationCode());
    }

    @org.junit.Test
    public void code() throws UnsupportedEncodingException {
        String source = "ä¸\u008B";
        System.out.println(source);
        System.out.println(Arrays.toString(source.getBytes("GBK")));
        System.out.println(new String(source.getBytes("UTF-8"), "GBK"));
    }
}
