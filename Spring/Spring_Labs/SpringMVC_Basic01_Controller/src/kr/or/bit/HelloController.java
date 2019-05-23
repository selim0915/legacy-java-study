package kr.or.bit;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import org.springframework.web.servlet.view.InternalResourceViewResolver;

//기존 servlet과 동일한 역할 >> 요청이 오면 > doGET, doPOST, doPROCESS >>>> handleRequest
public class HelloController implements Controller{

	public HelloController() {
		System.out.println("HelloController객체 생성~");
	}
	
	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("HelloController 요청 실행 : handleRequest 함수 실행");
		
		//업무 수행(게시판 목록 보기, 글쓰기)
		ModelAndView mav = new ModelAndView(); //데이터를 담고 view를 지정
		
		mav.addObject("name", "hong"); //request.setAttribute..
		mav.setViewName("Hello"); //view를 별도로 구성하기 위해
		
		return mav;
	}
		
}
