package com.Master.VTAS.support;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.support.WebBindingInitializer;
import org.springframework.web.context.request.WebRequest;

/**
 * 前台传递的日期自动转换成java.util.date
 * @author yz_du
 *
 */
public class DateConvertBindingInitializer implements WebBindingInitializer{

	private final static ThreadLocal<SimpleDateFormat> datetimeFormater = new ThreadLocal<SimpleDateFormat>(){
		
		@Override
		protected SimpleDateFormat initialValue() {
			return new SimpleDateFormat("yyyy-MM-dd HH:mm:ss",Locale.SIMPLIFIED_CHINESE);
		}
		
	};
	
	@Override
	public void initBinder(WebDataBinder binder, WebRequest request) {
		binder.registerCustomEditor(Date.class, new DateConvertEditor(datetimeFormater.get(),true));
	}
	
}
