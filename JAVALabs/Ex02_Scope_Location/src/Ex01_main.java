import kr.or.bit.Apt;
import kr.or.bit.Emp;

/*
 * 접근자?
 * 클래스 = 설계도 = 타입이다.
 * 클래스의 구성요소: 필드(고유값, 상태값, 참조값), 함수(기능)
 * 접근자(한정자): public, private, default(쓰지않는것), protected(상속)
 * 
 * 1. public class Test{}
 * 
 * 2. class Test{} >> default 접근자가 생략되었다.
 * (default 접근자:  같은 폴더 안에 공유가능, 다른폴더에 있으면 사용불가
 * 
 * 3. default class는 : 같은 폴더내에 다른클래스의 참조목적, 연습 목적으로 사용, 같은 폴더에서 만들 시
 * 
 * 4. 하나의 자바파일은 (a.java) 여러개의 클래스를 가질 수 있다.
 * >> Ex01_main.java
 * >> class Test{} //그러나 하나의 클래스에 새로운 클래스를 같이 쓰는건 옳지않다.
 * >> 단 하나의 자바파일에 여러개의 클래스를 만들떈, public은 하나만 사용
 */

class Test{ //default class Test
	int i; //default int i
	
	void print() { //default void print() 
		System.out.println("default");
	}
}

public class Ex01_main {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Person p = new Person();
		p.name ="연습";
		
		//kr.or.bit만에 있는 Car클래스 사용법\
		Apt apt = new Apt();
		apt.aptname= "현대";
		
		Test t = new Test();
		t.i =100;
		
		Emp e = new Emp();
		e.setEmpno(-8888);
		System.out.println(e.getEmpno());
		
		e.mgr = -8888;
		System.out.println(e.mgr);
	}

}
