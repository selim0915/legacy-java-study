

class Man{
	String name;
	int age;
}


//  함수에서 return type 또는 parameter자원으로 사용할수 있는거
//  1. 8가지 기본타입
// 2.String  ex: String m(String str){return str;}
// 3.Array   ex: int[] m(int[]arr){return arr;}
//  4.사용자 정의 클래스(Type)  ex: Man m(Man s){return s;}
class Test{
	Man add(Man m) {
		m.name ="누구";
		m.age =100;
		
		return m;
	}
	
	Man add(Man x, Man y) {
		y.name = x.name;
		y.age = x.age;
		return y;
	}
	
	Human[] add(Human[] human) {
		//객체배열도 가능.
		
		Human[] h = new Human[human.length];
		return h;
	}
}

public class Ex12_Method_overloading_Object {

	public static void main(String[] args) {
		Test t = new Test();
		Man man = new Man();
		Man man2 = t.add(man);
		System.out.println(man2.name + "/" + man2.age);
		System.out.println(man==man2);
		
		Man man3 = t.add(new Man(), new Man());
		System.out.println(man3.name+ "/" + man3.age);
		System.out.println(man3==man2);
		
		
		
	}

}
