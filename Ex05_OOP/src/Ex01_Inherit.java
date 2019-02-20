/*
 * 객체지향언어(OOP) 3대 특징
 * 1. 상속성
 * 2. 다형성
 * 3. 캡슐화(은닉화)
 * 
 * [상속]
 * : java > child extends Base (child는 Base을 확장시킨다)
 * : c# >  child : Base 
 * 1.특징: 다중상속이 안됨(복잡성 때문에 사용한가기로,,), 단일 상속이 원칙
 * 위, 위 환경을 상속 받고 싶다면? => 계층적 상속을 사용해서 다중 상속을 구현한다.
 * )) 다중상속을 지원하는 유일한 자원이 있다 => Interface
 * 
 * 2. 의미: [재사용성] >> 반복적인 코드를 사용하지 않겠다. (부모가 가진 코드를 공통코드로..)
 * 단점: 초기 설계비용과 시간이 부담스러울 수 있다.
 * 
 * 재사용성을 고려해야할 때??? 설계단계 >> 비용(시간, 공통분모, 추상화)
 * 
 * 
 * 메모리에 올라가는 순서는 어떻게 될까?? //부모가 없으면 내것을 존재하지 않다.
 */

class GrandFather{
	public int gmoney=5000;
	private int pmoney =50000;
	//private가 되어있으면 2가지 입장에서 접근 안된다.
	//2. 참조변수 접근 불가
	//3.상속관계 접근 불가
	public GrandFather() { //생성자
		System.out.println("할아버지 생성자");
	}
}
class Father extends GrandFather{
	public int fmoney=1000;
	public Father() {
		System.out.println("아버지생성자");
	}
}
class Child extends Father{
	public int cmoney=100;
	public Child() {
		System.out.println("자식생성자");
	}
}

public class Ex01_Inherit {

	public static void main(String[] args) {
		Child c = new Child();
		System.out.println(c.gmoney); //할아버지 돈도 내돈
		System.out.println(c.fmoney); //아버지 돈도 내돈
		System.out.println(c.cmoney); //내돈은 내돈
		//System.out.println(c.pmoney); //private는 접근 불가! 상속도 접근 못함
	}

}
