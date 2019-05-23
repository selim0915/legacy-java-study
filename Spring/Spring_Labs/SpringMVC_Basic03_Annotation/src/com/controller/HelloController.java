package com.controller;

import java.util.Calendar;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/*
 접근자 class 클래스명 implement Controller
 =>단점: 컨트롤러 1개가 요청1개만 처리
 
 결국 요청이 10개면 10개의 컨트롤러를 만들어야 할까?
 
 그 대안 => Annotation
 
 Annotation을 사용하면 method단위의 매핑을 할 수 있다.
 결국: 하나의 클래스가 요청 10개를 처리할 수 있다. > 함수 10개를 만들어서
 
 @Controller 사용하면 > 함수단위의 매핑이 가능해진다.
 @requestMapping > 함수단위 매핑
 */

@Controller
public class HelloController {
	
	@RequestMapping("/hello.do") //hello.do 요청이 들어오면 함수 실행
	public ModelAndView hello() {
		System.out.println("[hello.do start]");
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("greeting", getGreeting());
		mv.setViewName("Hello");
		return mv;
	}
	
	//필요하다면 일반 함수를 만들어서 사용이 가능하다.
	public String getGreeting() {
		int hour = Calendar.getInstance().get(Calendar.HOUR_OF_DAY);
		String data="";
		if (hour >= 6 && hour<=10) {
			data="학습시간";
		} else if (hour >=11 && hour<=15) {
			data="배고픈 시간";
		} else if (hour>=16 && hour<=18) {
			data="졸려운 시간";
		} else {
			data="go home";
		}
		
		return data;
	}
	
}
