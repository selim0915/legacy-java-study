/*
 * 자바는 기본적으로 제공하는 8가지 기본타입을 가지고 있다.
 * 8가지 기본타입으로 값을 저장할 수 있다.
 * tip) 값, 주소값을 저장할 수 있다.
 * 
 * 숫자) 정수(음의정수, 0, 양의정수) -> byte(-128~127)
 * 							-> char(한문자를 표현하는 자료형: 한문자2byte), nuicode
 * 							-> short(c언어의 호환성)
 * 							-> int (-21억~21억) *java에서 정수연산의 기본타입이 된다, 4byte
 * 							-> long(8byte) int보다 큰 값을 다룸
 * 		실수(부동소수점)  -> float(4byte), double(8byte)
 * 					-> 정밀도가 높다 = 표현범위가 크다 (double이 더 범위가 큼)
 * 					-> *java에서 실수연산의 기본타입이다.
 * 		boolean(true, false) -> 프로그램의 논리를 제어할 때 사용한다.
 * 							
 * 문자) 문자열의 표현은 어떤 타입에 담을까? ex "홍길동"
 * 		String -> String은 클래스이다.
 * 				-> String의 원래 사용법은 String s = new String("hello");
 * 				-> 대부분 사용하는 법은 String s = "hello";
 * 
 * 값타입: 값타입은 값이 들어가는 타입(숫자, 논리)
 * 참조타입: 클래스, 배열(값이 주소 번지로 저장된다)
 * 
 * class = 설계도 = 타입 (클래스는 타입이다)
 * class는 작은 타입을 모아 놓은 큰 타입이다.
 * class는 반드시 메모리에 올려놓고 사용해야한다. (클래스는 설계역할이라)
 */
class Car{
	String color; // 자동차에 색상을 담겠다.
	int window; // 자동차에 창문갯수를 담겠다.
}
/*
 * 최소한의 설계도에는 (상태정보)속성+(기본)행위 를 가지고 있어야 한다.
 * 속성과 상태정보는 변수로 표현한다.
 * 메모리(메인함수?)
 */

public class Ex03_DataType {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Car c = new Car();
		System.out.println("c라는 변수의 값: " + c); //Car@15db9742 변형된 주소값 출력 => 참조타입
		int i =200;
		System.out.println("i라는 변수의 값: " + i); //200 i값이 출력
		
		Car c2;
		c2=c;
		System.out.println("c2라는 변수의 값: " + c2);
		System.out.println("c==c2: " + (c==c2) + "\n");
		
		int j;
		//j=i;
		System.out.println("i라는 변수의 값: " + i);
		//System.out.println("j라는 변수의 값: " + j);
		j=1000;
		System.out.println("i라는 변수의 값: " + i);
		System.out.println("j라는 변수의 값: " + j);
		
		Car c3;
		c3 = new Car();
		//지역변수이기 떄문에 똑같이 참조변수도 선언과 할당을 분리할 수 있다.
		System.out.println("c3라는 변수의 값: " + c3); //Car@6d06d69c 다른 주소값
		c3.color = "gold";
		c3.window = 10;
		System.out.println("c3 : " + c3.color +" : "+ c3.window); 
		
		int a, b;
		a=10;
		b=20;
		
		int k =1111;
		int k2 = k;
		k =2222;
		System.out.println("k: "+k+ ", k2: "+k2+ "\n");
		
		//int scope(-21~21)
		//int number = 10000000000; //컴파일 에러
		// *정수 리터럴에 표현범위는 int 값이다.
		long number = 10000000000L; //정수 리터럴(기본)를 Long으로 인지하게 만들자.
		System.out.println("long타입: "+number);
		
		//char는 내구적으로 정수값을 가지고 있다.(2byte)
		//char로 문자를 표현할 수 있다.
		// 1. 한문자를 사용할 때 2byte로 통일했다.
		// 2. 한글 한자(2byte), 영문자, 숫자, 특수문자, 공백(1byte)
		
		//java 문자열:"가", String="가"
		//java 문자: char = '가'
		//char는 두글자를 쓸 수 없다.
		char single = '가';
		System.out.println(single);
		char ch = 'A'; // 두글자 이상 컴파일 에러남
		System.out.println((int)ch);// casting = 타입변환 //아스키 코드표현
		//A=65; ,a=97;
		char ch2='a';
		System.out.println(ch2);
		System.out.println((int)ch2);
		//반대의 경우
		int ch3 =65;
		char ch4 = (char)ch3; //명시적 형변환
		System.out.println(ch4);
		int cint2 = ch4; //암시적 형변환 (사실 컴파일러가 변환시켜주는거, 성능저하되긴 한다)
		
		
		/*
		 * today point
		 * 변수가 가진 [값]보다 [타입]을 중요하게 봐야한다.
		 * 타입의 크기를 확인한다.
		 * 큰 타입에 작은 타입을 넣을 수 있다.
		 * 작은 타입에는 큰 타입을 넣을 수 없다.
		 */
		
		int intvalue =103029970;
		byte bytevalue = (byte)intvalue; //손실이 생긴다.
		System.out.println(bytevalue); //랜덤으로? 값이 바뀐다.
		
		int intvalue2 =10; //정수리터럴값은 항상 4byte 얼만큼 값이 있는지 상관없이
		byte bytevalue2 = (byte)intvalue2; //대신 강제형변환을 하면 범위안에 있는 숫자이기 떄문에 값은 바뀌지 않음
		System.out.println(bytevalue2+ "\n"); 
		//위, 아래 모두 그렇게 사용하지 않는것이 좋다.
		
		//String(문자열 타입)
		// String str = new String("홍길동");
		// String은 설계될때부터 *일반 자료형(값타입)처럼 사용해도 문제가 없다.
		String str = "hello";
		System.out.println(str);
		String str2 = str + "hi";
		System.out.println(str2);
		String str3 = "1000";
		String str4 = "10";
		String result = str3 + str4; // 문자열+문자열 (+)를 결합연산자로 사용
		System.out.println(result+ "\n");
		
		System.out.println("100"+100); //문자열+숫자 는 숫자가 문자로 변한다. // 원래 둘중에 누군가는 변해서 하나의 타입으로 바뀜
		System.out.println(100+"100");
		System.out.println(100+100+"100");
		System.out.println(100+(100+"100"));
		System.out.println(100+"100"+100+ "\n");
		
		//실수(부동소수점)
		//float(4byte)
		//double(8byte) *실수의 기본 리터럴은 double(정밀도가 더 높기 떄문)
		float f = 3.14f;//점미사 F,f를 붙여서 folat타입으로 사용
		float f2 = 1.123456789f;
		System.out.println(f);
		System.out.println(f2); //1.1234568 7자리까지 출력(반올림)
		
		double d = 1.123456789123456789;
		System.out.println(d); //1.1234567891234568 16자리(반올림)
		double d2 = 100;
		System.out.println(d2); //컴파일러가 내부적으로 자동으로 형변환 (암시적 형변환)
		//정수로 적고 실수형으로 받아도 실수형으로 바꿔줌
		
		/*
		 * 123123 숫자리터럴은 int로 판단
		 * 1.123123 실수리터럴은 double로 판단
		 */
		
		double d3 = 100;
		int i5 =100;
		double result2 = d3 +i5;
		// 1. double result2 = d3+i5; //=> 데이터 손실없이 저장됨
		// 2. int result2 = (int) d3+i5; //=> 지금은 문제가 없을 수 있지만, 값이 손실될 수 있다.
		// 3. int result2 = (int)(d3+i5); //=> 지금은 문제가 없을 수 있지만, 값이 손실될 수 있다.
		
		/*
		 * 작은타입+큰타입 => 큰타입
		 * int+double = double
		 * int+short =int
		 * 타입간 형변환 >> 변수가 가지는 값을 보지 말고 변수의 타입을 보자.
		 */
		
		int i6 = 100;
		byte b2 = (byte)i6;
		System.out.println(i6);
		
		byte b3 = 20;
		int i7 = b3; //내부적 형변환 되었다. (casting)
	}

}
