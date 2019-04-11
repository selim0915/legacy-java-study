package kr.or.bit;


//Protected목적: 상속관계에서 재정의
//당신이 필요하다면 재정의 하세요.. 아마 필요할겁니다..

//공통: 날수잇다, 빠르다
public class Bird {
	public void fly() {
		System.out.println("i am fly");
	}
	
	//재정의 하면 좋겠어..
	protected void movefast() {
		fly();
	}
}
