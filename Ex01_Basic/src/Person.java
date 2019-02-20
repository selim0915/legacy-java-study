//라인주석
//설계도
public class Person {
	private int age; //사람은 나이를 가진다.(나이를 담은 공간)
	private String name; //사람은 이름을 가진다.(이름을 담은 공간)
	
	// 생성자 함수 (특수하다)
	public Person() {
		//객체 생성과 함께 동시에 호출되는 함수
		// -리턴타입이 없다.
		// -클래스이름과 같은 이름을 가진다.
	}
	
	public Person(int age, String name) {
		this.age = age;
		this.name = name;
	}
	
	public void personInfo() {
		System.out.println("정보: "+ this.name +" ,"+this.age);
	}
}
