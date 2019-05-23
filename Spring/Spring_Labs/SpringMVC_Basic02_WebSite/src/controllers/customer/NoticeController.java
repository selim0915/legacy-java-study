package controllers.customer;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import dao.NoticeDao;
import vo.Notice;


//게시판 목록보기 업무 컨트롤러
//service > Dao > dao함수호출 > 결과받기
//NoticeController 와 NoticeDao관계 ?
//NoticeController는 NoticeDao에 의존한다.

public class NoticeController implements Controller{
	
	public NoticeController() {
		System.out.println("[NoticeController]");
	}
	
	private NoticeDao noticedao;
	//NoticeDao noticedao = new NoticeDao(); //new를 직접적으로 하지않는다 =>injection(setter)
	
	//setter 주입
	public void setNoticedao(NoticeDao noticedao) {
		this.noticedao = noticedao;
	}
	
	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// 게시판 목록보기(목록보기 서비스)
		
		// 검색 처리
		String _page = request.getParameter("pg");
		String _field = request.getParameter("f");
		String _query = request.getParameter("q");
		
		// 검색처리 (null) default값 처리
		int page=1;
		String field = "TITLE";
		String query="%%";
		
		// 조건 처리
		if(_page != null && !_page.equals("")) {
			page = Integer.parseInt(_page);
		}
		if(_field != null && !_field.equals("")) {
			field = _field;
		}
		if(_query != null && !_query.equals("")) {
			query = _query;
		}
		
		// DAO 객체 데이터목록 받아오기
		List<Notice> list = noticedao.getNotices(page, field, query);
		
		// SpringMVC (ModelAndView) >> 기존 request.setAttribute("list", list).. forward ..
		ModelAndView mav = new ModelAndView();
		mav.addObject("list",list);
		mav.setViewName("notice.jsp");
		
		return mav;
	}

}
