package com.model;

import org.springframework.web.multipart.commons.CommonsMultipartFile;

public class Photo {
	private String name;
	private int age;
	private String image; //업로드한 파일명(a.jpg, b.png)
	
	//File UPload POINT//////////
	private CommonsMultipartFile file; //<input type="file" name="***" ..변수명과 이름이 같아야 한다
	
	public CommonsMultipartFile getFile() {
		return file;
	}
	public void setFile(CommonsMultipartFile file) {
		this.file = file;
	}
	/////////////////////////////
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	
	
}
