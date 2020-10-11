package com.dota2.controller.converter;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.core.convert.converter.Converter;
/**
 * S - source 源   string
 * T - target 目标  date日期
 * Converter<S, T>
 *
 */
public class DateConverter implements Converter<String, Date> {
	public Date convert(String source) {
		//字符串转日期
		try {
			if(source!=null){
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
				Date date = sdf.parse(source);
				return date;
			}		
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

}
