package kr.or.bit;
/*
 * *배우고 싶은 내용: 요구사항은 항상 변한다. 요구사항에 맞게 대응하는 프로그램을 만들어야 한다.
 * 
 * 우리 회사는카드를 만들어서 판매하는 회사입니다.
 * 고객의 요펑에 따라 카즈 53장을 제작하게 되었습니다.
 * 
 * 요구사항
 * 카드는 각각 카드번호를 가지고 있고, 그리고 모양도 가지도 있다.
 * 카드는 크기를 가지고 있다. (크기: 높이와 너비를 가지고 있다.)
 * 카드의 정보를 확인하는 기능을 가지고 있다.
 * 
 */
public class Card {
	public int number;
	public String kind;
	
	//모든카드에 크기는 고정
//	public int h =50;
//	public int w =20;
	public static int h=50;
	public static int w=20;
	
	//기능(정보)
	public void cardInfo() {
		System.out.printf("카드번호: %d, 모양: %s, 높이: %d, 넓이: %d\n",number, kind, h,w);
	}
}
