/*
 인터페이스(interface)
 
 범용적 의미
 1. 약속, 표준, 규칙, 규약을 만드는 행위
 ex) 나사, 신발사이즈
 ex) iso 표준..
 
 
 소프트웨어 개발
 -> 인터페이스는 개발의 최상위 단계( 무에서 유를 만드는 것 : 설계표준)
 -> 약속을 정의 하는 행위

개발자 입장
1. 인터페이스를 [다형성]입장에서 접근한다. (인터페이스는 부모타입이다)
2. 서로 연관성이 없는 클래스에 대해서 하나로 묶는 기능 (부모가 동일하다)

Interface
1. 실제 구현부가 없다. : 실행블럭이 없다. : 추상자원만 가지고 있다. >> void move(int x, int y);
2. 표준화 된 설계를 보장(완벽한 강제성 보장 가능)
3. 공통적 설계



JAVA API
(개발자가 필요한 인터페이스를 가지고 있다) : 자바 API가 제공하는 모든 클래스는 인터페이스 기반으로 설계되어 있다.
>> Collection (Vector, ArrayList, HashSet, HashMap, Stack, Queue ..)

1.생성방법
상수(final) : public static final int NUM=0 , [public static final] 생략
함수 (method) : public abstract void run(); [public abstract] 생략
함수 (nethod) : public abstract String move(int x, int y) ; [public abstract] 생략

인터페이스는 구현이 없다.


1. 인터페이스는 객체 생성 불가 (상수를 제외한 나머지 추상함수)
2. 구현을 통해서만 사용이 가능 (class Test implement Ia ..)
3. 인터페이스끼리는 다중 상속이 가능 하다. (class Test implements Ia, Ib, Ic ...)
4. 인터페이스끼리는 상속이 가능하다.(Ia extends Ib :큰 규칙을 만들 수 있다)
5. 인터페이스도 하나의 타입이다.
 */

interface Ia{
	//상수( 시스템 자원값 입력 가능)
	public static final int VERSION=1;
	// int VERSION=1;
	// [public static final] = defualt
	String GENDER="남";
	
	public abstract String print(); //구현부 없다
	// String print();
	// [public abstract] = default
}

interface Ib{
	int AGE=0;
	void info();
	String value(String s);
}

class Test extends Object implements Ia, Ib{

	@Override
	public void info() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public String value(String s) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String print() {
		// TODO Auto-generated method stub
		return null;
	}
	
}

public class Ex04_Interface {

	public static void main(String[] args) {
		Test t =new Test();
		Ia ia =t; //인터페이스를 다형성으로 바라보면 편하덴다..
	}

}
