package kr.or.bit.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class IndexController {
	
	@RequestMapping("/index.htm")
	public String index() {
		System.out.println("인덱스");
		return "home.index";
	}
}
