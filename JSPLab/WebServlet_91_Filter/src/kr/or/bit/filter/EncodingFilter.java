package kr.or.bit.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//@WebServlet("/EncodingFilter")
public class EncodingFilter implements Filter {

	String encoding;
	
	public void init(FilterConfig fConfig) throws SecurityException{
		/*
		  <filter>
		  	<filter-name>EncodingFilter</filter-name>
		  	<filter-class>kr.or.bit.filter.EncodingFilter</filter-class>
		  	<init-param>
		  		<param-name>encoding</param-name>
		  		<param-value>UTF-8</param-value>
		  	</init-param>
		  </filter>
		 */
		this.encoding = fConfig.getInitParameter("encoding");
		System.out.println("Filter init: "+this.encoding );
	}
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		
		//pass the request along the filter chain
		
		//request (요청이 왔을 때 구현되는 보조(공통) 관심 코드
		if(request.getCharacterEncoding()==null) {
			System.out.println("Before: "+request.getCharacterEncoding());
			
			request.setCharacterEncoding(this.encoding);
			
			System.out.println("After: "+request.getCharacterEncoding());
		}
		chain.doFilter(request, response);
		
		System.out.println("response 응답 처리^^");
	}

}
