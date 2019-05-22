package AOP_Annotation_kh;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

public class Program {

	public static void main(String[] args) {
		ApplicationContext context = new GenericXmlApplicationContext("classpath:AOP_Annotation_kh/ApplicationContext.xml");
		Alphabet alph = context.getBean("printAlphabet", Alphabet.class);
		
		String result = alph.AlphabetSection('a', 'e');
		System.out.println(result);
	}

}
