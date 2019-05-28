package controller;

import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import dao.NoticeDao;
import vo.Notice;


@Controller
public class CustomerController {

	private NoticeDao noticedao;
	@Autowired
	public void setNoticedao(NoticeDao noticedao) {
		this.noticedao = noticedao;
	}
	

	@RequestMapping("notice.db")
	public String notices(String pg , String f , String q , Model model) {
		
		int page=1;
		String field="TITLE";
		String query="%%";
				
		//조건 조합
		if(pg != null && !pg.equals("")) {
			page = Integer.parseInt(pg);
		}
				
		if(f != null && !f.equals("")) {
			field = f;
		}
				
		if(q != null && !q.equals("")) {
			query = q;
		}

		List<Notice> list=null;
		try {
			list = noticedao.getNotices(page, field, query);
		}catch (Exception e) {
			e.printStackTrace();
		} 
		
		
		model.addAttribute("list", list); 
		
		return "customer.notice";
	}
	
	@RequestMapping("noticeDetail.db")
	public String noticeDetail(String seq , Model model) {
		
		Notice notice=null;
		try {
			notice = noticedao.getNotice(seq);
		} catch (Exception e) {
			e.printStackTrace();
		} 
		
		model.addAttribute("notice", notice);
		
		return "customer.noticeDetail";
	}

	@RequestMapping(value="noticeReg.db",method=RequestMethod.GET)
	public String noticeReg() {
		//return "noticeReg.jsp";
		return "customer.noticeReg";
	}
	
	@RequestMapping(value="noticeReg.db",method=RequestMethod.POST)
	public String noticeReg(Notice n, HttpServletRequest request) throws IOException, ClassNotFoundException, SQLException {
			
		 
		   System.out.println("다중 파일 업로드");
		   System.out.println("n :" + n.getTitle());
		   System.out.println("n :" + n.getContent());
		   System.out.println("n 업로드 개수 :" + n.getFiles().size());
		   System.out.println("n :" + n.getFiles().get(0).getName());
		   System.out.println("n :" + n.getFiles().get(1).getName());
		   
		   List<CommonsMultipartFile> files = n.getFiles();
		   List<String> filenames = new ArrayList<>(); //파일명 담아넣기 (DB Insert)
		   
		   if(files != null && files.size() > 0) {
			   for(CommonsMultipartFile multifile : files) {
				    
				    String filename = multifile.getOriginalFilename();
				    String path = request.getServletContext().getRealPath("/customer/upload");
					String fpath = path + "\\" + filename;
			
					if(!filename.equals("")) { //파일 쓰기
						FileOutputStream fs = new FileOutputStream(fpath);
						fs.write(multifile.getBytes());
						fs.close();
					}
					filenames.add(filename); //DB insert 파일명	
			   }
		   }
		   //실 DB INSERT
		   n.setFileSrc(filenames.get(0));
		   n.setFileSrc2(filenames.get(1));
		   
		   noticedao.insert(n);
		   return "redirect:notice.db";
	}

	//글삭제하기
	@RequestMapping("noticeDel.db")
	public String noticeDel(String seq) throws ClassNotFoundException, SQLException {
			
			noticedao.delete(seq);
			System.out.println("seq : " + seq);
			return "redirect:notice.db"; //location.href... 현재 (notice.db 에 view  로 있어서 가능)
		}

   
	@RequestMapping(value="noticeEdit.db",method=RequestMethod.GET)	
	public String noticeEdit(String seq, Model model) throws ClassNotFoundException, SQLException {
		  //getNotice
		  //결과 model 객체에 담고
		 Notice notice =  noticedao.getNotice(seq);
		 model.addAttribute("notice", notice);
		 
		 //return "noticeEdit.jsp"; //forward 
		 return "customer.noticeEdit";
	  }
	
	//글수정하기(수정 처리)
	@RequestMapping(value="noticeEdit.db",method=RequestMethod.POST )
	public String noticeEdit(Notice n , HttpServletRequest request) throws IOException, ClassNotFoundException, SQLException {
		List<CommonsMultipartFile> files = n.getFiles();
		   List<String> filenames = new ArrayList<>(); //파일명 담아넣기 (DB Insert)
		   
		   if(files != null && files.size() > 0) {
			   for(CommonsMultipartFile multifile : files) {
				    
				    String filename = multifile.getOriginalFilename();
				    String path = request.getServletContext().getRealPath("/customer/upload");
					String fpath = path + "\\" + filename;
			
					if(!filename.equals("")) { //파일 쓰기
						FileOutputStream fs = new FileOutputStream(fpath);
						fs.write(multifile.getBytes());
						fs.close();
					}
					filenames.add(filename); //DB insert 파일명	
			   }
		   }
		   //실 DB INSERT
		   n.setFileSrc(filenames.get(0));
		   n.setFileSrc2(filenames.get(1));
		
		   noticedao.update(n);
		   return "redirect:noticeDetail.db?seq="+n.getSeq();

		 
		
	  }

}
