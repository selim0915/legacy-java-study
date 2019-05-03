package kr.or.bit.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.PicAttachDao;
import kr.or.bit.dto.PicAttach;

public class ViewFileService implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = new ActionForward();
		
		
		try {
			int empno = Integer.parseInt(request.getParameter("empno")); 
			PicAttach dto = new PicAttach();
			PicAttachDao dao;

			dao = new PicAttachDao();
			dto = dao.selectPicAttachbyEmpNo(empno);
			request.setAttribute("file", dto);
			
			forward.setRedirect(false);
			forward.setPath("WEB-INF/Emp/ViewFile.jsp");
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		
		return forward;
	}

}
