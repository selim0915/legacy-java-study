package kr.or.bit;

public class Moter {

	private String brandname;
	private int modelnum;
	private static int su;
	
	//초기화는 선풍기의 클래스안에서 파라메타 값을 받아 초기화 해야한다.
	
	
	
	
	
	public void info() {
		count();
		System.out.println("브랜드명: "+ brandname 
				+ " ,모델명: "+modelnum
				+ " ,누적 수: "+su);
	}
	
	public void count() {
		su++;
	}
	
}

