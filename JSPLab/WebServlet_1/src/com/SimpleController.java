package com;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.naming.java.javaURLContextFactory;

/*
 서블릿(servlet)
 
 java 파일로 웹 서비스를 할 목적으로 만든 파일 (SimpleCOntroller.java)
 서블릿 조건: request, response 객체 사용 가능
 
 1. 서블릿은 반드시 extends HttpServlet을 상속해야한다.
 그래야 (웹환경에서 제공되는 요청, 응답)처리가 가능하더라
 
 2. SimpleController 서블릿
 
 3. 서블릿은 이벤트 기반의 동작이다.(함수가 특정 상황에 맞춰 자동 호출된다)
 [상황: 클라이언트가 simpleController에게  요청 보냇을 때]
 
 전송방식이 GET으로 오면 자동으로 호출되는 함수가 있다. => doGet
 POST 사용시 => doPost
 
 doGet, doPost 공통점
 1. 파라미터를 제공받고 
 2. 응답이 가능하다.
 HttpServletRequest request, HttpServletResponse response
 
 doGet()호출되는 경우 <a href="board.do?id=kim">서버요청</a>
 doPost()호출되는 경우 : form태그 사용 시 <form method="post"> <submit..>
 
 3.1 클라이언트의 정보를 얻어온다. => request
 
 4. 실행단계
 SimpleController (서블릿)자바파일 요청 -> 컴파일 -> 클래스파일생성됨  -> 파일실행
 	-> 결과리턴
 
 5. 자바는 멀티쓰레드를 사용한다 (웹을 효율적으로 다룰 수 있다)
 
 6. 만들어진 순서
 servlet -> jsp -> mvc -> framework(spring)
 
 7. 최종적으로 우리가 원하는 건.
 => model2기반의 MVC패턴을 적용한 프로젝트를 만들예정.
 	7.1 jsp만 가지고 개발하는 방식: model(DAO,DTO)+jsp > model1 
 		(모든 요청은 jsp가 클라이언트 요청을 받고 처리한다)
 	7.2 mvc > model2
 		model(DTO, DAO) >순수한 자바 클래스로 작성
 		views(jsp) > 화면에 출력하는 역할
 		
 		그럼누가 클라이언트의 요청을 받고, 분석, 처리를 할까? => servlet
 		
 		controller를 servlet으로 만든다.
 		controller의 역할
 		1. 클라이언트 요청 파악(로그인, 게시판글쓰기, 상세보기..등에  잘사용)
 		2. 요청 파악 후 (다양한mvc적용): DTO, DAO 객체 생성
 	
 8. 서블릿파일을 클라이언트에서 요청하는방법?
 	-> 지금부터 해보자
 	<form action="loginok.jsp" method="POST">
 	localhostL:8090/WebServlet_1/loginok.jsp?id=kim
 
	8.2 서블릿 파일의 요청은
        1. web.xml 설정을 통해서 주소 만들기
      
        2. servlet 파일의 상단에 : @WebServlet("/SimpleController")
           localhost:8090/WebSErvlet_1/SimpleController
        
               최초 요청 -> servlet 컴파일 -> 실행 -> doGet() 호출 or doPost() 호출
               두번째 -> 실행 -> doGet() 호출 or doPost() 호출
        
    --------------------
	<servlet>
	  	<servlet-name>simplecontroller</servlet-name>
	  	<servlet-class>com.SimpleController</servlet-class>
	</servlet>
	  <!-- 클라이어트가 어떤 주소를 적으면 불러줄꺼야?.. -->
	<servlet-mapping>
	  	<servlet-name>simplecontroller</servlet-name>
	  	<url-pattern>/simple</url-pattern>
	</servlet-mapping>
	localhost:8090/WebSErvlet_1/simple
 
 
 */

//@WebServlet("/SimpleController")
public class SimpleController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SimpleController() {
        super();
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("클라이언트 요청");
		
		//1. 사용자의 요청 파악(요청 값 받기)
		String type = request.getParameter("type");
		
		//2. 요청에 따른 업무 수행 (service 실행)
		Object resultobj = null;
		if(type == null || type.equals("greeting")) {
			resultobj = "hello world";
		} else if(type.equals("date")) {
			resultobj = new java.util.Date();
		} else {
			resultobj = "invalid type";
		}
		
		//3. 요청완료에 따라서 그 결과 요청한 사용자에게 전달
		//정보를 저장 : request객체, session객체, application객체
		request.setAttribute("result", resultobj);
		
		//4. 결과 보여주기 > 필요한 view를 지정한다.
		//화면을 출력한 페이지를 정하고, -> 출력한 데이터를 넘겨 주어야 한다.
		//제어권(forward)
		RequestDispatcher dis = request.getRequestDispatcher("/simpleview.jsp");
		//내가 view로 지정한 곳에 forward작업을 해야한다.
		dis.forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}



























