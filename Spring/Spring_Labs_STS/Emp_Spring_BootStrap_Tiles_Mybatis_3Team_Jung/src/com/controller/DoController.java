package com.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import dao.EmpDao;
import dto.EmpDto;

@Controller
public class DoController {

	private SqlSession sqlsession;

	@Autowired
	public void setSqlsession(SqlSession sqlsession) {
		this.sqlsession = sqlsession;
	}

	@RequestMapping("/index.do")
	public String index() {
		System.out.println("인덱스");
		return "home.index";
	}

	@RequestMapping("/signin.do")
	public String Login() {
		return "home.login";
	}

	@RequestMapping("/signup.do")
	public String main() {
		return "home.joinForm";
	}

	@RequestMapping(value = { "/emplist.do", "/edit.do" })
	public String empList(@RequestParam(value = "empno", defaultValue = "null") String empno, Model model) {
		EmpDao dao = sqlsession.getMapper(EmpDao.class);

		if (empno.equals("null")) {
			List<EmpDto> resultList = dao.getEmpListAll();
			model.addAttribute("result", resultList);
			return "home.emplist";
		} else {
			EmpDto resultOne = dao.getEmpList(empno);
			model.addAttribute("resultOne", resultOne);
			return "home.empEdit";
		}
	}

	@RequestMapping(value = "/delete.do")
	public ModelAndView deleteEmp(@RequestParam(value = "empno") String empno) {
		EmpDao dao = sqlsession.getMapper(EmpDao.class);
		dao.updateFakeEmp(empno);
		ModelAndView mav = new ModelAndView();
		RedirectView view = new RedirectView();
		view.setUrl("emplist.do");
		view.setExposeModelAttributes(false);
		mav.setView(view);
		return mav;
	}

	@Async
	@RequestMapping(value = "/checkEmpnoAjax.do")
	public void isCheckByEmpno(@RequestParam(value = "empno") String empno, HttpServletResponse response)
			throws IOException {
		EmpDao dao = sqlsession.getMapper(EmpDao.class);
		if (dao.isCheckByEmpno(empno) == null) {
			PrintWriter out = response.getWriter();
			out.print("false");
		} else {
			PrintWriter out1 = response.getWriter();
			out1.print("true");
		}

	}

	@Async
	@RequestMapping(value = "/addemp.do")
	public void AddEmpMember(EmpDto empdto, HttpServletResponse response) throws IOException {
		EmpDao dao = sqlsession.getMapper(EmpDao.class);
		PrintWriter out = response.getWriter();
		int totalMember = dao.totalEmpMemberCount()+1;
		if (dao.AddEmpMember(empdto) != null) {
			out.print("<tr><td class='text-center'>"+totalMember+"</td><td class='text-center'>"+empdto.getEmpno()+"</td>" + 
					"            <td class='text-center'>"+empdto.getEname()+"</td>" + 
					"            <td class='text-center'>"+empdto.getJob()+"</td>" + 
					"            <td class='text-center'>"+empdto.getMgr()+"</td>" + 
					"            <td class='text-center'>"+empdto.getHiredate()+"</td>" + 
					"            <td class='text-center'>"+empdto.getSal()+"</td>" + 
					"            <td class='text-center'>"+empdto.getComm()+"</td>" + 
					"            <td class='text-center'>"+empdto.getDeptno()+"</td>" + 
					"            <td class='td-actions text-center'>" + 
					"                <button type='button' rel='tooltip' class='btn btn-info btn-sm btn-icon'" + 
					"                name='"+empdto.getEname()+"' title='"+empdto.getEname()+"'s 프로필 사진등록'>" + 
					"                    <i class='far fa-address-card'></i>" + 
					"                </button>" + 
					"                <button type='button' rel='tooltip' class='btn btn-success btn-sm btn-icon'" + 
					"                onclick='location.href='edit.do?empno="+empdto.getEmpno()+"''" + 
					"                name='"+empdto.getEmpno()+"' id='"+empdto.getEmpno()+"' title='"+empdto.getEname()+"'s 정보수정'>" + 
					"                    <i class='fas fa-user-cog'></i>" + 
					"                </button>" + 
					"                <button type='button' rel='tooltip' class='btn btn-danger btn-sm btn-icon'" + 
					"                onclick='location.href='delete.do?empno="+empdto.getEmpno()+"''" + 
					"                 name='"+empdto.getEmpno()+"' id='"+empdto.getEmpno()+"' title='"+empdto.getEname()+"'s 삭제하기'>" + 
					"                    <i class='fas fa-user-slash'></i>" + 
					"                </button></td></tr>");
		} else {
			out.print("FALSE");
		}

	}
	
	@RequestMapping(value="/editok.do")
	public ModelAndView updateEmp(EmpDto empdto) {
		EmpDao dao = sqlsession.getMapper(EmpDao.class);
		dao.updateEmp(empdto);
		ModelAndView mav = new ModelAndView();
		RedirectView view = new RedirectView();
		view.setUrl("emplist.do");
		view.setExposeModelAttributes(false);
		mav.setView(view);
		return mav;
	}

}
