import java.util.ArrayList;

/*
 8가지 기본타입: 값타입 : JAVA API가 제공한다.
 
 8가지 기본타입에 대해서 객체형태로 사용가능하도록 만든 클래스
 ex) void run(Integer i)
 
 *기본형타입도(8가지) 객체형태로 다루어져야 하는 경우가 있다.
 1. 매개변수로 객체타입이 요구될 때
 2. 기본형 값이객체타입으로 저장되어야 할때
 3. 객체간의 비교가 필요할 때
 4. wrapper클래스는 (타입정보: 최소크기, 최대크기, )를 가지고 잇다.
 
 
 이때 8가지 기본타입에 대한 wrapper클래스를 사용한다.
 
 */


public class Ex10_wrapper_Class {

	public static void main(String[] args) {
		int i=100; //값타입
		Integer n = new Integer(500); //주소타입
		System.out.println("i: "+i);
		System.out.println("n: "+ n.toString());
		
		ArrayList<Integer> li = new ArrayList<Integer>();
		li.add(100);
		li.add(200);
		for(int r : li) {
			System.out.println(r);
		}
		
		Integer i3 = new Integer(100); //Integer = wrapper클래스
		Integer i4 = new Integer(100);
		System.out.println(i3==i4); //false 
		//equals 를 Integer클래스 재정의(값을 비교)
		System.out.println(i3.equals(i4)); //true
		
		
		
		//static 메소드
		Integer t = new Integer(500);
		integerMethod(t);
		intMethod(t);
		
	}
	
	static void integerMethod(Integer i) {
		System.out.println("Integer param: "+ i);
	}
	
	static void intMethod(int i) {
		System.out.println("int param: "+i); //원시타입int
	}

}
