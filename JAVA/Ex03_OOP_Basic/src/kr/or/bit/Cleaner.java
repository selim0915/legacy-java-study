package kr.or.bit;

public class Cleaner {
	
	public String brand; //제조회사
	public String modelname; //모델명
	public String color; //색상
	public String Producedata; //제조일자
	public int batterysize; //베터리크기
	//public int Electricity; //정격 소비 전력
	
	public int level; //흡입력(단계별)
	public boolean power; //전원
	public int batterynow; //잔여 배터리(무선)
	public int motorspeed; //현재 모터속도

	public Motor motor; //모터
	public Brush brush; //브러쉬
	public Charge charge; //충전기
	public Filter filter; //필터
	
	//전원 on/off
	public void poweron() {
		power = true;
	}
	
	public void poweroff() {
		power = false;
	}
	
	//흡입 단계
	public void levelmethod(int a) {
		if(a ==1) {
			level = 1;
		} else if(a ==2) {
			level =2;
		} else if(a==3) {
			level =3;
		} else {
			System.out.println("1,2,3 으로 입력");
		}
	}
	
	//브러쉬 교체
	public void brushmethod(String a) {
		System.out.println(a+ "로 교체 되었습니다.");
	}
	
	 	
}
