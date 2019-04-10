//상속 관계에서 다형성

class Pbase{
	int p =100;
}

class Cbase extends Pbase{
	int c =200;
}

class Dbase extends Pbase{
	
}
//Cbase==Dbse클래스는 같은 부모이다
public class Ex11_Inherit_Poly {

	public static void main(String[] args) {
		Cbase c = new Cbase();
		System.out.println(c.toString());
		//다형성: 부모타입의 참조변수가 자식타입의 주소값을 가질 수 있다(단, 상속 관계에서)
		//그렇지만 메모리에 있는 모든 자원에 접근 하는 것이 아니라
		//자신의 타입(부모)에만 접근이 가능하다.
		
		Pbase p =c; //다형성
		System.out.println("p부모타입 변수: "+p);
		System.out.println("p를 상속한 c타입 변수: "+c);
		
		System.out.println(c.c +"/" +c.p);
		System.out.println("자식의 주소를 받은 부모는 자신의 것만 본다: "+p.p);
		
		Dbase d = new Dbase();
		p = d;
		System.out.println("p를 상속한 d타입 변수: "+d);
		System.out.println("p부모타입 변수: "+p);
		
		//p라는 부모타입의 변수는 d의 주소도 가지고, c의 주소도 가질 수 있다.
		//c,d는 같은 부모를 가지고 있다
		
		/////////////////////////////////////////
		
		
		
		Dbase dd = (Dbase)p; // 부모는 (상위타입)=>(하위타입)인 자식에게 ..
		//부모타입의 주소값을 자식타입에게 전달 할 때는 (상위=>하위) 일땐 캐스팅하여야 한다.
		//반드시 하위 타입에 맞는 캐스팅을 하여야 한다.
	}

}
