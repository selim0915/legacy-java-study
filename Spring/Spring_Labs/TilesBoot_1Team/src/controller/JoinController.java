package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/joinus/")
public class JoinController {

	@RequestMapping("join.htm")
	public String join() {
		return "joinus.register";
	}
	
	@RequestMapping("login.htm")
	public String login() {
		return "joinus.login";
	}
}
