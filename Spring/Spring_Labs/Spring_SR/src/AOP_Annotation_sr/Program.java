package AOP_Annotation_sr;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

public class Program {

	public static void main(String[] args) {
		
		 ApplicationContext context = 
					new GenericXmlApplicationContext("classpath:AOP_Annotation_sr/ApplicationContext.xml"); //classpath
			
		 Hello hello = context.getBean("newHello" , Hello.class);
		
		 hello.nameHello("우세림");
		 hello.nameBye("우세림");
	}
	
}
