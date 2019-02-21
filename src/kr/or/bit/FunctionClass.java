package kr.or.bit;
/*
 * 함수는 기능의 최소단위이다.
 * 함수의 종류
 * 
 * 1. void이면서 parameter가 존재하는 것
 * 		=> public void print(String str) { System.out.println(str); }
 * 2. void이면서 parameter가 없는것
 * 		=> public void print() { System.out.println("hi"); }
 * 3. return type이 존재하면서 parameter가 존재하는 것
 * 		=> public int call(int i) { return i+100; }  
 * 4. return type이 존재하면서 parameter가 없는덕
 * 		=> public int call() { return 100; } 
 * 
 * void: 반환 값이 없다를 의미 : retrun value가 없다.
 * return Type: [8가지 기본타입] + String + 사용자 정의 class + 배열(Array) + Collection + Interface
 * 함수가 retrun tyPe(ex public int calc(){ return 100;}
 * 반드시 블럭안에 {return }구문을 가지고 있어야 한다.
 * 
 * parameter(매개변수): [8가지 기본타입] + String + 사용자 정의 class 
 * 							+ 배열(Array) + Collection + Interface
 * 
 * 함수는 반드시 호출 되어야 실행 한다.
 */

public class FunctionClass {
	
	//함수이름은 의미있는 단어의 조합이어야 한다. 길어도 된다.
	public void m() {
		System.out.println("일반 함수: void, param(x)");
	}

	public void m2(int i) {
		System.out.println("param value: "+ i);
		System.out.println("일반 함수: void, param(o)");
	}
	
	//m3()을 호출하면 100을 돌려 받는다.
	public int m3() {
		return 100;
	}
	
	//정수 범위값을 넘지 않는 값은 돌려 줄 수 있다.
	public int m4(int data) {
		return data+100;
	}
	
	/*
	 * private 접근자 함수는?
	 * 어떤의미: class내부에서 다른 함수를 도와주는 역할 을 할떄, 
	 * 			다른 여러개가 가지는 공통적인 기능을 한곳에 함수에 모아서 기능을 제공하는 역할
	 * 
	 */
	private int operationMethod(int data) {
		return data *100;
	}
	
	public int sum(int data) {
		return operationMethod(data); //위에 코드가 적당
	}
	
	public int sum2(int data) {
		int result = operationMethod(data);
		return result;
	}
	
	//확장함수: 파라미터의 갯수가 여러개일 때
	// 전체 파라미터 갯수에 다 들어와야 한다.
	public int sum3(int i, int j, int k) {
		return i + j + k;
	}
	
	// Quiz
	//a와b 둘중에 큰값을 리턴하는 함수
	public int max(int a, int b) {
		return (a>b) ? a:b;
//		int result =0;
//		if(a>b) {
//			result = a;
//		} else if(a<b){
//			result = b;
//		} else {
//			System.out.println("값이 같다.");
//		}
//		return result;
	}
	
	public String concat(String s, String s2, String s3) {
		return s + "/" +s2 + "/"+s3 ;
	}
	
	//----------------------------------------------------------------//
	
	//클래스는 타입이다.
	//public int call() { return 100; }
	//public Tv call() { Tv t = new Tv(); return t;}
	//public Tv call() { return new Tv(); }//클래스타입은 클래스로 리턴 받는다. (주소값을 리턴해주는 것)
	
	//public void call(Tv t) {System.out.println(t.name); }
	//Tv tt = new Tv();
	//tt.name="삼성";
	//call(tt);

	public Tv objMethod() {
		//Tv타입을 갖는 주소값을 리턴받는다.0
//		Tv tt = new Tv(); //heap만들고 주소값 tt 할당
//		tt.brandname = "중저가";
//		return tt;
		
		return new Tv(); //heap만들고 주소값 리턴
	}
	
	public void objMethod2(Tv t) {
		System.out.println("Tv 타입 정보:" + t);
		System.out.println("채널 정보: " + t.ch);
		System.out.println("브랜드이름: " + t.brandname);
	}
	
	
	
	
	
	
	
	
}
