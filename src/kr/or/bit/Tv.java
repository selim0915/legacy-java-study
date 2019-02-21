package kr.or.bit;
/*
 * 요구사항 정의
 * TV는 채널정보를 가지고 있다. (예를 들면 1~250번까지의 채널)
 * TV는 브랜드 이름을 가지고 있다. (예를 들면 삼성, LG)
 * TV는 채널전환 기능을 가지고 있다. (채널을 변경할수있다. *한 단계씩만) -기능2개 필요
 * TV는 전원을 가지고 있다. (on/off)
 */
public class Tv {
	 public int ch; //public int ch =1;
	 public String brandname;
	 public boolean power; //true-on, false-off;
	 
	 public void ch_up() {
		 //member filed 상태값
		 if(power == true) {
			 ch++;
		 } else {
			 System.out.println("전원 꺼져있음");
		 }
	 }
	 
	 public void ch_down() {
		 if(power == true) {
			 ch--;
		 } else {
			 System.out.println("전원 꺼져있음");
		 }
	 }
	 
	 public void power_on() {
		 power = true;
	 }
	 
	 public void power_off() {
		 power =  false;
	 }
}
