package com.cambak21.controller;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

@ControllerAdvice
public class CommonExceptionHandle {
	private static final Logger logger = LoggerFactory.getLogger(CommonExceptionHandle.class);

	@ExceptionHandler
	public String commonError(Exception ex, HttpServletRequest request, Model model) {
		logger.info("삐용삐용 에러발생 : " +ex.toString());

		// 승권 : 전 주소를 가져와서 해당 주소로 돌아가기 시킴
		String prevURL = request.getHeader("referer") != null ? request.getHeader("referer") : "http://localhost:8081/";
		model.addAttribute("prevURL", prevURL );
		
		return "error";
	}
}
