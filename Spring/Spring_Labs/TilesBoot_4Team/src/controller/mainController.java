package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class mainController{
	@RequestMapping("main.db")
	public String main() {
		System.out.println("ddddd");
		return "main.main";
	}
	
	@RequestMapping("join.db")
	public String join() {
		System.out.println("join");
		return "joinus.joinform";
	}
	@RequestMapping("login.db")
	public String login() {
		System.out.println("login");
		return "joinus.login";
	}
}