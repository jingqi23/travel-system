package com.example.travelsystem.tools;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.core.convert.converter.Converter;

//自定义类型转换器
public class DateConverter implements Converter<String, Date> {

    public Date convert(String args) {
        Date date = null;
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        try {
            date = sdf.parse(args);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return date;
    }

}
