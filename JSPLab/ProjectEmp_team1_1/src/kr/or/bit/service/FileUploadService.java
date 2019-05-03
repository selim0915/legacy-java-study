package kr.or.bit.service;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.PicAttachDao;
import kr.or.bit.dto.PicAttach;

public class FileUploadService implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = new ActionForward();
		
		//String uploadpath = application.getRealPath("upload");
		String uploadpath = request.getSession().getServletContext().getRealPath("upload");
		System.out.println("uploadpath  " + uploadpath);
		
		int size = 1024*1024*10;	//10M 네이버 계산기

		
		MultipartRequest multi;
		try {
			multi = new MultipartRequest(request,uploadpath, size, "UTF-8", new DefaultFileRenamePolicy());
			Enumeration filenames = multi.getFileNames();

			int empno = Integer.parseInt(multi.getParameter("empno"));
			String file = (String)filenames.nextElement();
			String filename = multi.getFilesystemName(file);
			
			request.setAttribute("filename", filename);
			
			try {
				PicAttach dto = new PicAttach();
				PicAttachDao dao = new PicAttachDao();
				
				dto.setEmpno(empno);
				dto.setFilename(filename);
				
				int row = dao.insertPicAttach(dto);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			
			forward.setRedirect(false);
			forward.setPath("/WEB-INF/Emp/Upload.jsp");
		} catch (IOException e) {
			e.printStackTrace();
		}
		return forward;
	}
	
}
