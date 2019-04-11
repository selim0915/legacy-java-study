/*
 * this
 * 1.객체 자신을 가르키는 것. =>  객체로 생성될 변수에 생성될거라고 가정하고 너의 자원을 명시할게.
 * 2. this 객체 자신(생성자를 호출할 수 있다):
 *   원칙은? => 객체 생성할 때  생성자 함수는 한개만 호출 가능
 *   *예외로 this를 사용하면 여러개의 생성자 호출이 가능
 */

class Test6{ //this를 클래스로 봐도 될까..? 클래스 필드를 가르키는 도구?
	int i;
	int j;
	Test6(){
		
	}
	Test6(int i, int j){
		this.i=i;
		this.j=j;
	}
	public void print() {
		System.out.println(i+", "+j);
	}
	public void thisPrint() {
		System.out.println(this);
		System.out.println(this.i + ", "+this.j);
	}
}

class SoCar{
	String color;
	String geartype;
	int door;
	
	SoCar(){
		this.color = "red";
		this.geartype = "auto";
		this.door =2;
	}
	
	SoCar(String color, String geartype, int door){
		this.color = color;
		this.geartype = geartype;
		this.door = door;
	}
	
	void print() {
		System.out.println(this.color + "/" + this.geartype
				+ "/" + this.door);
	}
}

public class Ex15_this {

	public static void main(String[] args) {
		Test6 t6 = new Test6(100,200);
		t6.print();
		System.out.println("t6: "+t6);
		t6.thisPrint();
		
		SoCar sc = new SoCar();
		sc.print();
		SoCar sc2 = new SoCar("bule","auto",4);
		sc2.print();
	}

}
