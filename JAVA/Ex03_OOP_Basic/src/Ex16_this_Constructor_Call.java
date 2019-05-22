/*
 * 2. this(객체>> 생성자를 호출하는 this)
 * 원칙 : 생성자는 객체 생성시 한개만 호출
 * =>  예외적으로 this를 사용하면 여러개의 생성자 함수를 호출 가능
 * 
 * 생성자안에 있는 코드가 반복적으로 사용된것이 맘에 들지 않는다.
 *default: this.color = "red";
 *overloding: this.color = color;
 *
 *할당을 한번하면 좋겠다...
 *방법이 있을까??
 *
 *
 */

class Zcar {
	String color;
	String geartype;
	int door;

	Zcar() { // 빈 껍데기로 만들면 기본 값
//		this.color = "red"; //필드 초기화
//		this.geartype = "auto";
//		this.door =4;
		this("red", "auto", 4); // 자기 자신을 호출(생성자 함수를 부를 수 있다)
		System.out.println("default constructor");
	}

	public Zcar(String color, String geartype, int door) {
		this.color = color;
		this.geartype = geartype;
		this.door = door;
		System.out.println("overloding constructor");
	}

	void print() {
		System.out.println(this.color + ", " + this.geartype + ", " + this.door);
	}
}

//자동차 영업사원 (자동차 판매 시 기본 옵션): default , 기본값...
class Zcar2 {
	String color;
	String geartype;
	int door;

	Zcar2() {
		this("red", 2); //가지고 있는 값을 가지고 블록을 나와서 아래 생성자를 다시 만난다.
		// 매게변수 갯수에 해당하는 생성자 위치로 다음 이동,
		System.out.println("default constructor");
	}
	
	Zcar2(String color, String geartype, int door) { //색상, 기어, 문 선택가능
		this.color = color;
		this.geartype = geartype;
		this.door =door;
		System.out.println("overloding constructor param3개");
	}
	
	Zcar2(String color, int door) { //차량의 색상과 문의 갯수는 선택 가능
		this(color, "auto", door);
		System.out.println("overloding constructor param2개");
	}

	
	
	void print() {
		System.out.println(this.color + ", " + this.geartype + ", " + this.door);
	}
}

public class Ex16_this_Constructor_Call {

	public static void main(String[] args) {
		Zcar z = new Zcar(); // 기본값
		z.print();

		Zcar z2 = new Zcar("blue", "auto", 10); // 오버로딩
		z2.print();
		System.out.println();
		
		
		
		Zcar2 car = new Zcar2();
		car.print();
		System.out.println();
		
		Zcar2 car2 = new Zcar2("gold",2);
		car2.print();
		System.out.println();
		
		Zcar2 car3 = new Zcar2("pink", "manual",5);
		car3.print();
	}

}
