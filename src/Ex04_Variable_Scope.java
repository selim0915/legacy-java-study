
//연습용 클래스 (Ex04_Variable_Scope.java안에 )
class Variable{
	int iv;
	/*
	 * 1. iv: memberfield, instance variable
	 * 2.		 만드는 목적: 정보를 담기위해(정보:상태,고유,참조(부품))
	 * 3.		특징: 초기값을 가지고 있다. (클래스안에 만들어 졌기 때문에), 초기화를 하지 않는다.(생성되는 객채에따라 다른값을 가지기 떄문에)
	 * 4.		생성시점: (memory에 올라가는 시점): Variavle이 new라는 연산자를 통해 heap에 객체를 만들고 나서,		
	 * 
	 * 초기값(기본값): 정수:0, 실수:0.0, BOOLEAN:false, 문자열=NULL
	 */
	static int cv;
	/*
	 * 1. cv: class variable, static variable, 공유자원 이라고 부름
	 * 2.		만드는 목적: 정보를 담기위해 => 생성되는 모든 객체가 공유하는 자원을 만든다. => 객체간 공유자원
	 * 3. 		특징: 접근방법이 특이하다(독자적인 접근법을 가지고있음) =>클래스이름.static자원(Variable.cv)
	 * 			=> 객체가 만들어 지지않아도 접근이 가능하다. (ex: Math.random())
	 * 4.		생성시점: 프로그램이 실행될 때 class loder system에 의해서 class area=mrthod area안에 정보를 올리고
	 * 					클래스가 올려진 클래스안에 static자원을 가지고 있다면, static자원도 메모리에 올린다(nenory load).
	 * 					=> static은 객체 생성이전에 메모리에 먼저 올라간다.
	 */
	void method() {
		int Iv=0; 
		/*l
		 * ocal variable 지역변수, 초기화필료
		 * 특징: 초기화가 반드시 필요하다
		 * 생성시점: 함수가 호출되면 생성됨, 함수가 종료하면 소멸 (stack에 저장)
		 */
	}
}

public class Ex04_Variable_Scope {

	public static void main(String[] args) {
		
//		Variable.cv = 100; //static변수
//		
//		System.out.println("Variable.cv : "+Variable.cv );
//		Variable v = new Variable();
//		v.iv = 200;
//		v.cv = 500;
//		System.out.println("v.cv: "+Variable.cv);
		
		System.out.println("Variable.cv : "+Variable.cv);
		Variable v = new Variable();
		System.out.println(v.cv);
		Variable v2 = new Variable();
		System.out.println(v.cv);
	}

}
