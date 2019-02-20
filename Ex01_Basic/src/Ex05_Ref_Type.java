//클래스는 설계도이다. 
//클래스는 타입니다.
//클래스= 설계도= 타입
//클래스는 반드시 메모리에 올려야 사용가능하다.
//(설계도를 기반으로 땅에 아파트를 짓는것)
//new를 통해서 설계도를 기반으로 구체화된 산물을 만든다.

//설계도(속성+기능)를 가져야한다.
class Apt2{
	int door; // 객체변수 (instance variable) : 초기화
	int window;
}

public class Ex05_Ref_Type {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		int i =100;
		//Apt2는 사용자정의타입이된다. (여러개의 타입이 모아져있는 형태)
		Apt2 lg = new Apt2(); //lg변수는 Apt2객체의 주소값을 갖는다.
		// lg : 참조변수: 주소값을 가진변수(객체변수)
		System.out.println("lg변수값의 주소: "+lg);
		Apt2 ssapt = lg; //lg가 가지는 주소 ssapt에 줌
		System.out.println("ss변수값의 주소: "+ssapt);
		//참조변수의 할당은 주소값 할당
		
		ssapt.window = 50;
		System.out.println("창문의 갯수" + ssapt.window + "," + lg.window);
		
		lg.door =10;
		System.out.println("창문의 갯수" + ssapt.door + "," + lg.door);
	}

}
