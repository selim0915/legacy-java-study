package kr.or.bit.service;

import java.sql.Date;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.Empdao;
import kr.or.bit.dto.Emp;

public class EmpSelectJobDeptnoService implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = null;
		
		try {
			Empdao dao = new Empdao();
			List<String> joblist = dao.selectJobList();
			request.setAttribute("joblist", joblist);
			
			List<Integer> deptlist = dao.selectDeptList();
			request.setAttribute("deptlist", deptlist);
			
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("/WEB-INF/Emp/EmpInsert.jsp"); //리스트
			
		} catch (Exception e) {
			e.printStackTrace();
		}

		return forward;
		
	}

}
