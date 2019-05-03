package com;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class NowServlet
 */
@WebServlet(
		description = "이 서블릿은 서버시간을 처리하는 파일 입니다.", 
		urlPatterns = { 
				"/NowServlet", 
				"/Now.do", 
				"/Now.action", 
				"/my.star"
		}, 
		initParams = { 
				@WebInitParam(name = "id", value = "bit", description = "id값을 초기화값으로 설정"), 
				@WebInitParam(name = "jdbcDriver", value = "oracle.jdbc.OracleDriver", description = "오라클 드라이버 클래스 제공")
		})
public class NowServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public NowServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	public void init(ServletConfig config) throws ServletException {
		/*
		  초기화 함수(자동으로 호출되는 함수) : 특정이벤트
		  호출시점: NowServlet클래스에 대한 [최초 요청시 한번 만 실행]
				(서버재시작, 개발자 코드수정시 (다시 컴파일시))
				
		 
		 서버오픈(it.co.kr) > WAS (안에 Nowservlet.java)
		 홍길동 첫 번째 접속자 > it.co.kr/NowServlet 서버요청
		 NowServlet.java파일 > 실행(class) -> init함수 자동호출 -> doGet,doPost
		 
		 김유신 두 번째 접속자 > it.co.kr/NowServlet 서버요청
		 (컴파일 파일 있으니까) 실행(class) -> doGet, doPost
		 .
		 .
		 
		 init: 다른 클래스 참조, 공콩자원 초기화, 특정자원 로드
		 Class.forName() : 모든함수가 사용가능
		 @WebInitParam 설정 처리
		 
		 
		*/
		
		String drivername = config.getInitParameter("jdbcDriver");
		System.out.println("최초 요청 한번 실행 : 드라이버 로딩 "+ drivername);
		
		
		
	}

	/*
	 * protected void service(HttpServletRequest request, HttpServletResponse
	 * response) throws ServletException, IOException {
	 * System.out.println("service 함수 호출 doGet, doPost의 운명은.."); }
	 */

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doGet");
		
		//현재는 JSP라 페이지가 개발되지 않은 상황
		//servlet (모든 처리 : UI 구성)
		request.setCharacterEncoding("UTF-8");
		
		//request.getParameter(name)
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.print("<html>");
		out.print("<head><title>HELLO</title></head>");
		out.print("<body>");
		out.print("현재날짜 :"+ new Date() + "<br>");
		out.print("<script>alert('경고')</script>");
		out.print("</body>");
		out.print("</html>");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doPost");
	}

}
