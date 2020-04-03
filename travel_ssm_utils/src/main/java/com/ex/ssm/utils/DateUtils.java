package com.ex.ssm.utils;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class DateUtils {
    //日期—>字符串
    public static String dateToString(Date date, String pattern){
        SimpleDateFormat sdf=new SimpleDateFormat(pattern);
        String str = sdf.format(date);
        return str;
    }
    //字符串—>日期
    public static Date stringToDate(String str,String pattern) throws ParseException {
        SimpleDateFormat sdf=new SimpleDateFormat(pattern);
        Date date = sdf.parse(str);
        return date;
    }
}
