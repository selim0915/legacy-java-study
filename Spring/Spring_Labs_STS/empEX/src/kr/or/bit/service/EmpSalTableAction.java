package kr.or.bit.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.bit.action.Action;
import kr.or.bit.action.Actionforward;
import kr.or.bit.dao.EmpDao;
import kr.or.bit.dto.EmpChartDto;
import kr.or.bit.dto.EmpDto;

public class EmpSalTableAction implements Action{

	@Override
	public Actionforward excute(HttpServletRequest request, HttpServletResponse response) {
		EmpDao dao = new EmpDao(); 
		List<EmpDto> resultList = dao.getEmpList();
		request.setAttribute("result", resultList);
		Actionforward forward = new Actionforward();
		forward.setRedirect(false);
		forward.setPath("/WEB-INF/chart/chart2.jsp");
		return forward;
	}

}
