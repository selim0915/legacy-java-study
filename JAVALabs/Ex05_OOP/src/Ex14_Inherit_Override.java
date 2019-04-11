/*
 * 
 */
class Parent{
	int x =100;
	void pmethod() {
		System.out.println("parent method");
	}
}

class Child3 extends Parent{
	int y =200;
	
	int x =2000; //c#: 재정의, 변수무시하기 
	
	void parent_x() {
		System.out.println(super.x); //부모가 그립다면 메서드, 생성자를 이용하며 super를 사용해서 호출한다.
	}
	
	@Override
	void pmethod() {
		System.out.println("부모 함수 재정의");
	}
	
	void parent_method() {
		super.pmethod();
	}
}

public class Ex14_Inherit_Override {

	public static void main(String[] args) {
		Child3 ch = new Child3();
		Parent pa =ch; //다형성
		//pa.y 접근 안된다.. 
		//상속 관계에서 부모타입의 참조변수는 자식타입의 참조변수가 가지고 있는 주소를 가질 수 없다.?
		System.out.println("ch.x: "+ch.x);
		ch.parent_x();
		ch.pmethod(); //재정의하면 재정의한 메서드가 나옴
		pa.pmethod(); //부모도 재정의 하면 재정의한 메서드가 나옴
		
		ch.parent_method(); //새로운 메서드를 재정의 해서 super를 사용하여 부모함수를 호출한다.
	}

}
