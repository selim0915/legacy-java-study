package kr.or.bit.service;

import java.sql.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.Empdao;
import kr.or.bit.dto.Emp;

public class EmpAddService implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response){
		ActionForward forward = null;
		
		int empno = Integer.parseInt(request.getParameter("empno"));
		String ename = request.getParameter("ename");
		String job = request.getParameter("job");
		int mgr = Integer.parseInt(request.getParameter("mgr"));
		String hiredate = request.getParameter("hiredate");
		int sal = Integer.parseInt(request.getParameter("sal"));
		int comm = Integer.parseInt(request.getParameter("comm"));
		int deptno = Integer.parseInt(request.getParameter("deptno"));
		int result = 0;
		System.out.println("service 받아온 값을 봅시다.");
		System.out.println("empno: "+ empno);
		System.out.println("ename: "+ ename);
		System.out.println("job: "+ job);
		System.out.println("mgr: "+ mgr);
		System.out.println("hiredate: "+ hiredate);
		System.out.println("sal: "+ sal);
		System.out.println("comm: "+ comm);
		System.out.println("deptno: "+ deptno);
		
		
		try {
			request.setCharacterEncoding("UTF-8");
			Emp emp = new Emp();
			emp.setEmpno(empno);
			emp.setEname(ename);
			emp.setJob(job);
			emp.setMgr(mgr);
			emp.setHiredate(Date.valueOf(hiredate));
			emp.setSal(sal);
			emp.setComm(comm);
			emp.setDeptno(deptno);
			System.out.println("emplist: "+ emp.toString());
			
			Empdao dao = new Empdao();
			result = dao.insertEmp(emp);

			String msg = "";
			String url = "";

			if (result > 0) {
				msg = "등록성공";
				url = "MemoList.memo";
			} else { // -1 (제약, 컬럼길이 문제)
				msg = "등록실패";
				url = "memo.html";
			}
			request.setAttribute("msg", msg);
			request.setAttribute("url", url);

			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("/Emplist.do"); //리스트

		} catch (Exception e) {
			e.printStackTrace();
		}

		return forward;
	}

}
