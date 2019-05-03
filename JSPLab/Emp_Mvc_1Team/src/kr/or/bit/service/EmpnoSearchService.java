package kr.or.bit.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.Empdao;
import kr.or.bit.dto.Emp;

public class EmpnoSearchService implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = null;
		Empdao empdao = null;
		Emp emp = null;
        JSONObject deptnoinfo = new JSONObject();
        //deptno의 JSON정보를 담을 Array 선언	
		int empno = Integer.parseInt(request.getParameter("empno"));
		System.out.println(empno);
		
		try {
  		  	empdao = new Empdao();
  		    emp = empdao.getEmpnoList(empno);
  		  	request.setAttribute("emplist",emp);
		    
		        //deptno의 한명 정보가 들어갈 JSONObject 선언
		        deptnoinfo = new JSONObject();
		        deptnoinfo.put("empno", emp.getEmpno());
		        deptnoinfo.put("ename", emp.getEname());
		        deptnoinfo.put("job", emp.getJob());
		        deptnoinfo.put("mgr", emp.getMgr());
		        deptnoinfo.put("hiredate", emp.getHiredate().toString());
		        deptnoinfo.put("sal", emp.getSal());
		        deptnoinfo.put("comm", emp.getComm());
		        deptnoinfo.put("deptno", emp.getDeptno());
		        

			System.out.println("데이터 : " + deptnoinfo);
		  	
		  	 request.setAttribute("emplist", deptnoinfo);
  		  	
  		  	 forward = new ActionForward();
  			 forward.setRedirect(false); //forward 방식
  			 forward.setPath("/WEB-INF/Emp/EmpEmpnoSearch.jsp");

		  	}catch(Exception e){
		  		System.out.println(e.getMessage());
		  	}
		return forward;
	}

}
