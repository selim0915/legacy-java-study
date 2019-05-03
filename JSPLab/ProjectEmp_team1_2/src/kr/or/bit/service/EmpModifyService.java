package kr.or.bit.service;

import java.sql.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.Empdao;
import kr.or.bit.dto.Emp;

public class EmpModifyService implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = null;
		Emp emp = new Emp();
		
		try {
			request.setCharacterEncoding("UTF-8");
			
			int empno = Integer.parseInt(request.getParameter("empno"));
			String ename = request.getParameter("ename");
			String job = request.getParameter("job");
			int sal = Integer.parseInt(request.getParameter("sal").replace(",", ""));
			int comm = Integer.parseInt(request.getParameter("comm").replace(",", ""));
			int mgr = Integer.parseInt(request.getParameter("mgr"));
			String hiredate = request.getParameter("hiredate");
			int deptno = Integer.parseInt(request.getParameter("deptno"));
	  	  
			emp.setMgr(mgr);
			emp.setEmpno(empno);
			emp.setComm(comm);
			emp.setEname(ename);
			emp.setJob(job);
			emp.setSal(sal);
			emp.setHiredate(Date.valueOf(hiredate));
			emp.setDeptno(deptno);

			Empdao dao = new Empdao();
			int result = dao.updateEmp(emp);

			String msg = "";
			if (result > 0) {
				msg = "등록성공";
			} else { // -1 (제약, 컬럼길이 문제)
				msg = "등록실패";
			}

			forward = new ActionForward();
			forward.setRedirect(false); // forward 방식
			forward.setPath("/WEB-INF/Emp/EmpDeUp.jsp");

		} catch (Exception e) {
			e.printStackTrace();
		}
		return forward;
	}

}
