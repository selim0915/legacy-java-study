package DI_04_Spring;

public class MessageBeanImpl implements MessageBean {

	private String name;
	private String greeting;
	
	//name의 초기화(생성자)
	public MessageBeanImpl(String name) {
		this.name = name;
	}
	
	//greeting의 초기화(setter)
	public void setGreeting(String greeting) {
		this.greeting = greeting;
	}
	
	@Override
	public void sayHello() {
		System.out.println("name: "+this.name + ", greeting: "+this.greeting);
	}

}
