//다형성
//상속 관계에서의다형성

//다형성: 여러가지 성질, 형태를 가질수 있는 능력
//tip: c#:다형성안에 overloading, override 포함
//java: [상속관계]에서 하나의 [참조변수]가 여러개의 타입을 가질 수 있다. (다형성안에 overloading, override 굳이 포함XX)
//여기서 말하는 [참조변수]는 [보모타입]을 이야기합니다.
//조상클래스 타입의 참조변수로 여러개의 자식클래스 객체의 주소를 가질 수 있다.

//java: 자식은 부모에게 조건없이 드린다.
class Tv2{ //부모(일반화, 추상화된 공통자원)
	boolean power;
	int ch;
	
	void power() {
		this.power =!power;
	}
	void chUp() {
		ch++;
	}
	void chDown() {
		ch--;
	}
}

class CapTv extends Tv2{ //자기만에 고유한 기능 (구체화, 특수화)
	String text;
	String caption() {
		return this.text="현재 자막중입니다.";
	}
}

public class Ex10_Inherit_Poly {

	public static void main(String[] args) {
		CapTv tv = new CapTv();
		tv.power();
		System.out.println("전원: "+tv.power);
		tv.chUp();
		System.out.println("채널정보: "+tv.ch);
		System.out.println("자막처리: "+tv.caption());
		
		//Tv2 tv2 = new Tv2(); //tv만 객체를 따로만듬
		//이미 heap메모리에는 tv2타입 객체가 로드되어있다.
		
		Tv2 tv2 = tv; //자식타입의 주소를 부모타입에게 준 상태..
		//이럴땐, 자식건 보이지 않고 부모(자신)것만 보인다.
		System.out.println("주소값: "+tv.toString());
		System.out.println("주소값: "+tv2.toString());
		
		
		
		
		
	}

}
