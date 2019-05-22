package DI_10_Spring;

import java.util.Properties;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

public class Program {
	public static void main(String[] args) {
		/*
		 * BookClient bookClient = new BookClient();
		 * 
		 * Properties prop = new Properties(); 
		 * prop.setProperty("server","192.168.0.10"); 
		 * prop.setProperty("connectiontimeout", "20000");
		 * bookClient.setConfig(prop); 
		 * bookClient.connect();
		 */
		
		ApplicationContext context = 
				new GenericXmlApplicationContext("classpath:DI_10_Spring/DI_10.xml"); //classpath
		
		BookClient bookClient = context.getBean("bookClient", BookClient.class);
		bookClient.connect();
	}
}
