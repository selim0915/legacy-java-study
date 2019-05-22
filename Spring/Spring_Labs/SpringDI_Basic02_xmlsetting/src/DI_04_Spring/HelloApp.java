package DI_04_Spring;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

public class HelloApp {

	public static void main(String[] args) {
		//java코드
		//MessageBeanImpl messagebean = new MessageBeanImpl("hong"); //생성자 초기화
		//messagebean.setGreeting("hello"); //setter 초기화
		
		//interface로 설계해놈 (MessageBean)
		//messagebean.sayHello();
		
		//위 설정 작업을 xml작업을 통해서 .. Spring
		ApplicationContext context = 
				new GenericXmlApplicationContext("classpath:DI_04_Spring/DI_04.xml"); //classpath
		
		MessageBean message = context.getBean("m2", MessageBean.class); //"찾으려는 객체이름=xml id", 타입
		message.sayHello();
	}

}
