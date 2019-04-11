//변수 <-> 상수
//변수: 변하는 값
//상수: 변하지 않는 값

//시스템에서 한번 값이 정해지면 변경되지 말아야 될것 ex)시스템 버전 번호
//일반 상식선에서 값이 정해지면 변경 되지 말아야 할것 ex)고유값, 주민번호, PI

//상수의 관용적 대문자
//java: final int NUM =100;
//c#: const int NUM =100;


//fianl 키워드
//클래스앞에: final class Car{} : >> 상속 불가 (extenads 불가)   클래스의 fianl이 붙여지면 상속 불가..
//함수 앞에: public final void print(){} : >> 상속 관계에서 재정의 할수 없다. final에서 재정의 못하게 하는 방법, private, fianl 2가지..

class Vcard{
	final String KIND = "heart";
	final int NUM=10;
	void method() {
		//시스템 상수는 static, final double PI=3.1415.. 이렇게 정의 되어잇다.
		//전역으로 못 고치게..
		System.out.println(Math.PI);
	}
}

//질문: Vcard타입으로 만드는 모든 객체는 결국 같은 상수값을 가진다. OO
//객체마다 다른 상수값을 갖고 싶어요..! 
//=>
//상수: 값이 한번 설정되면 변경 못한다..
//필드 선언은 값을 할당하지 않고, 생성자로 값을 받되, 디폴트 생성자를 만들지 않아야 한다.
class Vcard2{
	final String KIND; //객체 만들고 초기화 안해서..
	final int NUM;
	
//	Vcard2(){
//		this.KIND = "heart";
//		this.NUM =10;
//	}
	
	//강제적으로 초기화 할 수 있는 코드는 제공해 준다면??..?(파라미터 생성자 )
	Vcard2(String kind, int num){
		this.KIND=kind;
		this.NUM =num;
	}
}

public class Ex07_Final {

	public static void main(String[] args) {
		Vcard v = new Vcard();
		//v.KIND ="AAA";
		System.out.println(v.KIND);
		v.method();
		
		Vcard2 v2 = new Vcard2("space", 1);
		System.out.println(v2.KIND +"/" + v2.NUM);
		
		Vcard2 v3 = new Vcard2("heart", 10);
		System.out.println(v3.KIND +"/" + v3.NUM);
	}

}
