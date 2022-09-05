package com.example.travelsystem.tools;

import java.text.SimpleDateFormat;
import java.util.Date;

public class Constants {
    public final static String USER_QIANSESSION = "userSession";
    public final static String USER_HOUSESSION = "userHouSession";
    public final static int pageSize = 6;

    public static String getFileName() {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSSS");
        return sdf.format(new Date());
    }
}
