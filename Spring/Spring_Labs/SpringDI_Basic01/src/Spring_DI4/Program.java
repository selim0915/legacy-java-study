package Spring_DI4;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class Program {

	public static void main(String[] args) {
		/*
		 * NewRecordView view = new NewRecordView(); 
		 * NewRecord record = new NewRecord();
		 * view.setRecord(record);
		 * 
		 * xml 설정에서 작업..
		 */

		// view.input();
		// view.print();

		// SpringFramework가 제공하는 메모리(IOC컨테이너) 사용
		// IOC 컨테이널를 만들고, 그 공간안에 객체를 생성하고 조립하는건 xml에게 위임
		ApplicationContext context = new ClassPathXmlApplicationContext("DIConfig.xml");
		
		RecordView view = (RecordView) context.getBean("view");
		view.input();
		view.print();
	}

}
