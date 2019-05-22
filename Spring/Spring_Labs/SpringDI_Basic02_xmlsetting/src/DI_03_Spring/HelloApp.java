package DI_03_Spring;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

public class HelloApp {

	public static void main(String[] args) {
		//영문버전
		//MessageBean_en messageBean_en = new MessageBean_en();
		//messageBean_en.sayHello("hong");
		
		//한글버전
		//MessageBean_kr messagaBean_kr = new MessagaBean_kr();
		//messageBean_kr.sayHello("hong");
		
		//interface 다형성 (하나의 참조 변수가 여러개의 주소를 가질 수 있다)
		//MessageBean messageBean = new MessageBean_kr();
		//messageBean.sayHello("hong");
		//messageBean = new MessageBean_en();
		//messageBean.sayHello("hong");
		
		ApplicationContext context = new GenericXmlApplicationContext("classpath:DI_03_Spring/DI_03.xml"); //classpath
		//필요하다면 컨테이너(context)안에서 객체를 반환받아 사용한다.
		MessageBean message = context.getBean("message", MessageBean.class); //"찾으려는 객체이름=xml id", 타입
		message.sayHello("hong");
	}

}
