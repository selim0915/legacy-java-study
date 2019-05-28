package AOP_Investigate;

import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.context.support.GenericApplicationContext;
public class Program {

	public static void main(String[] args) {

		ApplicationContext context = new AnnotationConfigApplicationContext(Config.class);
		Calc calc = (Calc)context.getBean("resultCalc");
		
		calc.Sum(100, 200);
	}

}
