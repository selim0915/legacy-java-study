package kr.or.bit.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.bit.action.Action;
import kr.or.bit.action.Actionforward;
import kr.or.bit.dao.EmpDao;
import kr.or.bit.dto.EmpChartDto;

public class EmpHiredateTableAction implements Action{

	@Override
	public Actionforward excute(HttpServletRequest request, HttpServletResponse response) {
		EmpDao dao = new EmpDao(); 
		List<EmpChartDto> chartlist = dao.hiredateTable();
		request.setAttribute("result", chartlist);
		Actionforward forward = new Actionforward();
		forward.setRedirect(false);
		forward.setPath("/WEB-INF/chart/chart.jsp");
		return forward;
	}

}
