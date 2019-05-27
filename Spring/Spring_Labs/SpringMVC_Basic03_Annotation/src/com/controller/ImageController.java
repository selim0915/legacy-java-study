package com.controller;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.model.Photo;

@Controller
@RequestMapping("/image/upload.do") //GET , POST
public class ImageController {
	
	@RequestMapping(method=RequestMethod.GET)
	public String form() {
		System.out.println("image.jsp forward");
		return "image/image";
	}
	
	@RequestMapping(method=RequestMethod.POST)
	public String submit(Photo photo , HttpServletRequest request) throws IOException {
		/*
		submit(Photo photo)
		1. 자동화 <form 태그 input 태그 name 속성값이 클래스의 memberfield 명과 같아야 한다  
		
		요청 >>   submit(Photo photo
		내부적으로 ...
		Photo photo = new Photo();
		photo.setName("홍길동");
		photo.setAge(100);
		photo.setImage("업로드한 파일명");  입력을 별도로  << imagefile.getName()
		
		업로드한 파일은
		private CommonsMultipartFile file
		이름이 >> file
		<input type="file" name="file">
		POINT: 
		CommonsMultipartFile imagefile = photo.getFile();
		imagefile.getName()
		imagefile.getBytes().length
		imagefile.getOriginalFilename()
		  
		*/
		
		CommonsMultipartFile imagefile = photo.getFile();
		System.out.println(imagefile.getName());
		System.out.println(imagefile.getBytes().length);
		System.out.println(imagefile.getOriginalFilename());
		
		photo.setImage(imagefile.getName()); //DB insert 파일명
		
		//실 파일 업로드/////////////////////////////////////////////
		String filename= imagefile.getOriginalFilename();
		String path = request.getServletContext().getRealPath("/upload");
		
		String fpath = path + "\\"+ filename; //C:\\temp\\a.jpg
		
		FileOutputStream fs = new FileOutputStream(fpath);
		fs.write(imagefile.getBytes());
		fs.close();
		//////////////////////////////////////////////////////////
		return "image/image";
	}
	
}
