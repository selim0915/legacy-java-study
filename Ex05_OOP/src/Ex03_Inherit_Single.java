class Tv{
	boolean power;
	int ch;
	
	void power() {
		this.power = !this.power;
	}
	
	void chUp() {
		this.ch++;
	}
	
	void chDown() {
		this.ch--;
	}
}

class Vcr{ //비디오 플레이어
	boolean power;
	
	void power() {
		this.power = !this.power;
	}
	
	void play() {
		System.out.println("재생하기");
	}
	
	void stop() {
		System.out.println("정지");
	}
	
	void rew() {
		System.out.println("되감기");
	}
	
	void ff() {
		System.out.println("빨리감기");
	}
}
//설계도: tv, vcr 를 가지고 있다.
//vcr기능과 tv기능을 다 갖춘 설계도를 작성 해 주세요,
//tvVcr제품을 만들고 싶어요

//설계도 재사용..
//class TVVcr extends tv, vcr{} (xxxxx:다중상속 안됨)

//Tv extends Vcr
//TvVcr extends Tv (계층적 상속)

//전제조건: 상속1만 사용하기
//여러개의 클래스를 엮어주는 건 상속, 포함 2개 뿐이다.
//고민: TvVcr을 만들 때 어떤 놈을 상속하고 어떤 놈을 포함하는지 정하잣..
// => 이럴땐, 주기능(tv)과 보조기능(vcr)을 판단하자.
//비중이 높은 클래스를 상속받는 것이 좋다.

class TvVcr extends Tv {
	Vcr vcr;
	
	TvVcr(){
		vcr = new Vcr(); //포함관계
	}
}

//class 자판기{
//	음료수[] 음료 = ["사이다","콜라"]
//}
//
//class 음료수{
//	
//}

public class Ex03_Inherit_Single {

	public static void main(String[] args) {
		TvVcr t = new TvVcr();
		t.power();
		System.out.println("티비 전원 상태:" + t.power);
		t.chUp();
		t.chUp();
		System.out.println("티비 채널: "+ t.ch);
		
		t.vcr.power(); //포함관계 불러오기
		//t.vcr.power();
		System.out.println("vcr 전원 상태:" + t.vcr.power);
		
		t.vcr.play();
		t.vcr.stop();
		t.vcr.power();
		t.power();
		System.out.println("티비 전원 상태:" + t.power);
		System.out.println("vcr 전원 상태:" + t.vcr.power);
	}

}
