package ncontroller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class IndexController {
	@RequestMapping("/index.htm")
	public String index() {
		return "home.index";
	}
	
	@RequestMapping("/login.htm")
	public String join() {
		return "joinus.join";
	}
	
	@RequestMapping("/join.htm")
	public String login() {
		return "joinus.login";
	}
	
	//@RequestMapping("/write.htm") 
	//public String notice() { 
	//	return "customer.notice"; 
	//}
	
	//@RequestMapping("/board.htm")
	//public String noticeReg() {
	//	return "customer.noticeReg";
	//}
	
}
