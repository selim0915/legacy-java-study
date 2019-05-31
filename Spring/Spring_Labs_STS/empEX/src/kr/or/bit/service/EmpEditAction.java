package kr.or.bit.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.bit.action.Action;
import kr.or.bit.action.Actionforward;
import kr.or.bit.dao.EmpDao;
import kr.or.bit.dto.EmpDto;

public class EmpEditAction implements Action {

	@Override
	public Actionforward excute(HttpServletRequest request, HttpServletResponse response) {
		int empno = Integer.parseInt(request.getParameter("empno"));
		String ename = request.getParameter("ename");
		String job = request.getParameter("job");
		int mgr = Integer.parseInt(request.getParameter("mgr"));
		String hiredate = request.getParameter("hiredate");
		int sal = Integer.parseInt(request.getParameter("sal"));
		int comm = Integer.parseInt(request.getParameter("comm"));
		int deptno = Integer.parseInt(request.getParameter("deptno"));
		System.out.println(empno);
		
		EmpDto dto = new EmpDto(empno,ename,job,mgr,hiredate,sal,comm,deptno);
		System.out.println(dto.toString());
		EmpDao dao = new EmpDao();
		
		int success = dao.updateEmp(dto);
		if(success!=-1) {
			request.setAttribute("update", "success");
		}else {
			request.setAttribute("update", "fail");
		}
		
		Actionforward forward = new Actionforward();
		forward.setRedirect(true);
		forward.setPath("emplist.do");
		
		return forward;
	}

}
