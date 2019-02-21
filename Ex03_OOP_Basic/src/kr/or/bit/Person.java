package kr.or.bit;
//class는 타입이다. 타입이란 여러개를 포함하는 느낌 == 설계도
//설계도의 기본 구성요소 : 속성 + 행위
//속성(변수, 상태/고유/객체)+행위(함수)
//**속성이 하나의 값으로만 표현 안된다면, 다시 클래스타입으로 만든다.

public class Person {
	//속성
	public String name; //instance variable(member field)
	public int age;
	
	//기능
	public void print() {
		//(call호출에 의해서 동작)
		System.out.println(name  + "/" + age); 
	}
}
