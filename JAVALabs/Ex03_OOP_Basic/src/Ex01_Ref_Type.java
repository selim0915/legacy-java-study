import kr.or.bit.Person; //사용하지 않아서 노란줄이 뜨는거..
import kr.or.bit.Tv;

public class Ex01_Ref_Type {

	public static void main(String[] args) {
		//type + 변수(클래스의 소문자로 만듬)
		Person person; //stack 영역에 4Byte의 빈 공간이 생김 이름은(person) null;
		person = new Person(); //heap 메모리에 person객체를 만든다. person변수에 주소값을 할당한다.
		System.out.println("person: "+ person); //kr.or.bit.Person@15db9742
		
		person.age = 21;
		person.name = "woo se";
		person.print();
		System.out.println("person: "+ person.age + "/" +person.name);
		
		
		// person, person2: 주소값을 가지고 있으면 (Ref타입: 참조타입)
		Person person2 = new Person(); //선언과 할당을 동시에
		person2.name = "kim su";
		person2.age = 43;
		person2.print();
		
		int num  = 100; //local variable (지역변수) 메소드안에 있음, 초기화 필요
		System.out.println(num); // num: 값이 들어있으면 (Value타입: 값타입)
		
		Person you = person; 
		//The local variable you may not have been initialized
		//참조타입의 초기화라는 것은 주소값을 가지는 것.
		//주소값을 가지기 위해선 new 가 필요하다.
		/*
		 * 참조변수가 초기값을 가지기 위한 방법
		 * 1. new 연산자를 사용한다
		 * 		( you = new Person();)
		 * 2. 다른 참조변수가 가지는 주소를 할당 받으면 된다.
		 * 		( you = person;) //you, person은 한몸이 된다.
		 */
		System.out.println("you: " +you);
		System.out.println("person: " + person);
		System.out.println("you == person: " + (you == person)); //==값을 비교(주소값을 비교하게 됨)
		
		Tv t = new Tv();
		t.brandname = "삼성";
		System.out.println("기본채널: " + t.ch); //0
		System.out.println("브랜드: " + t.brandname); //null
		
		
		t.ch_up(); //1
		System.out.println("변경 된 채널: "+ t.ch);
		
		System.out.println("전원: "+ t.power);
		t.power_on();
		System.out.println("전원: "+ t.power);
		t.ch_up(); //1
		t.ch_up(); //2
		t.ch_up(); //3
		System.out.println("변경 된 채널: "+ t.ch);
		t.ch_down(); //2
		System.out.println("변경 된 채널: "+ t.ch);
		t.power_off();
		
		System.out.println("전원: "+ t.power);
		t.power_on();
		t.ch_up();
		System.out.println("변경 된 채널: "+ t.ch);
		
		
	}

}
