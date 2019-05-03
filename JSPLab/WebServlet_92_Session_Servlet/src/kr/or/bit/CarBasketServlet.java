package kr.or.bit;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/carbasket")
public class CarBasketServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public CarBasketServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//장바구니 목록보기
    	//session에서 정보 출력
    	response.setContentType("text/html; charset=utf-8");
    	PrintWriter out = response.getWriter();
    	
    	HttpSession session = request.getSession();
    	
    	/*
    	 1. getSession() or getSession(true)
    	 -httpSession이 존재하면 그 존재하는 HttpSession객체를 반환하고
    	 -존재하지 않으면 새로운 세션을 생성
    	 
    	 2. getSession(false)
    	 -HttpSession이 존재하면 현재 HttpSession객체를 반환하고
    	 -존재하지 않으면 null return
    	 */
    	out.print("<html><body>");
    	out.print("<h3>장바구니</h3>");
    	
    	if(session != null) {
    		List<String> list = (ArrayList<String>)session.getAttribute("product");
    		out.print("상품목록: "+ list.toString()+ "<br>");
    	}else {
    		out.print("장바구니 비어있어요<br>");
    	}
    	
    	out.print("<a href='Product.html'>상품구매 페이지 이동</a><br>");
    	out.print("<a href='cardelete'>장바구니 비우기</a><br>");
    	out.print("</html></body>");
	}
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

}
