package ncontroller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class IndexController {
	
	@RequestMapping("/index.htm")
	public String index() {
		System.out.println("아잉1");
		return "home.index";
	}
	
	@RequestMapping("/blog.htm")
	public String blog() {
		System.out.println("아잉2");
		return "home.blog";
	}
	
	@RequestMapping("/contact.htm")
	public String contact() {
		System.out.println("아잉3");
		return "home.contact";
	}
	
	@RequestMapping("/portfolio.htm")
	public String portfolio() {
		System.out.println("아잉4");
		return "home.portfolio";
	}
	
	@RequestMapping("/about.htm")
	public String about() {
		System.out.println("아잉4");
		return "home.about";
	}
	
}
