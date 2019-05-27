package com.service;

import com.model.NewArticleCommand;

//@Service하면 xml설정에서
//<context:component-scan base-package="com.controller" />
//작성할 필요없다.
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
