
class Vtest{
	int iv;
	void print() {
		System.out.println("instance variable: "+iv);
	}
}

class Apt{
	String color; // 사실 String은 클래스이다. 참조변수
	
	// 함수 (좀 특별, 이유: 함수이름이 클래스와 똑같아서) = 생성자함수(constructor)
	// 생성자: 파라미터 값을 이용하여 전역변수를 초기화시킴
	// Apt(){}; = defualt constructor
	Apt(String color2){ //(String color) = 파라메타
		this.color = color2;
		// this 는 객체를 가르킨다.
	}
	
	void aptPrint() {
		System.out.println("색상: " + this.color);
	}
	
}

public class Ex02_Variable {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Vtest t = new Vtest();
		t.print();
	
		Vtest t2 = new Vtest();
		t2.iv=300;
		t2.print();
		
		Apt sk = new Apt("gold");
		sk.aptPrint();
		
		Apt never = new Apt("red");
		never.aptPrint();
	}

}
