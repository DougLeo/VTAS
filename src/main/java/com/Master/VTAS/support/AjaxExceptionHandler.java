package com.Master.VTAS.support;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.AbstractHandlerExceptionResolver;


public class AjaxExceptionHandler extends AbstractHandlerExceptionResolver {

	private final static Logger logger = LogManager.getLogger(AjaxExceptionHandler.class);
	
	private String ajaxErrorView;
    private String ajaxDefaultErrorMessage = "服务器内部错误！";
    private boolean ajaxShowTechMessage = true;
	
	@Override
	protected ModelAndView doResolveException(HttpServletRequest request,HttpServletResponse response, Object obj, Exception e) {
		if( isAjax(request) ) {
            String exceptionMessage = ajaxDefaultErrorMessage;
            if( ajaxShowTechMessage )
                exceptionMessage += "\r\n" + getExceptionMessage(e);
            logger.warn("an ajax exception has occurred\r\n", e);
            ModelAndView m = new ModelAndView(ajaxErrorView);
            m.addObject("exceptionMessage", exceptionMessage);
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            return m;
        }
		return null;
	}

	private String getExceptionMessage(Throwable e) {
        String message = "";
        while( e != null ) {
            message += e.getMessage() + "\n" + e.getCause();
        }
        return message;
    }
	
	private boolean isAjax(HttpServletRequest request) {
        return request.getHeader("X-Requested-With")!= null&&"XMLHttpRequest".equals(request.getHeader("X-Requested-With"));
    }

	public String getAjaxErrorView() {
		return ajaxErrorView;
	}

	public void setAjaxErrorView(String ajaxErrorView) {
		this.ajaxErrorView = ajaxErrorView;
	}

	public String getAjaxDefaultErrorMessage() {
		return ajaxDefaultErrorMessage;
	}

	public void setAjaxDefaultErrorMessage(String ajaxDefaultErrorMessage) {
		this.ajaxDefaultErrorMessage = ajaxDefaultErrorMessage;
	}

	public boolean isAjaxShowTechMessage() {
		return ajaxShowTechMessage;
	}

	public void setAjaxShowTechMessage(boolean ajaxShowTechMessage) {
		this.ajaxShowTechMessage = ajaxShowTechMessage;
	}
	
}
