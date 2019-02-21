package kr.or.bit;

public class InitTest {
	public static int cv =1;//static변수, class변수(어느변수에 소속도 아닌거)
	public int iv=1; //명시적초시화( 직접 개발자가 명시했다. 적었다 )
	
	static { cv=2;}// static초기화 블럭, class초기화 블럭
	{ iv=2; } //instance변수초기화 블럭, 객체변수초기화 블럭
	
	//생성자
	public InitTest() {
		//특징 
		//1.함수이름이 클래스와 같다
		//2. 클래스이름에 ()추가
		//3. 인스턴스 초기화가 목표
		iv =3;
	}
}
