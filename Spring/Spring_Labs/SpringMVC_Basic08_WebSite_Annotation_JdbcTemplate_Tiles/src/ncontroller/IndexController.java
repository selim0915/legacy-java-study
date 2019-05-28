package ncontroller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class IndexController {
	@RequestMapping("/index.htm")
	public String index() {
		//Tiles 적용전 
		//return "index.jsp";
		
		//적용 후
		return "home.index";
		//name = "home.*";
	}
}
