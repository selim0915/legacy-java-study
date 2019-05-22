package DI_01;

public class HelloApp {
	public static void main(String[] args) {
		MessageBean messageBean = new MessageBean();
		messageBean.sayHello("hong");
	}
	
	//요구사항
	//영문버전: hello hong!
	//한글버전: 안녕 hong!
	
	//Message_kr > 함수 > sayHello
	//Message_en > 함수 > sayHello
	
	//위 두개의 클래스에 대해서 interface를 구현하면( 다형성)
}
