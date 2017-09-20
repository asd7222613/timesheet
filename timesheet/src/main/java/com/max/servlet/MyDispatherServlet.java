package com.max.servlet;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.HttpRequestMethodNotSupportedException;
import org.springframework.web.servlet.DispatcherServlet;
import org.springframework.web.servlet.ModelAndView;

public class MyDispatherServlet extends DispatcherServlet {

	@Override
	protected ModelAndView processHandlerException(HttpServletRequest request, HttpServletResponse response, Object handler,
			Exception exception) throws Exception {
		
		if(exception instanceof HttpRequestMethodNotSupportedException) {
			return new ModelAndView("405");
		}else {   
            return super.processHandlerException(request, response, handler, exception);   
        }  
	}
}
