package kr.or.bit;

//디자인 패턴 (생성패턴)
//싱글톤: 객체를 하나만 만들어서 공유하겠다.

//하나의 객체를 생성해서(공유하겠다..)
// 이 패턴을 사용하면 하나의 객체만 사용하겠다는 보장이 필요하다.

//static(객체간 공유 자원)

//TODO : JDBC배울때 (DB연동하면서 배워보겟다..)
public class Singleton {
	private static Singleton p; 
	//Singleton 사용하면 method area영역엔 올라가있다.
	//그러나 private라 접근은 불가하다.
	
	private Singleton() {} //생성자를 private로 쓰다니..! 
	//생성자가() private여서 new가 보이지 않는다.
	//1. 생성자를 막아 버리깃..!
	
	public static Singleton getInstance() {
		if(p==null) {
			p=new Singleton(); //생성자 호출한것(private 클래스 내부에선 가능하니까..)
		}
		return p;
	}
}
