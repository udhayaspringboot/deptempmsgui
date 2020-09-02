package com.deptempservice.exception;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;
@ControllerAdvice
public class ExceptionHandi {
	
	@ExceptionHandler(Exception.class) public ModelAndView excepti() {
		 
		  return new ModelAndView("exceptionview"); }

}
