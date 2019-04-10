/* 개발자 입장
 * 1. 인터페이스를 [다형성]입장에서 접근한다. (인터페이스는 부모타입이다)
 * 2. 서로 연관성이 없는 클래스에 대해서 하나로 묶는 기능 (부모가 동일하다)
 * 3. 사용자와 제공자의 관계
 *
 *
 *User 사용자, Provider제공자
 *
 *1. 상속(is a) :a extends b
 *2. 포함(has a): member field 형태로 a라는 클래스 안에 b라는 클래스가 들어 오는 것
 *				: 클래스 a {B b;}
 *3. 포함(has a): 함수 안에서 (객체 생성, 할당, 리턴) dependency 의존관계 
 *
 *
 *=연관관계
 *학교는 학생을 가지고 있다.(집합연관) class School{Student st}, class Student{}
 *자동차는 엔진을 가지고 있다.(복합연관) class Car{Engine en = new Engine();}
 *
 */

/*
  class B{}
  class A{
  	int i;
  	void print(B b){ //함수내 의존관계..
  	
  	}
  	
  	void print(){ //함수내 의존관계..
  		B b = new B();
  	}
  }
 */

interface Icall{
	void m(); //인터페이스 안에 함수는 모두 추상함수
}

class D implements Icall{

	@Override
	public void m() {
		System.out.println("D Icall 인터페이스의 m()구현");
	}
}

class F implements Icall{
 
	@Override
	public void m() {
		System.out.println("F Icall 인터페이스의 m()구현");
	}
}

//현대적인 프로그래밍 기법 : 다형성(인터페이스가 함꼐......)
//간접적인 기법(유연하다)
class C{
	void method(Icall ic) {
		ic.m();
	}
}

public class Ex05_User_Provider {

	public static void main(String[] args) {
		C c = new C();
		c.method(new D());
		c.method(new F());
	}

}
