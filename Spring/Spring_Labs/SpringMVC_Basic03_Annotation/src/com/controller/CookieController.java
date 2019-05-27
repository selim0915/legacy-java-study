package com.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.multipart.commons.CommonsFileUploadSupport;

@Controller
public class CookieController {
	//필요하다면
	//함수를 만들 때
	//handleRequest(HttpServletRequest request, HttpServletResponse response)
	@RequestMapping("/cookie/make.do")
	public String make(HttpServletResponse response) {
		response.addCookie(new Cookie("auth", "1004"));
		
		return "cookie/CookieMake";
	}
	
	@RequestMapping("/cookie/view.do") //request기존 방식 사용
	public String view(@CookieValue(value="auth", defaultValue="0") String auth) {
		System.out.println("클라이언트에서 read한 쿠키값 : " +auth);
		return "cookie/CookieView";
	}
		
		
}
