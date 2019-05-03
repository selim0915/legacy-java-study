package com.board;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//@WebServlet("/FrontBoardController")
public class FrontBoardController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public FrontBoardController() {
        super();
    }
    
    /*
     Get방식과 POST방식 두가지에 반응하는 함수를 만들고 싶다면..?
     1. HttpServlet에서 제공하는 service()라는 함수가 있다.
     2. 별도의 사용자 정의 함수를 생성해서 만든다 : 보통 doProcess()
     */
    private void doProcess(HttpServletRequest request, HttpServletResponse response, String method) throws ServletException, IOException {
    	//doGet, doPost방식 구분없이 실행되는 함수
    	System.out.println("클라이언트요청: "+ method);
    	
    	//1. 요청받기(get, post) 우린 합쳤다.
    	
    	//2. 요청판단 (판단의 기준) command방식
    	//클라이언트 요청(게시판을 보여, 글쓰기 하겠다, 로그인 하겠다)
    	//2.1 parameter기준으로 판단
    	//2.2 /board?cmd=login?userid=kglim
    	//String command = request.getParameter("cmd");
    	//if(command.equals("login") { 로그인 처리}
    	
    	//cmd >> null >> error.jsp
    	//cmd >> boardlist >> list.jsp
    	//cmd >> boardwrite >> write.jsp
    	
    	//URL방식
    	//전체 주소값을 가지고 판단
    	//board/boardlist >> boardlist
    	//board/boardwrite?title=aaa?content=bbb >> /boardwrite
    	//if(command.equals("/boardlist") {게시판 목록보기}
    	//if(command.equals("/boardwrite") {게시판 글쓰기}
    	
    	
    	//---------------
    	
    	//구현
    	//1. 요청받기 (command 방식)
    	//요청주소
    	//localhost:8090/WebServlet_1/board?cmd=list ...
    	
    	String cmd = request.getParameter("cmd");
    	
    	//2. 요청 판단(업무에 따라 구현)
    	String viewpage = null;
    	//cmd >> null >> error.jsp
    	//cmd >> boardlist >> list.jsp
    	//cmd >> boardwrite >> write.jsp
    	
    	if(cmd == null) {
    		viewpage = "/error/error.jsp";
    	} else if(cmd.equals("boardlist")) {
    		viewpage = "/board/boardlist.jsp";
    		//db연결
    		//select
    		//실행> 결과 >rs > 객체에 담기
    		//boarddao dao = new boarddao();
    		
    		// List<board> boardlist = dao.selectboardlist();
    		//request.setAttribute("list", boardlist);
    		//view page forward방식
    		//<c:set var="list" value="<%= request.getAttribute("list") %>"/>
    		
    		
    	} else if(cmd.equals("boardwrite")) {
    		viewpage = "/board/boardwrite.jsp";
    	} else if(cmd.equals("login")) {
    		viewpage = "/WEB-INF/login/login.jsp";
    	} else {
    		viewpage = "/error/error.jsp";
    	}
    	
    	//문제: WebContent 폴더안에 있는 파일은..
    	//클라이언트가 직접적인 접근이 가능해진다. => 
    	//WebContent > WEB_INF폴더(보안폴더) => 클라이언트가 보안폴더를 접근하면 404처리
    	//localhost:8090/WebServlet_1/board/boardlist.jsp
    	
    	// 1. WEB-INF 접근: 404error
    	// 2. WEB-INF 활용: view >> board >  *.jsp
    	// 						 >> member >  *.jsp
    	//						 >> admin >  *.jsp
    	
    	//내부에서는 서로 접근이 가능
    	//forward 접근 방식을 통해 보안폴더에 접근이 가능하다. (폴더의 파일을 서비스 할 수 있다)
    	
    	// 3. 결과를 만들고 저장
    	//가정 : List<Emp> list = new ArrayList<>();
    	//가정 : list.add(new Emp(2000, "김유신"));
    	//가정 : request.aetSttribute("emplist", list);
    	
    	// 4. view를 지정 > forward (request객체를 공유하게 만든다.)
    	RequestDispatcher dis = request.getRequestDispatcher(viewpage); //dis는 view를 위임받았다.
    	
    	// 5. view에 forward방식을 통해서 출력할 데이터를 전달
    	dis.forward(request, response);
    	
    	//servlet 가지고 있는 request 객체의 주속 >> view 전달 >> view 출력.
    	
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response, "GET");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response, "POST");
	}

}
