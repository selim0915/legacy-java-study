package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class IndexController {
	@RequestMapping("/index.htm")
	public String index() {
		//return "index.jsp"; 기존 방법(resolver없이)
		return "home.index";
	}
	@RequestMapping("/drag_drop.htm")
	public String drag_drop() {
		return "board.drag_drop";
	}
	@RequestMapping("/mousehover.htm")
	public String mousehover() {
		return "board.mousehover";
	}
	@RequestMapping("/GIFfile.htm")
	public String GIFfile() {
		return "board.GIFfile";
	}
}
