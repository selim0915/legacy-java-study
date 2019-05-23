package com.controller;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.model.NewArticleCommand;
import com.service.ArticleService;

/*
 클라이언트 요청 -글쓰기
 1. 화면을 보여주세요 -글쓰기화면 -write.do
 2. 처리해주세요 -글쓰기처리 -writeok.do
 
 /article/newArticle.do (GET, POST) >> 요청 method (GET)-화면, method(POST)-처리
 하나의 요청: 화면, 처리
 
 
 */
@Controller
@RequestMapping("/article/newArticle.do") // method GET,POST
public class NewArticleController {

	// NewArticleController 와 ArticleService
	private ArticleService articleService;

	@Autowired
	public void setArticleservice(ArticleService articleService) {
		this.articleService = articleService;
	}

	// GET방식 요청(사용자 화면단 제공)
	@RequestMapping(method = RequestMethod.GET)
	public String form() {
		System.out.println("GET 방식에 대한 요청");
		return "article/newArticleForm";

		// ViewResolver에 의해서
		// /WEB-INF/views/ + article/newArticleForm + .jsp
	}

	/*
	 * 1. 전통적으로 사용하는 Client 요청 데이터 받는 방법 
	 * public String submit(HttpServletRequest request){ 
	 * 	request.getParameter("title"); 
	 * } 
	 * => 더이상 사용하지 않는다.
	 @RequestMapping(method=RequestMethod.POST) public String
	 * submit(HttpServletRequest request) { 
	 * NewArticleCommand article = new NewArticleCommand();
	 * article.setParentId(Integer.parseInt(request.getParameter("parentId")));
	 * article.setTitle(request.getParameter("title"));
	 * article.setContent(request.getParameter("content"));
	 * 
	 * //ArticleService articleService = new ArticleService();
	 * articleService.writeArticle(article); return "article/newArticleSubmitted"; }
	 
	 
	 
	 
	 
	 * 
	 * 2. parameter DTO타입을 명시
	 * public String submit(NewArticleCommand command) {
	 * 동작동리 JPS(Userbean Action 태그 : setProperty)
	 * 
	 * input name="이름" >> dto객체 memberfield 같다면 ..setter
	 * 
	 * submit(NewArticleCommand command)
	 * DTO타입의 memberfield명과 parameter이름이 같다면
	 * 1. 자동으로 DTO 객체 생성 : NewArticleCommand command = new NewArticleCommand()
	 * 2. 넘어온 parameter 값을 setter통해서 자동 주입
	 * 1.1 NewArticleCommand 객체 IOC컨테이너 안에서 생성 id="newArticleCommand" 자동생성
	 * 
	 * 원칙:
	 * ModelAndView mv = new ModelAndView()
	 * mv.addObject("newArticleCommand", command);
	 * return mv
	 * 
	 * 1.2 위 원칙이 없어도 view페이지에 DTO객체 자동으로 forward (KEY PoINT : NewArticleCommand)
	 * 
	 * 다시한번 정리하면
	 * 1.submit(NewArticleCommand command)
	 * >>자동 객체 생성, 주입, 객체변수명이 자동(key) : newArticleCommand
	 * >>forward >> view page전달
	 * 
	 * 2. 객체이름이 자동으로 생성되는 게 싫어요~
	 * submit(@ModelAttribute("Article" NewArticleCommand command)
	 * => 자동으로 생성되는 객체변수명이 Article로 강제 된다.
	 * 
	 * 3.별도의 모델객체 생성방법( 넘어간다) 
	 * Model.addAttribute("Articledata", new NewArticleCommand)
	 */
	
	
	
	// POST 방식 요청(글쓰기 처리)
	@RequestMapping(method = RequestMethod.POST)
	public String submit(@ModelAttribute("Articledata") NewArticleCommand command) {
		articleService.writeArticle(command);
		return "article/newArticleSubmitted";
	}
}
