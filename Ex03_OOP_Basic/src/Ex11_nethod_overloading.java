import java.util.Arrays;

/*
 * 객체 지향 언어의 특징
 * 상속,캡슐,다형
 * 
 * 캡슐화, 은닉화: private 
 * [method overloading]
 * 하나의 이름으로 여러가지 기능을 하는 함수(ex println())
 * 사용: println()
 * 특징: 성능향상에 도움을 주진 않는다.
 * 		그런데 왜 쓸까? => 개발자가 편하게 사용하기 위해서
 * 언제 사용할까? 어떤점을 고려할까?
 * => 함수에 사용이 많을때, 
 * 
 * 문법: 함수의 이름은 같게, 파라미터의 개수와 타입을 다르게 한다.
 * 1.함수 이름은 같아야 한다.
 * 2.prameter 개수, type이 달라야한다.
 * 3.return type은 오버로딩의 판단 기준이 아니다
 * 4.parameter의 순서가 다름은 인정한다.
 */
class Human {
	String name;
	int age;
}

class OverTest {
	int add(int i) {
		return 100 + i;
	}

	String add(String s) {
		return "hello " + s;
	}

	int add(int i, int j) {
		return i + j;
	}

	void add(int i, String s) {
		System.out.println("오버로딩");
	}

	void add(String s, int i) {
		System.out.println("오버로딩"); // 자바의 오버로딩은 파라미터의 순서가 다름을 인정한다.
	}

	// *
	void add(Human h) { // 클래스도 타입이다.
		h.name = "홍길동";
		h.age = 100;
		System.out.println(h); // 휴먼의 주소값이 들어있다고 생각하며 작성 //주소값 출력
		// 실제로 사용할땐 주소값을 만들어야한다. (없다면..)
	}

	// 안되는것
	// void add(int k) {} //같은 파라미터, 변수이름은 같게친다.

	/*
	 * 오버로딩: 하나의 이름으로 여러 기능을 하는것 파라미터와 타입을 가지고 메소드를 만든다.
	 * 
	 * [Array] int[] source = {1,2,3,4,5};
	 */
	int[] add(int[] param) { // parameter로 int[]의 주소값을 받겠다.
		int[] target = new int[param.length];
		for (int i = 0; i < param.length; i++) {
			target[i] = param[i] + 1;
		}
		return target; // int 타입의 배열의 주소값을 리턴
	}
	
	int[] add(int[]so, int[]so2) {
		//so함수에 배열 2배 크기로 담기
		int[] arr1 = new int[so.length];
		
		for (int i = 0; i < so.length; i++) {
			so2[i] = so[i]*2;
		}
		
		return so2;
	}

}

public class Ex11_nethod_overloading {

	public static void main(String[] args) {
		System.out.println();

//		OverTest ot = new OverTest();
//		//정수 메소드
//		System.out.println(ot.add(0));
//		
//		ot.add(100,"h");
//		ot.add("h",100);
//		
//	    Human human = new Human();
//	    ot.add(human);
//	    System.out.println(human.name);
//	    System.out.println(human.age);
//	    
//	    ot.add(new Human()); //새로운 휴먼객체를 만든것, ()안에는 새로운 휴먼의 주소값이 입력된다.
		// 그러니 아까 주소값이랑 다를것,

		// 정수만 했기때문에 안된다.
		// System.out.println(ot.add(3.1));

		OverTest ot = new OverTest();
		int[] source = {10,20,30,40,50};
		System.out.println(source);
		
		int[] target = ot.add(source);
		
		for(int i=0; i<target.length; i++) {
			System.out.println(target[i]);
		}
		
		int[] aa = {10,20,30,40,50};
		int[] bb = {90,80,70,60,50};
		ot.add(aa, bb);
		System.out.println(Arrays.toString(aa));
		System.out.println(Arrays.toString(bb));
		
	}

}
