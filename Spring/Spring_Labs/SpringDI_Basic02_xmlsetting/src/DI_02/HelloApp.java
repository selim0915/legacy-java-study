package DI_02;

public class HelloApp {

	public static void main(String[] args) {
		//영문버전
		//MessageBean_en messageBean_en = new MessageBean_en();
		//messageBean_en.sayHello("hong");
		
		//한글버전
		//MessageBean_kr messagaBean_kr = new MessagaBean_kr();
		//messageBean_kr.sayHello("hong");
		
		//interface 다형성 (하나의 참조 변수가 여러개의 주소를 가질 수 있다)
		MessageBean messageBean = new MessageBean_kr();
		messageBean.sayHello("hong");
		messageBean = new MessageBean_en();
		messageBean.sayHello("hong");
	}

}
