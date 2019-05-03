package kr.or.bit.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.Empdao;
import kr.or.bit.dto.Emp;

public class EmpDeleteService implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = null;
		
		int empno = Integer.parseInt(request.getParameter("empno"));
		int result = 0;
		
		try {
			request.setCharacterEncoding("UTF-8");
			
			Empdao dao = new Empdao();
			result = dao.deleteEmp(empno);
			
			String msg = "";
			String url = "";

			if (result > 0) {
				msg = "등록성공";
				url = "MemoList.memo";
			} else { // -1 (제약, 컬럼길이 문제)
				msg = "등록실패";
				url = "memo.html";
			}
			
			request.setAttribute("board_msg", msg);
			request.setAttribute("board_url", url);

			forward = new ActionForward();
			forward.setRedirect(false); // forward 방식
			forward.setPath("/index.html");

		} catch (Exception e) {
			e.printStackTrace();
		}

		return forward;
	}

}
