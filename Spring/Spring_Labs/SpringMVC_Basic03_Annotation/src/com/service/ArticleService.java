package com.service;

import com.model.NewArticleCommand;

public class ArticleService {
	public ArticleService() {
		System.out.println("ArticleService 생성자 호출");
	}
	
	public void writeArticle(NewArticleCommand command) {
		//DAO객체 생성
		//DAO객체 insert 함수 호출 (DB처리)생략
		System.out.println("글쓰기 작업 완료ㅣ: "+ command.toString());
	}
}
