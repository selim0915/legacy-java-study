package DI_06_Spring;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

public class HelloApp {

	public static void main(String[] args) {
		//요구사항 (Oracle DB를 연동해서 insert 작업을 수행하세요)
		
		//MysqlArticleDao oracle = new MysqlArticleDao();
//		OracleArticleDao oracle = new OracleArticleDao();
//		ArticleService service = new ArticleService(oracle);
//		Article article = new Article();
//		
//		//getbean(service), getbean(article)
//		service.write(article);
		
		ApplicationContext context = 
				new GenericXmlApplicationContext("classpath:DI_06_Spring/DI_06.xml"); //classpath
		
		Article article = context.getBean("article", Article.class);
		ArticleService service = context.getBean("service", ArticleService.class);
		
		service.write(article);
				
		
	}

}
