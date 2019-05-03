package kr.or.bit.service;

import java.sql.Date;
import java.util.List;
import java.util.Map;

import javax.naming.NamingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.Empdao;
import kr.or.bit.dto.Emp;

public class EmpUpdate_dataService implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = null;
		Empdao empdao = null;
		Emp emp = null;
		
		try {
			request.setCharacterEncoding("UTF-8");
			
			empdao = new Empdao();
			emp= new Emp();
			
			List<String> joblist = empdao.selectJobList();
			List<Integer> deptList = empdao.selectDeptList();
			
			
			emp = empdao.getEmpnoList(Integer.parseInt(request.getParameter("empno")));
			request.setAttribute("emp", emp);
			request.setAttribute("joblist", joblist);
			request.setAttribute("deptList", deptList);

			forward = new ActionForward();
			forward.setRedirect(false); // forward 방식
			forward.setPath("/WEB-INF/Emp/EmpUpdate.jsp");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return forward;
	}

}
