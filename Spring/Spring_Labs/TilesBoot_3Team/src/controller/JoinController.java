package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class JoinController {
	
	@RequestMapping("join.htm")
	public String join() {
		return "joinus.join";
	}
	
	//로그인 페이지
	@RequestMapping("login.htm")
	public String login() {
		//return "login.jsp";
		return "joinus.login";//폴더명.파일명
	}
}
