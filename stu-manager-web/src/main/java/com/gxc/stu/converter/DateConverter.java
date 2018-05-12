package com.gxc.stu.converter;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.core.convert.converter.Converter;

public class DateConverter implements Converter<String, Date>{

	@Override
	public Date convert(String source) {
		
		if(source != null){
			try {
				//正常情况下
				DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
				Date date = dateFormat.parse(source);
				return date;
				
			} catch (ParseException e) {
				try {
					//苹果手机兼容
					DateFormat dateFormat2 = new SimpleDateFormat("yyyy年MM月dd日");
					Date date2 = dateFormat2.parse(source);
					return date2;
					
				} catch (ParseException e1) {
					return new Date();
				}
			}
		}
		return new Date();
	}

}
