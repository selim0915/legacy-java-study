package kr.or.bit.service;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.Empdao;
import kr.or.bit.dto.Emp;

public class EmpChartService implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = null;
		try {
			request.setCharacterEncoding("UTF-8");
			PrintWriter out = response.getWriter();
			String cp = request.getParameter("cp");
			//최종 완성될 JSONObject 선언(전체)
			JSONObject jsonObject = new JSONObject();
	        //deptno의 JSON정보를 담을 Array 선언
	        JSONArray deptnolist = new JSONArray();
			
			Empdao dao = new Empdao();
			List<Emp> Dlist = dao.getEmpAllList();
			for(int i = 0; i < Dlist.size(); i++) {
				Emp e = Dlist.get(i);
		        //deptno의 한명 정보가 들어갈 JSONObject 선언
		        JSONObject deptnoinfo = new JSONObject();
		        deptnoinfo.put("empno", e.getEmpno());
		        deptnoinfo.put("ename", e.getEname());
		        deptnoinfo.put("job", e.getJob());
		        deptnoinfo.put("mgr", e.getMgr());
		        deptnoinfo.put("hiredate", e.getHiredate().toString());
		        deptnoinfo.put("sal", e.getSal());
		        deptnoinfo.put("comm", e.getComm());
		        deptnoinfo.put("deptno", e.getDeptno());
		        
		        deptnolist.add(deptnoinfo);
			}
			jsonObject.put("emplist", deptnolist);
			
			request.setAttribute("jsonObject", jsonObject);
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		forward = new ActionForward();
		return forward;
	}

}
