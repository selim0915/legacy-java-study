
public class Ex08_Static_Method {

	int iv =100;
	static int cv =200;
	
	void method(int a) {
		System.out.println("일반함수"+a);
	}
	
	static void smethod() {
		System.out.println("static함수");
	}
	public static void main(String[] args) {
		
		Ex08_Static_Method e = new Ex08_Static_Method();
		System.out.println("e.iv: "+e.iv);
		e.method(1);
		Ex08_Static_Method.smethod();
		
		System.out.println("Ex08_Static_Method.cv: "+Ex08_Static_Method.cv);
		
		// *static함수의 목적:
		// *많이 쓰는 자원을 편하게 쓰기 위해서.
		//=>많이 쓰는 자원은 static으로 쓰는게 효율적이다.
		
		//static 함수는 heap에 올릴필요 없다.
		// new는 heap에 메모리를 생성하는 연산자.
	}

}
