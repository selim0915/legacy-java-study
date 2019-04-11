//static method
/*
 * 일반함수는 일반자원과 static자원을 모두 사용할수있다.
 * static함수는 static자원만 사용이 가능하다.
 * 
 */
class StaticClass{
	int iv;
	static int cv;
	
	//일반함수
	void m() {
		//일반함수 m()에서 iv값을 처리할 수 있다 (ㅇ)
		iv =100;
		//일반함수 m()에서 cv값을 처리할 수 있다 (ㅇ)
		// static 자원은 일반자원보다 먼저(항상) 메모리에 로드된다.
		cv=200;
		
		System.out.println("iv: "+iv+ "cv: "+cv);
	}
	
	static void sm() {
		//일반자원인 iv자원을 사용할 수 있다 (x)
		//iv =200; sm()함수가 항상 일반자원보다 먼저 memory로딩
		//생성시점의 문제
		//끼리끼리 맞추면 에러는 없다.
		cv=300;
		System.out.println("cv: "+cv);
	}
}

public class Ex07_Static_Method {

	public static void main(String[] args) {


//		StaticClass s = new StaticClass();
//		s.m();
//		//StaticClass.cv=200;
//		s.sm();
		
		StaticClass.sm();
	}

}
